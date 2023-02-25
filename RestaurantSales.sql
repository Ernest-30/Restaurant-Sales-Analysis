USE RestaurantOrders
SELECT [Order ID],[Order Date], [Customer Name], 
		[Quantity of Items], [Order Amount], 
		RestaurantName, RestaurantID, Cuisine, Zone, Category, 
		[Payment Mode], [Delivery Time Taken (mins)], 
		[Customer Rating-Food], [Customer Rating-Delivery]
FROM Orders o
JOIN Details d
ON o.[Restaurant ID] = d.RestaurantID

--------------------------------------------------------------------------------------------------------------
--Order Summary

SELECT COUNT ([Order ID]) AS Total_Orders, 
		SUM ([Quantity of Items]) AS Total_Items_Ordered,
		SUM ([Order Amount]) AS Total_Amount,
		SUM ([Delivery Time Taken (mins)]) AS Total_DeliveryTime, 
		AVG ([Delivery Time Taken (mins)]) AS Avg_deliveryTime,
		AVG ([Customer Rating-Food]) AS Avg_food_rating,
		AVG ([Customer Rating-Delivery]) AS Avg_delivery_rating	
FROM Orders

---------------------------------------------------------------------------------------------------------------		
--Time of Order Summary

SELECT [Order Date], COUNT ([Order ID]) AS Number_of_orders
FROM Orders
GROUP BY [Order Date]
ORDER BY 2 DESC

---------------------------------------------------------------------------------------------------------------------
--Customer Summary

SELECT [Customer Name], COUNT ([Order ID]) AS Number_of_orders, 
		SUM ([Quantity of Items]) AS Total_Items_Ordered,
		SUM ([Order Amount]) AS Total_Amount
FROM Orders
GROUP BY [Customer Name]
ORDER BY 2 DESC

---------------------------------------------------------------------------------------------------------------------
--Payment Mode Summary

SELECT [Payment Mode], COUNT ([Order ID]) AS Number_of_orders,
		SUM ([Quantity of Items]) AS Total_Items_Ordered,
		SUM ([Order Amount]) AS Total_Amount
FROM Orders
GROUP BY [Payment Mode]
ORDER BY 2 DESC

-----------------------------------------------------------------------------------------------------------------------
--Restaurant Summary

SELECT RestaurantName, COUNT ([Order ID]) AS Number_of_orders,
		SUM ([Quantity of Items]) AS Total_Items_Ordered,
		SUM ([Order Amount]) AS Total_Amount, 
		AVG ([Customer Rating-Food]) AS Avg_food_rating,
		AVG ([Delivery Time Taken (mins)]) AS Avg_deliveryTime,
		AVG ([Customer Rating-Delivery]) AS Avg_delivery_rating
FROM Details D
JOIN Orders O
ON D.RestaurantID = O.[Restaurant ID]
GROUP BY RestaurantName
ORDER BY 4 DESC

---------------------------------------------------------------------------------------------------------------------
--Cuisine Summary

SELECT Cuisine, COUNT ([Order ID]) AS Number_of_orders,
		SUM ([Quantity of Items]) AS Total_Items_Ordered,
		SUM ([Order Amount]) AS Total_Amount, 
		AVG ([Customer Rating-Food]) AS Avg_food_rating,
		AVG ([Delivery Time Taken (mins)]) AS Avg_deliveryTime,
		AVG ([Customer Rating-Delivery]) AS Avg_delivery_rating
FROM Details D
JOIN Orders O
ON D.RestaurantID = O.[Restaurant ID]
GROUP BY Cuisine
ORDER BY 2 DESC

---------------------------------------------------------------------------------------------------------------------------
--Category Summary

SELECT Category, COUNT ([Order ID]) AS Number_of_orders,
		SUM ([Quantity of Items]) AS Total_Items_Ordered,
		SUM ([Order Amount]) AS Total_Amount
FROM Details D
JOIN Orders O
ON D.RestaurantID = O.[Restaurant ID]
GROUP BY Category
ORDER BY 2 DESC

----------------------------------------------------------------------------------------------------------------------------
--Zone Summary

SELECT Zone, COUNT ([Order ID]) AS Number_of_orders,
		SUM ([Quantity of Items]) AS Total_Items_Ordered,
		SUM ([Order Amount]) AS Total_Amount
FROM Details D
JOIN Orders O
ON D.RestaurantID = O.[Restaurant ID]
GROUP BY Zone
ORDER BY 2 DESC

----------------------------------------------------------------------------------------------------------------------------
SELECT *
FROM Details d
JOIN Orders o
ON o.[Restaurant ID] = d.RestaurantID



