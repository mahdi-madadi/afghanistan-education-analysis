"""Initial structural checks only; does not clean or modify raw records."""
import sys, json
from pathlib import Path
ROOT = Path(__file__).resolve().parents[1]
sys.path.append(str(ROOT / '.tools' / 'python'))
import pyreadstat

results = {}
households = None
for filename in ['hh', 'hl', 'ch', 'fs', 'bh']:
    df, meta = pyreadstat.read_sav(str(ROOT / 'raw_data' / (filename + '.sav')), user_missing=True)
    key = ['HH1', 'HH2'] + ({'hh': [], 'hl': ['HL1'], 'ch': ['LN'], 'fs': ['LN'], 'bh': ['LN', 'BHLN']}[filename])
    r = {'candidate_key': key, 'duplicate_key_rows': int(df.duplicated(key).sum()),
         'null_key_rows': int(df[key].isna().any(axis=1).sum())}
    pairs = set(map(tuple, df[['HH1', 'HH2']].to_numpy()))
    if filename == 'hh': households = pairs
    else: r['households_absent_from_hh'] = len(pairs - households)
    status = {'hh':'HH46','ch':'UF17','fs':'FS17'}.get(filename)
    if status in df:
        r['interview_status'] = {str(meta.variable_value_labels.get(status, {}).get(k,k)):int(v) for k,v in df[status].value_counts(dropna=False).items()}
    if filename == 'hh':
        dates = df[['HH5Y_G','HH5M_G','HH5D_G']].dropna().astype(int)
        r['interview_date_min_components'] = list(min(map(tuple, dates.to_numpy())))
        r['interview_date_max_components'] = list(max(map(tuple, dates.to_numpy())))
    results[filename] = r
    print(filename, r)
(ROOT / 'docs' / 'structural_checks.json').write_text(json.dumps(results, indent=2, default=int), encoding='utf-8')
