WITH AllDays AS (
    
    SELECT 
        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) as Day,
        COALESCE(s.Num, 0) as Shipments
    FROM (VALUES (1),(1),(1),(1),(1),(1),(1),(1),(1),(1),
                 (1),(1),(1),(1),(1),(1),(1),(1),(1),(1),
                 (1),(1),(1),(1),(1),(1),(1),(1),(1),(1),
                 (1),(1),(1),(1),(1),(1),(1),(1),(1),(1)) as t(n)
    LEFT JOIN Shipments s ON ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) = s.N
),
RankedDays AS (
    
    SELECT 
        Day,
        Shipments,
        ROW_NUMBER() OVER (ORDER BY Shipments) as RowNum,
        COUNT(*) OVER () as TotalDays
    FROM AllDays
)

SELECT AVG(CAST(Shipments as FLOAT)) as Median
FROM RankedDays
WHERE RowNum IN (
    (TotalDays + 1) / 2,
    (TotalDays + 2) / 2
);
