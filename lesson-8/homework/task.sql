SELECT 
    MIN(StepNumber) as [Min Step Number],
    MAX(StepNumber) as [Max Step Number],
    Status,
    COUNT(*) as [Consecutive Count]
FROM (
    SELECT 
        StepNumber,
        Status,
        StepNumber - ROW_NUMBER() OVER (PARTITION BY Status ORDER BY StepNumber) as GroupID
    FROM Groupings
) as GroupedData
GROUP BY Status, GroupID
ORDER BY [Min Step Number];

SELECT 
    CAST(Year as VARCHAR) + ' - ' + CAST(Year as VARCHAR) as Years
FROM (
    SELECT DISTINCT YEAR(HIRE_DATE) as Year
    FROM EMPLOYEES_N
) as HireYears
WHERE Year NOT IN (
    SELECT YEAR(HIRE_DATE)
    FROM EMPLOYEES_N
)
AND Year BETWEEN 1975 AND YEAR(GETDATE())
ORDER BY Year;
