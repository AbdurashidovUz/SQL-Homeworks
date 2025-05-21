
CREATE PROCEDURE usp_GetDatabaseSchemaInfo
AS
BEGIN
    -- Using basic SELECT with system views
    SELECT 
        DB_NAME() AS DatabaseName,
        s.name AS SchemaName,
        t.name AS TableName,
        c.name AS ColumnName,
        t.name AS DataType
    FROM sys.tables t
    INNER JOIN sys.schemas s ON t.schema_id = s.schema_id
    INNER JOIN sys.columns c ON t.object_id = c.object_id
    WHERE DB_NAME() NOT IN ('master', 'tempdb', 'model', 'msdb')
    ORDER BY SchemaName, TableName, ColumnName;
END;
GO



