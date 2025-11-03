/*


Yearly Sales Growth

*/

SELECT
    YEAR(Order_Date) AS Order_Year,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM [Global Superstore]
GROUP BY YEAR(Order_Date)
ORDER BY Order_Year;