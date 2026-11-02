# Education Participation in Afghanistan

## Question
How did attendance during school year 1401 differ by sex,
residence, household wealth, and age?

## Data
UNICEF Afghanistan MICS 2022–23.
Files used: hh.sav and hl.sav, converted to CSV.

## Tools
Power BI Desktop, Power Query, and DAX.

## Preparation
- Selected relevant household and member columns.
- Set data types and retained completed household interviews.
- Created HouseholdKey from cluster and household numbers.
- Matched members to completed households.
- Added readable category labels.
- Selected children aged 7–17 at interview.
- Applied questionnaire skip rules to attendance.
- Retained unresolved answers separately.

## Model
One-to-many relationship from households to children,
using HouseholdKey and single-direction filtering.

## Measures and validation
- Sample children: 61,796.
- Known attendance: 61,763.
- Unresolved attendance: 33.
- Weighted attendance: 40.58%.
- Household weights used for attendance percentages.
- Verified status totals and residence filtering.

## Main findings
- Urban attendance: 55.21%; rural: 35.86%.
- Male attendance: 50.75%; female: 30.23%.
- Poorest wealth group: 21.55%; richest: 62.66%.
- Females aged 16–17: 10.68%.

## Implications and further analysis
The observed attendance gaps suggest priorities for further
investigation, particularly rural children, poorer households,
and older female children.

Further analysis should compare these factors together, examine
province differences, and calculate confidence intervals using
the survey's cluster and stratum information.

These results alone cannot determine which interventions would
improve attendance.

## Limitations
Age is measured at interview. Attendance includes the education
types covered by the questionnaire. Results are descriptive,
exclude unresolved attendance answers, and do not establish
causality or individual dropout. Confidence intervals and
statistical significance were not calculated.

## Report pages
Education Overview, Findings, Methodology, and Validation.

## Source
https://www.unicef.org/afghanistan/reports/afghanistan-multiple-indicator-cluster-survey-mics-2022-2023

## Portfolio files
- reports/education_overview.png — dashboard preview
- reports/education_findings.png — key findings
- reports/Afghanistan_Education_Portfolio.pdf — presentation
- powerbi/Afghanistan_Education.pbix — interactive report
- docs/data_dictionary.csv — variable definitions
- scripts/ — data inspection and conversion code