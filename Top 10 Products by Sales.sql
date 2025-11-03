/*

Top 10 Products by Sales

*/

SELECT TOP 10
    Product_Name,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM [Global Superstore]
GROUP BY Product_Name
ORDER BY Total_Sales DESC;