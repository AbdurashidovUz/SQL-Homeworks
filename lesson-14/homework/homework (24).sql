
CREATE PROCEDURE SendIndexMetadata  
AS
BEGIN

    SELECT 
        t.name AS TableName,
        i.name AS IndexName,
        i.type_desc AS IndexType,
        c.name AS ColumnName  
    INTO #TempIndexes  
    FROM sys.tables t
    JOIN sys.indexes i ON t.object_id = i.object_id
    JOIN sys.index_columns ic ON i.object_id = ic.object_id
    JOIN sys.columns c ON ic.object_id = c.object_id;

    -- Create HTML table
    DECLARE @HTML NVARCHAR(MAX);
    SET @HTML = '<table border="1">';  
    SET @HTML = @HTML + '<tr><th>Table Name</th><th>Index Name</th><th>Type</th><th>Column</th></tr>';

    -- Add rows
    SELECT @HTML = @HTML + 
        '<tr><td>' + TableName + '</td>' +
        '<td>' + IndexName + '</td>' +
        '<td>' + IndexType + '</td>' +
        '<td>' + ColumnName + '</td></tr>'
    FROM #TempIndexes;  

    SET @HTML = @HTML + '</table>';

    
    EXEC msdb.dbo.sp_send_dbmail  
        @profile_name = 'SQL Server Mail Profile',
        @recipients = 'admin@company.com',
        @subject = 'Index Metadata Report',
        @body = @HTML,
        @body_format = 'HTML';

    
END;
GO

