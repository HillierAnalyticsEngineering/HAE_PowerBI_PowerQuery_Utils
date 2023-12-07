let
    Get_Year_Column_Reference = (last_table_trans_step as table, include_column_name as text, exclude_column_name as text) as table =>
    let
        #"1" = Table.SelectColumns(  last_table_trans_step, Table.ToList(  Table.SelectRows(  Table.FromList( Table.ColumnNames(last_table_trans_step) )  , each (((Apply_RegEx_JavaScript(""""&[Column1]&"""",".*([2][0][0-9]{1}[0-9]{1}).*") <> "null") or (Text.Contains([Column1],include_column_name))) and (Text.Contains([Column1],exclude_column_name) <> true))))),
        #"2" = Table.ReorderColumns(#"1", Table.ToList(Table.Sort(Table.SelectRows(Table.FromList( Table.ColumnNames(last_table_trans_step)), each (Apply_RegEx_JavaScript(""""&[Column1]&"""",".*([2][0][0-9]{1}[0-9]{1}).*") <> "null")),{{"Column1",Order.Ascending}})))
    in
        #"2"
in
    Get_Year_Column_Reference