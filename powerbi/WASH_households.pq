let
  Source = Csv.Document(File.Contents("C:\YOUR_PROJECT_FOLDER\exports_csv\hh.csv"), [Delimiter = ",", Columns = 253, Encoding = 65001, QuoteStyle = QuoteStyle.None]),
  #"Promoted headers" = Table.PromoteHeaders(Source, [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"HH1", Int64.Type}, {"HH2", Int64.Type}, {"HH3", Int64.Type}, {"HH4", Int64.Type}, {"HH5D", Int64.Type}, {"HH5M", Int64.Type}, {"HH5Y", Int64.Type}, {"HH5D_G", Int64.Type}, {"HH5M_G", Int64.Type}, {"HH5Y_G", Int64.Type}, {"HH6", Int64.Type}, {"HH7", Int64.Type}, {"HH8", Int64.Type}, {"HH9", Int64.Type}, {"HH10", Int64.Type}, {"HH11H", Int64.Type}, {"HH11M", Int64.Type}, {"HH12", Int64.Type}, {"HH46", Int64.Type}, {"HH13H", Int64.Type}, {"HH13M", Int64.Type}, {"HH14", Int64.Type}, {"HH15", Int64.Type}, {"HH16", Int64.Type}, {"HH17", Int64.Type}, {"HH26A", Int64.Type}, {"HH26B", Int64.Type}, {"HH26C", Int64.Type}, {"HH33X$01", type text}, {"HH33X$02", type text}, {"HH33X$03", Int64.Type}, {"HH33X$04", Int64.Type}, {"HH33X$05", Int64.Type}, {"HH33X$06", Int64.Type}, {"HH33X$07", Int64.Type}, {"HH33X$08", Int64.Type}, {"HH33X$09", Int64.Type}, {"HH33X$10", Int64.Type}, {"HH33X$11", type text}, {"HH33X$12", Int64.Type}, {"HH33X$13", Int64.Type}, {"HH33X$14", Int64.Type}, {"HH33X$15", type text}, {"HH33X$16", type text}, {"HH33X$17", type text}, {"HH33X$18", type text}, {"HH33X$19", type text}, {"HH33X$20", type text}, {"HH33X$21", type text}, {"HH33X$22", type text}, {"HH33X$23", type text}, {"HH33X$24", type text}, {"HH33X$25", type text}, {"HH33X$26", type text}, {"HH33X$27", type text}, {"HH33X$28", type text}, {"HH33X$29", type text}, {"HH33X$30", type text}, {"HH33X$31", type text}, {"HH33X$32", type text}, {"HH33X$33", type text}, {"HH33X$34", type text}, {"HH33X$35", type text}, {"HH33X$36", type text}, {"HH33X$37", type text}, {"HH33X$38", type text}, {"HH33X$39", type text}, {"HH33X$40", type text}, {"HH33X$41", type text}, {"HH33X$42", type text}, {"HH33X$43", type text}, {"HH33X$44", type text}, {"HH33X$45", type text}, {"HH33X$46", type text}, {"HH33X$47", type text}, {"HH33X$48", type text}, {"HH33X$49", type text}, {"HH33X$50", type text}, {"HH33", Int64.Type}, {"HH39X$01", type text}, {"HH39X$02", type text}, {"HH39X$03", type text}, {"HH39X$04", type text}, {"HH39X$05", type text}, {"HH39X$06", type text}, {"HH39X$07", type text}, {"HH39X$08", type text}, {"HH39X$09", type text}, {"HH39X$10", type text}, {"HH39X$11", type text}, {"HH39X$12", type text}, {"HH39X$13", type text}, {"HH39X$14", type text}, {"HH39X$15", type text}, {"HH39X$16", type text}, {"HH39X$17", type text}, {"HH39X$18", type text}, {"HH39X$19", type text}, {"HH39X$20", type text}, {"HH39X$21", type text}, {"HH39X$22", type text}, {"HH39X$23", type text}, {"HH39X$24", type text}, {"HH39X$25", type text}, {"HH39X$26", type text}, {"HH39X$27", type text}, {"HH39X$28", type text}, {"HH39X$29", type text}, {"HH39X$30", type text}, {"HH39X$31", type text}, {"HH39X$32", type text}, {"HH39X$33", type text}, {"HH39X$34", type text}, {"HH39X$35", type text}, {"HH39X$36", type text}, {"HH39X$37", type text}, {"HH39X$38", type text}, {"HH39X$39", type text}, {"HH39X$40", type text}, {"HH39X$41", type text}, {"HH39X$42", type text}, {"HH39X$43", type text}, {"HH39X$44", type text}, {"HH39X$45", type text}, {"HH39X$46", type text}, {"HH39X$47", type text}, {"HH39X$48", type text}, {"HH39X$49", type text}, {"HH39X$50", type text}, {"HH39", type text}, {"HH47", Int64.Type}, {"HH48", Int64.Type}, {"HH49", Int64.Type}, {"HH50", Int64.Type}, {"HH51", Int64.Type}, {"HH52", Int64.Type}, {"HH53", Int64.Type}, {"HH54", Int64.Type}, {"HH55", Int64.Type}, {"HH56", Int64.Type}, {"INTROHL", Int64.Type}, {"HHAUX", Int64.Type}, {"HHFIN", Int64.Type}, {"HC1B", Int64.Type}, {"HC3", Int64.Type}, {"HC4", Int64.Type}, {"HC5", Int64.Type}, {"HC6", Int64.Type}, {"HC7A", Int64.Type}, {"HC7B", Int64.Type}, {"HC7C", Int64.Type}, {"HC7D", Int64.Type}, {"HC7E", Int64.Type}, {"HC7F", Int64.Type}, {"HC7G", Int64.Type}, {"HC7H", Int64.Type}, {"HC7I", Int64.Type}, {"HC7J", Int64.Type}, {"HC7K", Int64.Type}, {"HC7L", Int64.Type}, {"HC7M", Int64.Type}, {"HC8", Int64.Type}, {"HC9A", Int64.Type}, {"HC9B", Int64.Type}, {"HC9C", Int64.Type}, {"HC9D", Int64.Type}, {"HC9E", Int64.Type}, {"HC9F", Int64.Type}, {"HC9G", Int64.Type}, {"HC9H", Int64.Type}, {"HC9I", Int64.Type}, {"HC9J", Int64.Type}, {"HC9K", Int64.Type}, {"HC9L", Int64.Type}, {"HC9M", Int64.Type}, {"HC9N", Int64.Type}, {"HC9O", Int64.Type}, {"HC9P", Int64.Type}, {"HC10A", Int64.Type}, {"HC10B", Int64.Type}, {"HC10C", Int64.Type}, {"HC10D", Int64.Type}, {"HC10E", Int64.Type}, {"HC10F", Int64.Type}, {"HC10G", Int64.Type}, {"HC10H", Int64.Type}, {"HC11", Int64.Type}, {"HC12", Int64.Type}, {"HC12A", Int64.Type}, {"HC13", Int64.Type}, {"HC14", Int64.Type}, {"HC15", Int64.Type}, {"HC16", Int64.Type}, {"HC17", Int64.Type}, {"HC18A", Int64.Type}, {"HC18B", Int64.Type}, {"HC18C", Int64.Type}, {"HC18D", Int64.Type}, {"HC18E", Int64.Type}, {"HC18F", Int64.Type}, {"HC18H", Int64.Type}, {"HC18I", Int64.Type}, {"HC19", Int64.Type}, {"WS1", Int64.Type}, {"WS2", type text}, {"WS3", Int64.Type}, {"WS4", Int64.Type}, {"WS5", Int64.Type}, {"WS6", Int64.Type}, {"WS7", Int64.Type}, {"WS8", Int64.Type}, {"WS9", Int64.Type}, {"WS10A", type text}, {"WS10B", type text}, {"WS10C", type text}, {"WS10D", type text}, {"WS10E", type text}, {"WS10F", type text}, {"WS10X", type text}, {"WS10Z", type text}, {"WS10NR", type text}, {"WS11", Int64.Type}, {"WS12", Int64.Type}, {"WS13", Int64.Type}, {"WS14", Int64.Type}, {"WS15", Int64.Type}, {"WS16", Int64.Type}, {"WS17", Int64.Type}, {"HW1", Int64.Type}, {"HW2", Int64.Type}, {"HW3", Int64.Type}, {"HW4", Int64.Type}, {"HW5", Int64.Type}, {"HW6", Int64.Type}, {"HW7A", type text}, {"HW7B", type text}, {"HW7C", type text}, {"HW7NR", type text}, {"HHSEX", Int64.Type}, {"HHAGE", Int64.Type}, {"hhweight", type number}, {"wscore", type number}, {"windex5", Int64.Type}, {"windex10", Int64.Type}, {"wscoreu", type number}, {"windex5u", Int64.Type}, {"windex10u", Int64.Type}, {"wscorer", Int64.Type}, {"windex5r", Int64.Type}, {"windex10r", Int64.Type}, {"helevel", Int64.Type}, {"PSU", type text}, {"stratum", Int64.Type}}),
  #"Choose columns" = Table.SelectColumns(#"Changed column type", {"HH1", "HH2", "HH6", "HH7", "HH46", "HH48", "WS1", "WS2", "WS3", "WS4", "hhweight", "windex5"}),
  #"Changed column type 1" = Table.TransformColumnTypes(#"Choose columns", {{"hhweight", type number}, {"HH1", Int64.Type}, {"HH2", Int64.Type}, {"HH6", Int64.Type}, {"HH7", Int64.Type}, {"HH46", Int64.Type}, {"WS1", Int64.Type}, {"WS2", Int64.Type}, {"WS3", Int64.Type}, {"WS4", Int64.Type}, {"windex5", Int64.Type}}),
  #"Filtered rows" = Table.SelectRows(#"Changed column type 1", each [HH46] = 1),
  #"Added custom" = Table.TransformColumnTypes(Table.AddColumn(#"Filtered rows", "WaterTimeResponse", each if [WS4] = null then "Blank"
else if [WS4] = 998 then "Don't know"
else if [WS4] = 999 then "No response"
else if [WS4] = 0 then "Household does not collect"
else if [WS4] >= 1 and [WS4] <= 30 then "1–30 minutes"
else if [WS4] > 30 and [WS4] < 998 then "Over 30 minutes"
else "Unexpected value"), {{"WaterTimeResponse", type text}}),
  #"Added custom 1" = Table.TransformColumnTypes(Table.AddColumn(#"Added custom", "WaterSourceClass", each if List.Contains({11, 12, 13, 14, 21, 31, 41, 51, 61, 71, 72, 91, 92}, [WS1]) then "Improved"
else if List.Contains({32, 42}, [WS1]) then "Unimproved"
else if [WS1] = 81 then "Surface water"
else if [WS1] = 96 then "Other source"
else if [WS1] = 99 then "No response"
else "Unknown source"), {{"WaterSourceClass", type text}}),
  #"Added custom 2" = Table.TransformColumnTypes(Table.AddColumn(#"Added custom 1", "WaterServiceDraft", each if [WaterSourceClass] = "Surface water" then "No service"
else if [WaterSourceClass] = "Unimproved" then "Unimproved"
else if [WaterSourceClass] <> "Improved" then "Source unresolved"
else if List.Contains({91, 92}, [WS1]) then "Review packaged water"
else if List.Contains({11, 12}, [WS1]) or List.Contains({1, 2}, [WS3]) then "At least basic"
else if [WaterTimeResponse] = "1–30 minutes" then "At least basic"
else if [WaterTimeResponse] = "Over 30 minutes" then "Limited"
else if [WaterTimeResponse] = "Household does not collect" then "Review no collection"
else "Collection time unresolved"), {{"WaterServiceDraft", type text}}),
  #"Added custom 3" = Table.TransformColumnTypes(Table.AddColumn(#"Added custom 2", "Residence", each if [HH6] = 1 then "Urban"
else if [HH6] = 2 then "Rural"
else null), {{"Residence", type text}}),
  #"Added custom 4" = Table.TransformColumnTypes(Table.AddColumn(#"Added custom 3", "WealthGroup", each if [windex5] = 1 then "Poorest"
else if [windex5] = 2 then "Second"
else if [windex5] = 3 then "Middle"
else if [windex5] = 4 then "Fourth"
else if [windex5] = 5 then "Richest"
else null), {{"WealthGroup", type text}}),
  #"Added custom 5" = Table.TransformColumnTypes(Table.AddColumn(#"Added custom 4", "WaterServiceReviewed", each let
    ImprovedSource =
        List.Contains(
            {11, 12, 13, 14, 21, 31, 41, 51, 61, 71, 72, 91, 92},
            [WS1]
        ),
    OnPremises =
        List.Contains({11, 12}, [WS1])
        or List.Contains({11, 12}, [WS2])
        or List.Contains({1, 2}, [WS3])
in
    if [WS1] = 81 then "Surface water"
    else if List.Contains({32, 42, 96}, [WS1]) then "Unimproved"
    else if not ImprovedSource then "Source unresolved"
    else if OnPremises then "At least basic"
    else if [WS4] = null then "Collection time unresolved"
    else if [WS4] >= 0 and [WS4] <= 30 then "At least basic"
    else if [WS4] > 30 and [WS4] <= 990 then "Limited"
    else "Collection time unresolved"), {{"WaterServiceReviewed", type text}}),
  #"Changed column type 2" = Table.TransformColumnTypes(#"Added custom 5", {{"HH6", Int64.Type}}),
  #"Added custom 6" = Table.TransformColumnTypes(Table.AddColumn(#"Changed column type 2", "PopulationWeight", each [hhweight] * [HH48]), {{"PopulationWeight", type number}})
in
  #"Added custom 6"