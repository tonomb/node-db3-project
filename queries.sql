-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
select productname, categoryname from product
left join category on category.id = product.categoryid
order by 2, 1
;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
select [order].id, [order].OrderDate, shipper.companyname
from [order]
join shipper on shipper.id = [order].shipvia
where [order].orderDate <  '2012-08-09'
order by orderDate desc
;

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
select productname, quantity from orderdetail
join product on product.Id = orderdetail.ProductId
where orderid = '10251'
order by 1
;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
select [order].id as orderId, customer.CompanyName, employee.lastname as employeeLastName
from [order]
join customer on customer.id = [order].CustomerId
join employee on employee.id = [order].employeeid
;