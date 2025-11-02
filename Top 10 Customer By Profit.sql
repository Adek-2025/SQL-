SELECT TOP 10
    Customer_Name,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM [Global superstore]
GROUP BY Customer_Name
ORDER BY Total_Profit DESC;