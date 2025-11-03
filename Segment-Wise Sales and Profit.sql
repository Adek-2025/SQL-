/*

Segment-Wise Sales and Profit

*/

SELECT
    Segment,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit) / NULLIF(SUM(Sales), 0) * 100, 2) AS Profit_Margin_Percentage
FROM [Global Superstore]
GROUP BY Segment
ORDER BY Total_Sales DESC;