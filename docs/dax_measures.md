# DAX measures

Create these measures in the EducationChildren table.

The model uses an active, single-direction relationship:
hh[HouseholdKey] (one) → EducationChildren[HouseholdKey] (many).

## Sample children

Counts sampled children in the current filter context.

```dax
Sample Children =
COUNTROWS('EducationChildren')
```

## Survey weight sum

Adds the household weight for each child. Weight sums are
calculation inputs, not estimated national population totals.

```dax
Survey Weight Sum =
SUMX(
    'EducationChildren',
    RELATED('hh'[hhweight])
)
```

## Weighted attendance percentage

Excludes Unknown and No response from the denominator.
Format as Percentage with two decimal places.

```dax
Weighted Attendance % =
VAR Attending =
    CALCULATE(
        [Survey Weight Sum],
        'EducationChildren'[AttendanceStatus1401] = "Yes"
    )
VAR KnownAttendance =
    CALCULATE(
        [Survey Weight Sum],
        'EducationChildren'[AttendanceStatus1401] IN {"Yes", "No"}
    )
RETURN
    DIVIDE(Attending, KnownAttendance)
```

This measure retains residence, sex, wealth and age filters.
Its explicit status conditions replace filters on
AttendanceStatus1401. Use it in cards and demographic charts,
rather than to calculate percentages for individual status rows.

## Children with known attendance

```dax
Children with Known Attendance =
CALCULATE(
    [Sample Children],
    'EducationChildren'[AttendanceStatus1401] IN {"Yes", "No"}
)
```

## Children with unresolved attendance

```dax
Children with Unresolved Attendance =
[Sample Children] - [Children with Known Attendance]
```

## Validation with all filters cleared

| Measure | Expected result |
|---|---:|
| Sample Children | 61,796 |
| Children with Known Attendance | 61,763 |
| Children with Unresolved Attendance | 33 |
| Weighted Attendance % | 40.58% |

The unresolved-count subtraction is intended for cards and
demographic breakdowns with no attendance-status filter applied.
