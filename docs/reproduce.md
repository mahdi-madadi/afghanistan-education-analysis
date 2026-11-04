# Rebuilding the analysis

The repository contains code, documentation and aggregate
outputs. Source microdata and the PBIX are excluded.

## Requirements

- Power BI Desktop on Windows
- Python with pandas, numpy and pyreadstat
- Authorized access to Afghanistan MICS 2022–23 microdata

Obtain the source data from UNICEF and follow its access
and use conditions:
https://micsnada.unicef.org/index.php/catalog/310

## 1. Prepare the source files

Download or clone this repository.

Create a local raw_data folder and place hh.sav and hl.sav
inside it. These are the files required for this education
analysis. The other supplied questionnaires are optional.

Install the Python dependencies in your preferred Python
environment:

```bash
python -m pip install pandas numpy pyreadstat
```

From the project root, run:

```bash
python scripts/03_export_csv.py
```

This creates coded CSVs in exports_csv and verifies their
contents against the SPSS source.

## 2. Recreate the Power Query queries

In Power BI Desktop, open Transform data.

Create three blank queries with these exact names:
- hh
- hl
- EducationChildren

For each query, open Advanced Editor and paste the matching
code from the powerbi folder.

In hh and hl, replace the placeholder source path with the
actual path to the appropriate local CSV.

Keep query references unchanged. EducationChildren depends
on hl, and hl uses hh to retain members of completed households.

Enable load for hh and EducationChildren.
Disable load for hl.

Select Close & Apply.

## 3. Configure the model

Create an active relationship:

hh[HouseholdKey] (one)
→ EducationChildren[HouseholdKey] (many)

Use single-direction filtering from hh to EducationChildren.

Sort hh[WealthGroup] by hh[windex5].

## 4. Add measures and visuals

Create the measures documented in dax_measures.md.

Build:
- Sample-size and weighted-attendance cards
- A Residence slicer
- Weighted attendance charts by sex, residence, wealth and age

Use the screenshots and PDF in reports as layout references.
The .pq files recreate table preparation, not the visual layout.

Format attendance as a percentage.
Use a 0–100% scale for the attendance bar charts.

## 5. Validate

With all filters cleared, expect:

| Check | Result |
|---|---:|
| Sample children | 61,796 |
| Known attendance | 61,763 |
| Unresolved attendance | 33 |
| Weighted attendance | 40.58% |
| Urban sample children | 10,239 |
| Rural sample children | 51,557 |

Consult the project methodology for definitions and limitations.
