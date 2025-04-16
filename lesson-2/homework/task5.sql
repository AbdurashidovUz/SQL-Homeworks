CREATE TABLE worker (
    id INT,
    name VARCHAR(100)
);

BULK INSERT worker
FROM 'D:\SQL-Homeworks\lesson-2\homework\worker,csv'
WITH (
    FIRSTROW = 2,              
    FIELDTERMINATOR = ',',     
    ROWTERMINATOR = '\n',      
    TABLOCK
);

SELECT * FROM worker;
