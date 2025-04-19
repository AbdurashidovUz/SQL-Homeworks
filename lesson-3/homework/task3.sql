WITH CategoryMaxPrice AS (

    SELECT 
        Category,
        ProductName,
        Price,
        Stock,
        ROW_NUMBER() OVER (PARTITION BY Category ORDER BY Price DESC) AS RowNum
    FROM Products
),
FilteredProducts AS (
   
    SELECT 
        Category,
        ProductName,
        Price,
        Stock,
        IIF(Stock = 0, 'Out of Stock', 
            IIF(Stock BETWEEN 1 AND 10, 'Low Stock', 'In Stock')) AS InventoryStatus
    FROM CategoryMaxPrice
    WHERE RowNum = 1
)

SELECT Category, ProductName, Price, InventoryStatus
FROM FilteredProducts
ORDER BY Price DESC
OFFSET 5 ROWS;