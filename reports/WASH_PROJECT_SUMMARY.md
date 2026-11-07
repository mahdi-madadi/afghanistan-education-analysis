# Drinking Water Access in Afghanistan

## Question
How does access to at least basic drinking water vary by
residence, household wealth and province?

## Data
UNICEF Afghanistan MICS 2022–23.
Household file: hh.sav, converted to hh.csv.
Analysis sample: 23,213 completed household interviews.

## Tools
Python, Power Query, Power BI and DAX.

## Indicator
At least basic drinking water means an improved source
on premises or accessible within a round trip of
30 minutes or less, including queuing.

Households reporting no collection are included in the
≤30-minute category.

## Weighting and denominator
Population weight = hhweight × HH48 (household size).

The numerator sums population weights for households
meeting the indicator.

The denominator includes all completed households.
Unresolved responses contribute zero to the numerator
and remain in the denominator.

## Results
- Overall: 68.84%.
- Urban: 92.67%; rural: 60.71%.
- Poorest wealth group: 39.25%; richest: 94.59%.
- Highest province estimate: Kabul, 94.81%.
- Lowest province estimate: Nooristan, 16.34%.

## Validation
- All completed households have positive survey weights.
- Household weight sum: 23,213.00.
- Population weight sum: 191,631.00.
- National and residence estimates match UNICEF's published
  results when rounded to one decimal place.
- Early whole-number rounding of weights was identified,
  corrected and documented before final reporting.

## Method and limitations
Classification adapts published Serbia MICS6 syntax to
Afghanistan's questionnaire codes. Agreement with selected
published estimates does not verify every record.

The indicator does not assess measured water quality.
Confidence intervals and statistical significance were
not calculated. Results describe associations.

## Deliverables
- drinking_water_overview.png
- drinking_water_findings.png
- Afghanistan_Drinking_Water_Portfolio.pdf
- WASH_CLEANING_LOG.md

The PBIX and survey microdata remain local.

## Source
https://www.unicef.org/afghanistan/reports/afghanistan-multiple-indicator-cluster-survey-mics-2022-2023
## LinkedIn post
https://lnkd.in/p/d3XsUyPy