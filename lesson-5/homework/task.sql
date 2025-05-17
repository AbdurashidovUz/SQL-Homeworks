SELECT 
    EmployeeID,
    Name,
    Department,
    Salary,
    ROW_NUMBER() OVER (ORDER BY Salary DESC) AS SalaryRank
FROM Employees
ORDER BY Salary DESC;

SELECT 
    EmployeeID,
    Name,
    Department,
    Salary,
    DENSE_RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
FROM Employees
ORDER BY Salary DESC;

WITH RankedSalaries AS (
    SELECT 
        EmployeeID,
        Name,
        Department,
        Salary,
        DENSE_RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS SalaryRank
    FROM Employees
)
SELECT 
    EmployeeID,
    Name,
    Department,
    Salary
FROM RankedSalaries
WHERE SalaryRank <= 2
ORDER BY Department, Salary DESC;

SELECT 
    EmployeeID,
    Name,
    Department,
    Salary,
    SUM(Salary) OVER (
        PARTITION BY Department 
        ORDER BY HireDate
    ) AS RunningTotal
FROM Employees
ORDER BY Department, HireDate;

SELECT DISTINCT
    Department,
    SUM(Salary) OVER (PARTITION BY Department) AS DepartmentTotal
FROM Employees
ORDER BY Department;

SELECT DISTINCT
    Department,
    AVG(Salary) OVER (PARTITION BY Department) AS DepartmentAverage
FROM Employees
ORDER BY Department;

SELECT 
    EmployeeID,
    Name,
    Department,
    Salary,
    Salary - AVG(Salary) OVER (PARTITION BY Department) AS DifferenceFromAverage
FROM Employees
ORDER BY Department, Salary DESC;

SELECT 
    EmployeeID,
    Name,
    Department,
    Salary,
    HireDate,
    AVG(Salary) OVER (
        ORDER BY HireDate
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS RunningAverage
FROM Employees
ORDER BY HireDate;

SELECT 
    EmployeeID,
    Name,
    Department,
    Salary,
    HireDate,
    SUM(Salary) OVER (
        ORDER BY HireDate DESC
        ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING
    ) AS LastThreeHiredSum
FROM Employees
ORDER BY HireDate DESC;

SELECT 
    EmployeeID,
    Name,
    Department,
    Salary,
    HireDate,
    MAX(Salary) OVER (
        ORDER BY HireDate
        ROWS BETWEEN 2 PRECEDING AND 2 FOLLOWING
    ) AS MaxSalaryInWindow
FROM Employees
ORDER BY HireDate;

SELECT 
    EmployeeID,
    Name,
    Department,
    Salary,
    ROUND((Salary * 100.0 / SUM(Salary) OVER (PARTITION BY Department)), 2) AS SalaryPercentage
FROM Employees  
ORDER BY Department, Salary DESC;