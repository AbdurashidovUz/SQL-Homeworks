WITH RankedEmployees AS (
    
    SELECT TOP 10 PERCENT *, 
           CASE 
               WHEN Salary > 80000 THEN 'High'
               WHEN Salary BETWEEN 50000 AND 80000 THEN 'Medium'
               ELSE 'Low'
           END AS SalaryCategory
    FROM Employees
    ORDER BY Salary DESC
),
AverageSalaries AS (
  
    SELECT Department, AVG(Salary) AS AverageSalary
    FROM RankedEmployees
    GROUP BY Department
)

SELECT e.Department, e.FirstName, e.LastName, e.Salary, a.AverageSalary, e.SalaryCategory
FROM RankedEmployees e
JOIN AverageSalaries a ON e.Department = a.Department
ORDER BY a.AverageSalary DESC
OFFSET 2 ROWS FETCH NEXT 5 ROWS ONLY;