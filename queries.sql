USE northwind;

select * from orders;
select * from orderdetails;
select * from customers;
select * from suppliers;


-- Query 1:
-- revenue over time, by OrderID, per month
select orders.OrderID, year(orders.OrderDate) as year, month(orders.OrderDate) as month,
sum(orderdetails.UnitPrice * orderdetails.Quantity * (1-orderdetails.Discount)) as Revenue
from orders 
join orderdetails 
on orderdetails.OrderID = orders.OrderID
group by orders.OrderID
order by year, month;


-- Query 2
-- revenue over time by year and month
select year(orders.OrderDate) as year, month(orders.OrderDate) as month,
sum(orderdetails.UnitPrice * orderdetails.Quantity * (1-orderdetails.Discount)) as Revenue
from orders 
join orderdetails 
on orderdetails.OrderID = orders.OrderID
group by year(orders.OrderDate), month(orders.OrderDate)
order by year, month;


-- Query 3
-- order total revenue by customer
Select customers.CustomerID, customers.CompanyName,
sum(orderdetails.UnitPrice * orderdetails.Quantity * (1-orderdetails.Discount)) as Revenue
from orders
join customers
on customers.CustomerID = orders.CustomerID 
join orderdetails
on orders.OrderID = orderdetails.OrderID
group by CustomerID
order by Revenue desc;

-- revenue by product per customer
-- Select orders.OrderID, customer.CustomerID, customer.CustomerName,
-- products.ProductID, products.ProductName,
-- sum(orderdetails.UnitPrice * orderdetails.Quantity * (1-orderdetails.Discount)) as Revenue
-- from orderdetails
-- join products
-- on orderdetails.ProductID = products.ProductID;

-- Query 4
-- Total revenue per product per company/customer
Select products.ProductName,
sum(orderdetails.UnitPrice * orderdetails.Quantity * (1-orderdetails.Discount)) as Revenue,
customers.CompanyName
from orderdetails
join products
on orderdetails.ProductID = products.ProductID
join orders
on orderdetails.OrderID = orders.OrderID
join customers
on customers.CustomerID = orders.CustomerID
group by products.ProductName, customers.CompanyName
order by customers.CompanyName, products.ProductName;

-- Query 5
-- revenue by company by salesperson
select customers.CompanyName, concat(employees.FirstName,' ',employees.LastName) as SalesRep,
sum(orderdetails.UnitPrice * orderdetails.Quantity * (1-orderdetails.Discount)) as Revenue
from orders
join employees
on orders.EmployeeID = employees.EmployeeID
join orderdetails
on orders.OrderID = orderdetails.OrderID
join customers
on orders.CustomerID = customers.CustomerID
group by customers.CompanyName, employees.EmployeeID;


-- Query 6
-- top 5 products by revenue
select products.ProductName, sum(orderdetails.UnitPrice * orderdetails.Quantity * (1-orderdetails.Discount)) as Revenue
from products
join orderdetails
on products.ProductID = orderdetails.ProductID
group by products.ProductID
limit 5;


-- Query 7
-- revenue by region
select territories.TerritoryDescription,
sum(orderdetails.UnitPrice * orderdetails.Quantity * (1-orderdetails.Discount)) as Revenue
from territories
join employeeterritories
on territories.TerritoryID = employeeterritories.TerritoryID
-- join employees
-- on employeeterritories.EmployeeID = employees.EmployeeID
join orders
on employeeterritories.EmployeeID = orders.EmployeeID
join orderdetails
on orders.OrderID = orderdetails.OrderID
group by territories.TerritoryID, territories.TerritoryDescription
order by Revenue desc;

-- Query 8
-- Total orders per company
Select CompanyName, count(CompanyName)
from customers
join orders
-- on customers.CustomerID = orders.CustomerID
on orders.CustomerID = customers.CustomerID
group by customers.CompanyName
order by count(CompanyName) desc;

-- Query 9
-- Total revenue per company combined with total orders
Select CompanyName, count(Distinct orders.OrderID) as TotalOrders, 
sum(orderdetails.UnitPrice * orderdetails.Quantity * (1-orderdetails.Discount)) as Revenue
from customers
join orders
on customers.CustomerID = orders.CustomerID
join orderdetails
on orders.OrderID = orderdetails.OrderID
group by CompanyName
order by TotalOrders desc, Revenue desc;