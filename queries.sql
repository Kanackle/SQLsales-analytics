USE northwind;

select OrderID, SUM(UnitPrice * Quantity) as Revenue
from orderdetails
group by OrderID;

select orders.OrderID, year(orders.OrderDate) as year, month(orders.OrderDate) as month,
sum(orderdetails.UnitPrice * orderdetails.Quantity * (1-orderdetails.Discount)) as Revenue
from orders 
join orderdetails 
on orderdetails.OrderID = orders.OrderID
group by orders.OrderID
order by year, month;

select year(orders.OrderDate) as year, month(orders.OrderDate) as month,
sum(orderdetails.UnitPrice * orderdetails.Quantity * (1-orderdetails.Discount)) as Revenue
from orders 
join orderdetails 
on orderdetails.OrderID = orders.OrderID
group by year(orders.OrderDate), month(orders.OrderDate)
order by year, month;


-- select OrderID, year(OrderDate) as Year, month(OrderDate) as Month
-- from orders;