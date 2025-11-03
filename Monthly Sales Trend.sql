/*

Monthly Sales Trend

*/

SELECT
    FORMAT(Order_Date, 'yyyy-MM') AS Month,
    ROUND(SUM(Sales), 2) AS Monthly_Sales,
    ROUND(SUM(Profit), 2) AS Monthly_Profit
FROM [Global Superstore]
GROUP BY FORMAT(Order_Date, 'yyyy-MM')
ORDER BY Month;