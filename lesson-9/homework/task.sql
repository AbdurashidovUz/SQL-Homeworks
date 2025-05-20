WITH EmployeeHierarchy AS (
    
    SELECT 
        EmployeeID,
        ManagerID,
        JobTitle,
        0 as Depth
    FROM Employees
    WHERE ManagerID IS NULL

    UNION ALL

   
    SELECT 
        e.EmployeeID,
        e.ManagerID,
        e.JobTitle,
        eh.Depth + 1
    FROM Employees e
    INNER JOIN EmployeeHierarchy eh ON e.ManagerID = eh.EmployeeID
)
SELECT * FROM EmployeeHierarchy
ORDER BY Depth, EmployeeID;

WITH Factorials AS (
    
    SELECT 
        1 as Num,
        1 as Factorial

    UNION ALL

    
    SELECT 
        Num + 1,
        (Num + 1) * Factorial
    FROM Factorials
    WHERE Num < 10
)
SELECT * FROM Factorials;
