let
  Source = hl,
  #"Filtered rows" = Table.SelectRows(Source, each [HL6] >= 7 and [HL6] <= 17),
  #"Added custom" = Table.TransformColumnTypes(Table.AddColumn(#"Filtered rows", "AttendanceStatus1401", each if [ED9] = 1 then "Yes"
else if [ED9] = 2 then "No"
else if [ED9] = null and [ED4] = 2 then "No"
else if [ED9] = 9 then "No response"
else "Unknown"), {{"AttendanceStatus1401", type text}}),
  #"Added custom 1" = Table.TransformColumnTypes(Table.AddColumn(#"Added custom", "AgeGroup", each if [HL6] <= 12 then "7–12 years"
else if [HL6] <= 15 then "13–15 years"
else "16–17 years"), {{"AgeGroup", type text}})
in
  #"Added custom 1"