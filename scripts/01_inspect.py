"""Read-only inventory of raw SPSS files. No respondent-level data exported."""
import sys
from pathlib import Path
import json
import pandas as pd

ROOT = Path(__file__).resolve().parents[1]
sys.path.append(str(ROOT / '.tools' / 'python'))
import pyreadstat

out = ROOT / 'docs'
out.mkdir(exist_ok=True)
inventory = []
dictionary = []
for path in sorted((ROOT / 'raw_data').glob('*.sav')):
    df, meta = pyreadstat.read_sav(str(path), user_missing=True)
    inventory.append({'file': path.name, 'rows': len(df), 'columns': len(df.columns),
                      'file_label': meta.file_label, 'notes': meta.notes})
    for name in df.columns:
        dictionary.append({'file': path.name, 'variable': name,
            'label': meta.column_names_to_labels.get(name),
            'type': str(df[name].dtype), 'system_missing': int(df[name].isna().sum()),
            'unique_nonmissing': int(df[name].nunique()),
            'value_labels': json.dumps(meta.variable_value_labels.get(name, {}), ensure_ascii=False),
            'user_missing_rules': json.dumps(meta.missing_ranges.get(name, []))})
    print(path.name, len(df), len(df.columns), meta.file_label)
    print([(n, meta.column_names_to_labels.get(n)) for n in df.columns if any(t in n.lower() for t in ['weight','wgt','stratum','area','region'])])
pd.DataFrame(dictionary).to_csv(out / 'data_dictionary.csv', index=False, encoding='utf-8-sig')
(out / 'inventory.json').write_text(json.dumps(inventory, indent=2, ensure_ascii=False), encoding='utf-8')
