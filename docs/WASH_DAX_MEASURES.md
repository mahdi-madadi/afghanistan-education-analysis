# Drinking Water Analysis — DAX Measures

Create these measures in the hh table.

Power Query creates PopulationWeight as hhweight × HH48.
Preserve both hhweight and PopulationWeight as Decimal Number.

## Sample households

```dax
Sample Households =
COUNTROWS('hh')
```

## Household weight sum

```dax
Household Weight Sum =
SUM('hh'[hhweight])
```

## Invalid household weights

```dax
Households with Invalid Weight =
COUNTROWS(
    FILTER(
        'hh',
        ISBLANK('hh'[hhweight])
            || 'hh'[hhweight] <= 0
    )
) + 0
```

## Population weight sum

```dax
Population Weight Sum =
SUM('hh'[PopulationWeight])
```

## Population using at least basic drinking water

```dax
Population Using At Least Basic Water % =
VAR BasicWaterWeight =
    CALCULATE(
        [Population Weight Sum],
        'hh'[WaterServiceReviewed] = "At least basic"
    )
VAR TotalPopulationWeight =
    CALCULATE(
        [Population Weight Sum],
        REMOVEFILTERS('hh'[WaterServiceReviewed])
    )
RETURN
    DIVIDE(BasicWaterWeight, TotalPopulationWeight)
```

Format the indicator as Percentage with two decimal places.

The denominator retains all completed households, including
unresolved classifications. Residence, wealth and province
filters remain active.

The measure replaces filters on WaterServiceReviewed.
Use it for overall and demographic comparisons.

## Model

ProvinceLookup[HH7] (one) → hh[HH7] (many).
Use an active relationship with single-direction filtering.

Sort hh[WealthGroup] by hh[windex5].

## Expected results with all filters cleared

| Check | Result |
|---|---:|
| Sample Households | 23,213 |
| Household Weight Sum | 23,213.00 |
| Households with Invalid Weight | 0 |
| Population Weight Sum | 191,631.00 |
| Population Using At Least Basic Water % | 68.84% |

Residence estimates:
- Urban: 92.67%.
- Rural: 60.71%.

The earlier draft classification bounds are retained in the
local report for the audit trail. Final dashboard visuals
use WaterServiceReviewed and the population-based measure.