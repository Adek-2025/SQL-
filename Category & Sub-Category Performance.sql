/*

Category & Sub-Category Performance

*/



SELECT
    Category,
    Sub_Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM [Global Superstore]
GROUP BY Category, Sub_Category
ORDER BY Total_Sales DESC;