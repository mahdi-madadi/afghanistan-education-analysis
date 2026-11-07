let
  Source = Table.FromRows(Json.Document(Binary.Decompress(Binary.FromText("RZHRSsMwFIZfRXK9gU3UulsZKlbHQEVw9OKMjiZrm0jSMtqnN+ecRC+/vyd/v5McDqIQK1HBcepFvToISfRjAhCqiHvwF7CENxHfwDRgr77AN9BRehvTV9eCJ7qLtAMbUaekxO/Q6iG13FOpPQdteGATg4c40KeB4pqCYc6Mjk8aFmuYJTV0o+lYs1ApmBOjaKVdGBnRsJps8ilI0Tlvwpj/UNIf40Y66Jyh50dM8rENtzTTwleFlu8w4K58QhbU0neaUdKAX5/W+3y9ijZx3ChRcwtzF0t5M4mmn94tf5Xo+v3/PCW9j20gW0m0fIHLcs4nUPMR/AxHfkLUfD710bPhgC2bVpvAgaQJD3xbSnEB8BYKJXdmiFKirn8B", BinaryEncoding.Base64), Compression.Deflate)), let _t = ((type nullable text) meta [Serialized.Text = true]) in type table [HH7 = _t, Province = _t]),
  #"Changed column type" = Table.TransformColumnTypes(Source, {{"HH7", Int64.Type}, {"Province", type text}})
in
  #"Changed column type"