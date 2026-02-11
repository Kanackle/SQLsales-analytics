USE northwind;

/* ----------------------------------------------------
	Sales & Customer Analytics (Northwinds Database)
    Author: Kanak Somani
    Environment: MySQL/MySQL Workbench
    ---------------------------------------------------- */

/* -------------------------------------------
		REVENUE ANALYTICS
	------------------------------------------ */
    
-- Monthly revenue trend
select year(o.OrderDate) as year, month(o.OrderDate) as month,
sum(od.UnitPrice * od.Quantity * (1-od.Discount)) as Revenue
from orders o 
join orderdetails od 
on od.OrderID = o.OrderID
group by year(o.OrderDate), month(o.OrderDate)
order by year, month;

    
-- Revenue by order
select o.OrderID, year(o.OrderDate) as year, month(o.OrderDate) as month,
sum(od.UnitPrice * od.Quantity * (1-od.Discount)) as Revenue,
c.CompanyName
from orders o
join orderdetails od
on od.OrderID = o.OrderID
join customers c
on o.CustomerID = c.CustomerID
group by o.OrderID, year(o.OrderDate), month(o.OrderDate)
order by year, month;

/* ------------------------------------------
	PRODUCT REVENUE ANALYSIS
    ----------------------------------------- */

-- top 5 products by revenue
select p.ProductName, sum(od.UnitPrice * od.Quantity * (1-od.Discount)) as Revenue
from products p
join orderdetails od
on p.ProductID = od.ProductID
group by p.ProductID
limit 5;

-- Total revenue per product per company/customer
Select p.ProductName,
sum(od.UnitPrice * od.Quantity * (1-od.Discount)) as Revenue,
c.CompanyName
from orderdetails od
join products p
on od.ProductID = p.ProductID
join orders o
on od.OrderID = o.OrderID
join customers c
on c.CustomerID = o.CustomerID
group by p.ProductName, c.CompanyName
order by c.CompanyName, Revenue desc;


/* -------------------------------------
	CUSTOMER REVENUE ANALYSIS
    ------------------------------------ */

-- order total revenue by customer
Select c.CustomerID, c.CompanyName,
sum(od.UnitPrice * od.Quantity * (1-od.Discount)) as Revenue
from orders o
join customers c 
on c.CustomerID = o.CustomerID 
join orderdetails od
on o.OrderID = od.OrderID
group by CustomerID
order by Revenue desc;

-- Total orders + revenue per customer
Select c.CompanyName, count(Distinct o.OrderID) as TotalOrders, 
sum(od.UnitPrice * od.Quantity * (1-od.Discount)) as Revenue
from customers c
join orders o 
on c.CustomerID = o.CustomerID
join OrderDetails od
on o.OrderID = od.OrderID
group by c.CompanyName
order by TotalOrders desc, Revenue desc;


/* --------------------------------------
	SALES REP ANALYSIS
    ------------------------------------- */
-- revenue by company by salesperson
select c.CompanyName, concat(e.FirstName,' ',e.LastName) as SalesRep,
sum(od.UnitPrice * od.Quantity * (1-od.Discount)) as Revenue
from orders o
join employees e
on o.EmployeeID = e.EmployeeID
join orderdetails od
on o.OrderID = od.OrderID
join customers c
on o.CustomerID = c.CustomerID
group by c.CompanyName, e.EmployeeID, SalesRep
order by Revenue desc;


-- Customers per Sales Rep
Select concat(e.FirstName,' ',e.LastName) as SalesRep, 
Count(Distinct o.CustomerID) as TotalCustomers
from employees e
join orders o
on e.EmployeeID = o.EmployeeID
group by e.EmployeeID
order by TotalCustomers desc;

-- Total and average revenue per sales rep
Select concat(e.FirstName,' ',e.LastName) as SalesRep, 
sum(od.UnitPrice * od.Quantity * (1-od.Discount)) as Revenue,
sum(od.UnitPrice * od.Quantity * (1-od.Discount)) / count(distinct o.CustomerID) as AvgRevPerCustomer
from employees e
join orders o
on e.EmployeeID = o.EmployeeID
join orderdetails od
on o.OrderID = od.OrderID
group by e.EmployeeID
order by Revenue desc;


/* --------------------------
	GEOGRAPHY REVENUE ANALYSIS
    ------------------------- */

/* Query 7
-- revenue by region
****** THIS IS WRONG - TERRITORY DOUBLE COUNTS ********

select territories.TerritoryDescription,
sum(orderdetails.UnitPrice * orderdetails.Quantity * (1-orderdetails.Discount)) as Revenue
from territories
join employeeterritories
on territories.TerritoryID = employeeterritories.TerritoryID
join orders
on employeeterritories.EmployeeID = orders.EmployeeID
join orderdetails
on orders.OrderID = orderdetails.OrderID
group by territories.TerritoryID, territories.TerritoryDescription
order by Revenue desc;
*/

Select o.ShipCountry, sum(od.UnitPrice * od.Quantity * (1-od.Discount)) as Revenue
from Orders o
join OrderDetails od 
on od.OrderID = o.OrderID
group by o.ShipCountry
order by revenue desc;





