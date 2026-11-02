# Education Participation in Afghanistan

A Power BI portfolio project exploring education participation
by sex, residence, household wealth, and age using UNICEF
Afghanistan MICS 2022–23 data.

![Education dashboard](reports/education_overview.png)

## Project question

How did attendance during school year 1401 differ among
children aged 7–17 at interview?

## Key findings

Weighted attendance among children with known attendance
status was **40.58%**.

| Comparison | Attendance |
|---|---:|
| Urban | 55.21% |
| Rural | 35.86% |
| Male | 50.75% |
| Female | 30.23% |
| Poorest household wealth group | 21.55% |
| Richest household wealth group | 62.66% |

The richest–poorest gap was **41.11 percentage points**.
Female attendance among children aged 16–17 was **10.68%**.

These are descriptive associations, not evidence of causality.

## Tools and skills

- Power Query: column selection, data types, joins and category labels
- Data modelling: household-to-child relationships
- DAX: sample counts and weighted attendance measures
- Power BI: interactive charts, slicers and validation
- Python: SPSS inspection and CSV conversion

## Data preparation

1. Retained completed household interviews.
2. Created a household key using cluster and household numbers.
3. Matched household members to completed households.
4. Selected children aged 7–17 at interview.
5. Applied questionnaire skip rules to attendance.
6. Retained unresolved responses separately.
7. Validated counts and report filtering.

## Methodology

The analysis includes **61,796 sampled children**:
- **61,763** with known attendance status
- **33** with unresolved attendance

Attendance includes school, formal Islamic education and
early childhood education covered by the questionnaire.

Children recorded as never having attended education, with
the attendance question skipped, were classified as not attending.

Weighted attendance was calculated as:

**Sum of household weights for attending children ÷
sum of household weights for children with known attendance.**

Survey weights were applied to percentages. Sample counts
are unweighted; weight sums are not national population totals.

## Project files

- [Dashboard screenshot](reports/education_overview.png)
- [Findings screenshot](reports/education_findings.png)
- [Report PDF](reports/Afghanistan_Education_Portfolio.pdf)
- [Detailed project summary](reports/PROJECT_SUMMARY.md)
- [Data dictionary](docs/data_dictionary.csv)
- [Python scripts](scripts/)

## Limitations

- Ages refer to age at interview.
- Results are not official school-level net attendance rates.
- Cross-sectional comparisons do not measure individual dropout.
- Unknown and no-response attendance answers are excluded
  from attendance percentages.
- Confidence intervals and statistical significance were
  not calculated.

## Data source and access

[UNICEF Afghanistan MICS 2022–23 report](https://www.unicef.org/afghanistan/reports/afghanistan-multiple-indicator-cluster-survey-mics-2022-2023)

[UNICEF survey catalogue](https://micsnada.unicef.org/index.php/catalog/310)

Source microdata and the PBIX containing imported records
are not included in this repository. Obtain microdata through
the official provider and follow its access and use conditions.

This is an independent learning project and is not affiliated
with or endorsed by UNICEF.
