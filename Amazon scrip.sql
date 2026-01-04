-- which product generate the highest profit --

SELECT  products."Product Name", products.Category,order_item_table .Sales, ROUND(SUM(order_item_table.Profit),0)  AS "Total profit" 
, RANK() OVER( ORDER BY ROUND(SUM(order_item_table.Profit),0) DESC) AS "RANK" ,
CASE
	WHEN  ROUND(SUM(order_item_table.Profit),0) > 5000 THEN ' TOP PRODUCTS'
	WHEN  ROUND(SUM(order_item_table.Profit),0) > 1000 AND  ROUND(SUM(order_item_table.Profit),0) < 5000 THEN ' Normal products'
	WHEN  ROUND(SUM(order_item_table.Profit),0) < 100 THEN 'Bad Prducts'
	ELSE 'Regual'
END AS Product_rank_level
FROM order_item_table 
JOIN products 
ON order_item_table."Product Name" =products."Product Name" 
GROUP BY  products.Category ,products."Product Name", order_item_table .Sales
ORDER BY "Total profit" DESC

-- worst product --

SELECT  products."Product Name", products.Category,order_item_table .Sales, ROUND(SUM(order_item_table.Profit),0)  AS "Total profit" 
, RANK() OVER( ORDER BY ROUND(SUM(order_item_table.Profit),0) DESC) AS "RANK" ,
CASE
	WHEN  ROUND(SUM(order_item_table.Profit),0) > 5000 THEN ' TOP PRODUCTS'
	WHEN  ROUND(SUM(order_item_table.Profit),0) > 1000 AND  ROUND(SUM(order_item_table.Profit),0) < 5000 THEN ' Normal products'
	WHEN  ROUND(SUM(order_item_table.Profit),0) < 100 THEN 'Bad Prducts'
	ELSE 'Regual'
END AS Product_rank_level
FROM order_item_table 
JOIN products 
ON order_item_table."Product Name" =products."Product Name" 
GROUP BY  products.Category ,products."Product Name", order_item_table .Sales
HAVING order_item_table.Sales < 1000 AND "Total profit" < 100
ORDER BY "Total profit" DESC


-- which product and categories generate the highest profit and the most risky  -- 
SELECT products."Product Name", products.Category, ROUND(SUM(order_item_table.Profit),0)  AS "Total profit" 
, RANK() OVER( ORDER BY ROUND(SUM(order_item_table.Profit),0) DESC) AS "RANK" ,
CASE 
    WHEN  ROUND(SUM(order_item_table.Profit),0) > 20000 THEN ' TOP CATEGORIES'
	WHEN  ROUND(SUM(order_item_table.Profit),0) > 10000 AND  ROUND(SUM(order_item_table.Profit),0) < 20000 THEN ' Normal Categories'
	WHEN  ROUND(SUM(order_item_table.Profit),0) < 100 THEN 'Bad categories'
	ELSE 'Regual Category'
END AS Product_rank_level
FROM order_item_table 
JOIN products 
ON order_item_table."Product Name" =products."Product Name" 
GROUP BY  products.Category 
ORDER BY "Total profit" DESC

-- Insight on Location, amount of profit, region, and risk -- 

SELECT orders_table.Geography, COUNT( orders_table.Geography) AS " Lcation" , SUM(order_item_table .Sales) "SALES", ROUND(SUM(order_item_table.Profit ),2)AS "TOTAL PROFIT",  -- we use this to find profit and sales and the insight on the product level of risk --  
 ROUND(ROUND(SUM(order_item_table.Profit ),2)/ SUM(order_item_table .Sales),2) AS "PROFT PER SALE rounded to the nearhteds thousand ",  -- we also how many order per locatiom -- 
 CASE
 	WHEN orders_table.Geography LIKE '%California%' THEN 'California'     -- case funtion to group them by state in the following queries we break then by state -- 
	WHEN orders_table.Geography LIKE '%Utah%' THEN 'Utah'
	WHEN orders_table.Geography LIKE '%Oregon%' THEN 'Oregon' 
	WHEN orders_table.Geography LIKE '%New Mexico%' THEN 'New Mexico' 
	WHEN orders_table.Geography LIKE '%Washington%' THEN 'Washington'
	WHEN orders_table.Geography LIKE '%Colorado%' THEN 'Colorado' 
	WHEN orders_table.Geography LIKE '%Arizona%' THEN 'Arizona' 
	WHEN orders_table.Geography LIKE '%Montana%' THEN 'Montana' 
	ElSE 'Other'
 END 'State'
FROM order_item_table
RIGHT JOIN  orders_table 
ON order_item_table."Order ID" =orders_table."Order ID" 
GROUP BY 'State' , orders_table.Geography
ORDER BY "TOTAL PROFIT" DESC

-- CALIFORNIA -- 

SELECT orders_table.Geography, COUNT( orders_table.Geography) AS " Lcation" , SUM(order_item_table .Sales) "SALES", ROUND(SUM(order_item_table.Profit ),2)AS "TOTAL PROFIT",  
 ROUND(ROUND(SUM(order_item_table.Profit ),2)/ SUM(order_item_table .Sales),2) AS "PROFT PER SALE rounded to the nearhteds thousand "
FROM order_item_table
RIGHT JOIN  orders_table 
ON order_item_table."Order ID" =orders_table."Order ID" 
WHERE orders_table.Geography  LIKE '%California%'
GROUP BY  orders_table.Geography
ORDER BY "TOTAL PROFIT" DESC

-- Utah --

SELECT orders_table.Geography, COUNT( orders_table.Geography) AS " Lcation" , SUM(order_item_table .Sales) "SALES", ROUND(SUM(order_item_table.Profit ),2)AS "TOTAL PROFIT",  
 ROUND(ROUND(SUM(order_item_table.Profit ),2)/ SUM(order_item_table .Sales),2) AS "PROFT PER SALE rounded to the nearhteds thousand "
FROM order_item_table
RIGHT JOIN  orders_table 
ON order_item_table."Order ID" =orders_table."Order ID" 
WHERE orders_table.Geography  LIKE '%Utah%'
GROUP BY  orders_table.Geography
ORDER BY "TOTAL PROFIT" DESC

--Oreon --

SELECT orders_table.Geography, COUNT( orders_table.Geography) AS " Lcation" , SUM(order_item_table .Sales) "SALES", ROUND(SUM(order_item_table.Profit ),2)AS "TOTAL PROFIT",  
 ROUND(ROUND(SUM(order_item_table.Profit ),2)/ SUM(order_item_table .Sales),2) AS "PROFT PER SALE rounded to the nearhteds thousand "
FROM order_item_table
RIGHT JOIN  orders_table 
ON order_item_table."Order ID" =orders_table."Order ID" 
WHERE orders_table.Geography  LIKE '%Oregon%'
GROUP BY  orders_table.Geography
ORDER BY "TOTAL PROFIT" DESC

-- New Mexico --

SELECT orders_table.Geography, COUNT( orders_table.Geography) AS " Lcation" , SUM(order_item_table .Sales) "SALES", ROUND(SUM(order_item_table.Profit ),2)AS "TOTAL PROFIT",  
 ROUND(ROUND(SUM(order_item_table.Profit ),2)/ SUM(order_item_table .Sales),2) AS "PROFT PER SALE rounded to the nearhteds thousand "
FROM order_item_table
RIGHT JOIN  orders_table 
ON order_item_table."Order ID" =orders_table."Order ID" 
WHERE orders_table.Geography  LIKE '%New Mexico%'
GROUP BY  orders_table.Geography
ORDER BY "TOTAL PROFIT" DESC

-- Washington-- 

SELECT orders_table.Geography, COUNT( orders_table.Geography) AS " Lcation" , SUM(order_item_table .Sales) "SALES", ROUND(SUM(order_item_table.Profit ),2)AS "TOTAL PROFIT",  
 ROUND(ROUND(SUM(order_item_table.Profit ),2)/ SUM(order_item_table .Sales),2) AS "PROFT PER SALE rounded to the nearhteds thousand "
FROM order_item_table
RIGHT JOIN  orders_table 
ON order_item_table."Order ID" =orders_table."Order ID" 
WHERE orders_table.Geography  LIKE '%Washington%'
GROUP BY  orders_table.Geography
ORDER BY "TOTAL PROFIT" DESC

-- Colorado --

SELECT orders_table.Geography, COUNT( orders_table.Geography) AS " Lcation" , SUM(order_item_table .Sales) "SALES", ROUND(SUM(order_item_table.Profit ),2)AS "TOTAL PROFIT",  
 ROUND(ROUND(SUM(order_item_table.Profit ),2)/ SUM(order_item_table .Sales),2) AS "PROFT PER SALE rounded to the nearhteds thousand "
FROM order_item_table
RIGHT JOIN  orders_table 
ON order_item_table."Order ID" =orders_table."Order ID" 
WHERE orders_table.Geography  LIKE '%Colorado%'
GROUP BY  orders_table.Geography
ORDER BY "TOTAL PROFIT" DESC

-- Arizona --

SELECT orders_table.Geography, COUNT( orders_table.Geography) AS " Lcation" , SUM(order_item_table .Sales) "SALES", ROUND(SUM(order_item_table.Profit ),2)AS "TOTAL PROFIT",  
 ROUND(ROUND(SUM(order_item_table.Profit ),2)/ SUM(order_item_table .Sales),2) AS "PROFT PER SALE rounded to the nearhteds thousand "
FROM order_item_table
RIGHT JOIN  orders_table 
ON order_item_table."Order ID" =orders_table."Order ID" 
WHERE orders_table.Geography  LIKE '%Arizona%'
GROUP BY  orders_table.Geography
ORDER BY "TOTAL PROFIT" DESC


-- Montana -- 

SELECT orders_table.Geography, COUNT( orders_table.Geography) AS " Lcation" , SUM(order_item_table .Sales) "SALES", ROUND(SUM(order_item_table.Profit ),2)AS "TOTAL PROFIT",  
 ROUND(ROUND(SUM(order_item_table.Profit ),2)/ SUM(order_item_table .Sales),2) AS "PROFT PER SALE rounded to the nearhteds thousand "
FROM order_item_table
RIGHT JOIN  orders_table 
ON order_item_table."Order ID" =orders_table."Order ID" 
WHERE orders_table.Geography  LIKE '%Montana%'
GROUP BY  orders_table.Geography
ORDER BY "TOTAL PROFIT" DESC






