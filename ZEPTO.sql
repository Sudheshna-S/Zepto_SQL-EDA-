-- Database Creation
create database zepto_db; 
use zepto_db;
        
describe zepto;

-- Renaming column
alter table zepto
rename column ï»¿Category to Category;

-- Data Exploration

-- count of rows
select count(*) from zepto;

-- first 10 rows
select * from zepto
limit 10;

-- null values
select * from zepto
where category is null or
	  name is null or
      discountPercent is null or
      availableQuantity is null or
      discountedSellingPrice is null or
      weightInGms is null or
      outOfStock is null or
      quantity is null;
	
-- different product categories
select distinct category 
from zepto
order by category;

-- products in stock vs out-of-stock
select outOfStock, count(Category) as count 
from zepto  
group by   outOfStock; 

-- product names present more than once
select name, count(category) as "No. of SKU"
from zepto
group by name
having count(category)
order by count(category) DESC;

-- Data Cleaning

-- products with no pricing
select * from zepto
where mrp = 0 or discountedSellingPrice = 0;

delete from zepto 
where mrp = 0;

set sql_safe_updates = 1;

-- convert paise to rupees

update zepto
set mrp = mrp/100, discountedSellingPrice = discountedSellingPrice/100;

select mrp, discountedSellingPrice from zepto;

-- Q1. Find the top 10 best value products based on discount %

select distinct name, mrp, discountPercent
from zepto
order by discountPercent desc
limit 10;

-- Q2. What are the products with high MRP but outofstock

select distinct name, mrp, outOfStock
from zepto
where mrp > 300 and outOfStock = "TRUE"
order by mrp desc;

-- Q3. Calculate the estimated revenue for each category

select category, sum(discountedSellingPrice * availableQuantity) as Total_Revenue
from zepto
group by category
order by Total_Revenue;

-- Q4. Find all products where mrp is greater than rs.500 and discount is less than 10%

select  distinct name, discountPercent, mrp from zepto
where mrp > 500 and discountPercent < 10
order by mrp desc, discountPercent desc;

-- Q5. Identify the top 5 categories offering the highest average discount %

select category, round(avg(discountPercent),2) as "avg_discount"
from zepto 
group by category
order by "avg_discount" desc
limit 5;

-- Q6. Find the price per gram for products above 100g and sort by best value

select distinct name, weightInGms, discountedSellingPrice, round(discountedSellingPrice/ weightInGms,2) as price_per_gram
from zepto
where weightInGms >= 100
order by price_per_gram;

-- Q7. Group the product into categories like bulk, low, medium 

select distinct name, weightInGms,
	case when weightInGms < 1000 then 'Low'
		 when weightInGms < 5000 then 'Medium'
         else 'Bulk'
         end as weight_category
from zepto;

-- Q8. What is the Total Inventory Weight Per Category

select category, sum(weightInGms * availableQuantity) as total_weight
from zepto 
group by category
order by total_weight;









