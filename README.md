# SQL--Project-Amazon-Data-Analysis-
this analysis is made to find isight on this public data from amazon and it sales, location, profit 


# Sales & Customer Analysis Project

## Project Overview
In this project, we will analyze the sales and customer data to find insights that can help our business grow

## Dataset
The dataset contains :
- Orders
- Customers
- Products
- Sales and profit data
- geographic information
- sales metrics

## Tools Used
- SQL (SQLite / Deaver)
- Google Sheets

## data preparation:

To make this project easier, we took the original data and separated it into the following tables :

- Orders
- Customers
- Products
- Sales and profit data

we connected them using primary and foreign keys to create a relational database that allows for more complex analysis

## Business Questions

This project aims to answer the following business questions:

1. Which products and categories generate the highest profit?

So after filtering and analyzing the data, we find that accessories are the staples are the highest earning product while accessories are the highest earning category.

For this, I use SQL aggregation functions to join the Order table and Product table. I also decided to use the ranking function to get  more clear order of the ranking of each product and categories and were they stand and use a case statement to group the product and categories in 3 group: top products/category, normal product/category and bad product/category this way we can Cleary see our most seller product/category and how the rest of the product and categories stand and see if we should continue some products/category or we should end selling them

2. Which regions contribute the most to overall revenue?
After analyzing the data and performing queries on it, we see that California is the highest contributor to the profit by a wide margin, with the highest total profit, the most locations, the most sales, the highest profit per sales, and the least is Colorado

3. Are there products that sell well but generate low or negative profit?
Thanks to the insight, we find that there are about 80 bad products with sales and low profit, and among those, there are 17 that have more than 1,000 sales and low to negative profit

4. Which products pose the highest financial risk?

According to the data, the Bush Advantage Collection Racetrack Conference Table is the worst product on the line with more than 1,000 sales and close to around 1,700 in negative profit
