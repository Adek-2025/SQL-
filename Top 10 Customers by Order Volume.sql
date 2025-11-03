/*

Top 10 Customers by Order Volume

*/

SELECT TOP 10
    Customer_Name,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM [Global Superstore]
GROUP BY Customer_Name
ORDER BY Total_Orders DESC;