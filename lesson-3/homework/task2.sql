WITH OrderDetails AS (
   
    SELECT 
        CustomerName,
        TotalAmount,
        CASE 
            WHEN Status IN ('Shipped', 'Delivered') THEN 'Completed'
            WHEN Status = 'Pending' THEN 'Pending'
            WHEN Status = 'Cancelled' THEN 'Cancelled'
        END AS OrderStatus
    FROM Orders
    WHERE OrderDate BETWEEN '2023-01-01' AND '2023-12-31'
),
GroupedOrders AS (
    
    SELECT 
        OrderStatus,
        COUNT(*) AS TotalOrders,
        SUM(TotalAmount) AS TotalRevenue
    FROM OrderDetails
    GROUP BY OrderStatus
)

SELECT OrderStatus, TotalOrders, TotalRevenue
FROM GroupedOrders
WHERE TotalRevenue > 5000
ORDER BY TotalRevenue DESC;