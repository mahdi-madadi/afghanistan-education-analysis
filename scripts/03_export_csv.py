"""Export all original coded values to CSV; verify a full read-back."""
import sys
import json
import shutil
from pathlib import Path
import pandas as pd
import numpy as np

ROOT = Path(__file__).resolve().parents[1]
sys.path.append(str(ROOT / '.tools' / 'python'))
import pyreadstat

OUT = ROOT / 'exports_csv'
OUT.mkdir(exist_ok=True)
manifest = []
for source in sorted((ROOT / 'raw_data').glob('*.sav')):
    df, meta = pyreadstat.read_sav(str(source), user_missing=True, apply_value_formats=False)
    target = OUT / (source.stem + '.csv')
    df.to_csv(target, index=False, encoding='utf-8-sig', na_rep='')
    # Disable automatic NA tokens so text such as "NA" stays literal text.
    restored = pd.read_csv(target, encoding='utf-8-sig', dtype=str, keep_default_na=False)
    assert list(restored.columns) == list(df.columns)
    assert len(restored) == len(df)
    for col in df:
        if pd.api.types.is_numeric_dtype(df[col]):
            missing = df[col].isna()
            assert restored.loc[missing, col].eq('').all(), col
            values = restored.loc[~missing, col].to_numpy().astype(float)
            np.testing.assert_allclose(values, df.loc[~missing, col].to_numpy(), rtol=1e-14, atol=0, err_msg=col)
        else:
            assert restored[col].equals(df[col].fillna('').astype(str)), col
    record = {'source': source.name, 'csv': target.name, 'rows': len(df),
              'columns': len(df.columns), 'bytes': target.stat().st_size,
              'full_readback_verified': True}
    manifest.append(record)
    print(json.dumps(record), flush=True)
shutil.copyfile(ROOT / 'docs' / 'data_dictionary.csv', OUT / 'data_dictionary.csv')
(OUT / 'export_manifest.json').write_text(json.dumps(manifest, indent=2), encoding='utf-8')
