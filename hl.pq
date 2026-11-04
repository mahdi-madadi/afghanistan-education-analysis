let
  Source = Csv.Document(File.Contents("C:\YOUR_PROJECT_FOLDER\exports_csv\hl.csv"), [Delimiter = ",", Columns = 73, Encoding = 65001, QuoteStyle = QuoteStyle.None]),
  #"Promoted headers" = Table.PromoteHeaders(Source, [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"HH1", Int64.Type}, {"HH2", Int64.Type}, {"HL1", Int64.Type}, {"HL3", Int64.Type}, {"HL4", Int64.Type}, {"HL5M", Int64.Type}, {"HL5Y", Int64.Type}, {"HL6", Int64.Type}, {"HL8", Int64.Type}, {"HL9", type text}, {"HL10", Int64.Type}, {"HL11", Int64.Type}, {"HL12", Int64.Type}, {"HL13", Int64.Type}, {"HL14", Int64.Type}, {"HL15", type text}, {"HL16", Int64.Type}, {"HL17", Int64.Type}, {"HL18", Int64.Type}, {"HL19", type text}, {"HL20", Int64.Type}, {"ED1", Int64.Type}, {"ED2A", Int64.Type}, {"ED3", Int64.Type}, {"ED4", Int64.Type}, {"ED5A", Int64.Type}, {"ED5B", Int64.Type}, {"ED6", Int64.Type}, {"ED7", Int64.Type}, {"ED8", Int64.Type}, {"ED9", Int64.Type}, {"ED10A", Int64.Type}, {"ED10B", Int64.Type}, {"ED11", Int64.Type}, {"ED12", Int64.Type}, {"ED13A", type text}, {"ED13B", type text}, {"ED13C", type text}, {"ED13X", type text}, {"ED13Z", type text}, {"ED13NR", type text}, {"ED14", Int64.Type}, {"ED15", Int64.Type}, {"ED16A", Int64.Type}, {"ED16B", Int64.Type}, {"HH3", Int64.Type}, {"HH4", Int64.Type}, {"HH5D", Int64.Type}, {"HH5M", Int64.Type}, {"HH5Y", Int64.Type}, {"HH5D_G", Int64.Type}, {"HH5M_G", Int64.Type}, {"HH5Y_G", Int64.Type}, {"HH6", Int64.Type}, {"HH7", Int64.Type}, {"MLINE", Int64.Type}, {"FLINE", Int64.Type}, {"helevel", Int64.Type}, {"melevel", Int64.Type}, {"felevel", Int64.Type}, {"schage", Int64.Type}, {"hhweight", type number}, {"wscore", type number}, {"windex5", Int64.Type}, {"windex10", Int64.Type}, {"wscoreu", type number}, {"windex5u", Int64.Type}, {"windex10u", Int64.Type}, {"wscorer", type text}, {"windex5r", type text}, {"windex10r", type text}, {"PSU", Int64.Type}, {"stratum", Int64.Type}}),
  #"Choose columns" = Table.SelectColumns(#"Changed column type", {"HH1", "HH2", "HL1", "HL4", "HL6", "ED4", "ED9"}),
  #"Changed column type 1" = Table.TransformColumnTypes(#"Choose columns", {{"HL1", Int64.Type}, {"HH2", Int64.Type}, {"HH1", Int64.Type}, {"HL4", Int64.Type}, {"HL6", Int64.Type}, {"ED4", Int64.Type}, {"ED9", Int64.Type}}),
  #"Added custom" = Table.TransformColumnTypes(Table.AddColumn(#"Changed column type 1", "HouseholdKey", each Text.From([HH1]) & "_" & Text.From([HH2])), {{"HouseholdKey", type text}}),
  #"Merged queries" = Table.NestedJoin(#"Added custom", {"HouseholdKey"}, hh, {"HouseholdKey"}, "hh", JoinKind.Inner),
  #"Removed columns" = Table.RemoveColumns(#"Merged queries", {"hh"}),
  #"Added custom 1" = Table.TransformColumnTypes(Table.AddColumn(#"Removed columns", "Sex", each if [HL4] = 1 then "Male"
else if [HL4] = 2 then "Female"
else null), {{"Sex", type text}}),
  #"Added custom 2" = Table.TransformColumnTypes(Table.AddColumn(#"Added custom 1", "SchoolAttendance1401", each if [ED9] = 1 then "Yes"
else if [ED9] = 2 then "No"
else if [ED9] = 9 then "No response"
else null), {{"SchoolAttendance1401", type text}}),
  #"Added custom 3" = Table.TransformColumnTypes(Table.AddColumn(#"Added custom 2", "EverAttendedEducation", each if [ED4] = 1 then "Yes"
else if [ED4] = 2 then "No"
else if [ED4] = 9 then "No response"
else null), {{"EverAttendedEducation", type text}})
in
  #"Added custom 3"