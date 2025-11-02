SELECT TOP (1000) [Row_ID]
      ,[Order_ID]
      ,[Order_Date]
      ,[Ship_Date]
      ,[Ship_Mode]
      ,[Customer_ID]
      ,[Customer_Name]
      ,[Segment]
      ,[Country]
      ,[City]
      ,[State]
      ,[Postal_Code]
      ,[Region]
      ,[Product_ID]
      ,[Category]
      ,[Sub_Category]
      ,[Product_Name]
      ,[Sales]
      ,[Quantity]
      ,[Discount]
      ,[Profit]
  FROM [Global Superstore].[dbo].[Global superstore]


SELECT TOP 10
    Customer_Name,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM [Global superstore]
GROUP BY Customer_Name
ORDER BY Total_Profit DESC;
