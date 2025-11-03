/*

Top 10 Profitable States

*/

SELECT TOP 10
    State,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM [Global Superstore]
GROUP BY State
ORDER BY Total_Profit DESC;