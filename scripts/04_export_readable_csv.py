"""Create reading copies with SPSS value labels; retain coded exports separately."""
import sys
import json
from pathlib import Path
import pandas as pd

ROOT = Path(__file__).resolve().parents[1]
sys.path.append(str(ROOT / '.tools' / 'python'))
import pyreadstat

OUT = ROOT / 'exports_readable'
OUT.mkdir(exist_ok=True)
manifest = []
for source in sorted((ROOT / 'raw_data').glob('*.sav')):
    df, meta = pyreadstat.read_sav(str(source), user_missing=True)
    count = 0
    for col, mapping in meta.variable_value_labels.items():
        if mapping:
            # Replace only explicitly labelled values, preserving all other values.
            df[col] = df[col].map(lambda value: mapping.get(value, value))
            count += 1
    target = OUT / (source.stem + '_readable.csv')
    df.to_csv(target, index=False, encoding='utf-8-sig', na_rep='')
    actual = pd.read_csv(target, dtype=str, keep_default_na=False, encoding='utf-8-sig')
    assert actual.shape == df.shape
    assert list(actual.columns) == list(df.columns)
    for col in df:
        if pd.api.types.is_numeric_dtype(df[col]):
            missing = df[col].isna()
            assert actual.loc[missing, col].eq('').all(), col
            import numpy as np
            np.testing.assert_allclose(actual.loc[~missing, col].to_numpy().astype(float),
                df.loc[~missing, col].to_numpy(), rtol=1e-14, atol=0, err_msg=col)
        else:
            assert actual[col].equals(df[col].fillna('').astype(str)), col
    record = {'file': target.name, 'rows': len(df), 'columns': len(df.columns),
              'labelled_columns': count, 'readback_verified': True}
    manifest.append(record)
    print(json.dumps(record), flush=True)
(OUT / 'manifest.json').write_text(json.dumps(manifest, indent=2), encoding='utf-8')
