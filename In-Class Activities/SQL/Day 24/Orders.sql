create table customer (
customerid serial not null primary key,
customername varchar(100) not null
);
create table shippingmethod (
shippingmethodid serial not null primary key,
shippingmethod varchar(50) not null,
costperpound decimal,
estimatedtimetodeliver int);
create table "order" (
orderid serial not null primary key,
customerid int not null references customer(customerid),
orderdate date not null default now(),
shippingmethodid int references shippingmethod (shippingmethodid),
taxrate decimal not null default 0,
shippingcharge decimal not null default 0,
ordertotal decimal not null default 0);
create table productcategory (
productcategoryid serial not null primary key,
categoryname varchar(100));
create table product (
productid serial not null primary key,
productname varchar(100) not null,
productcategoryid int not null references productcategory (productcategoryid),
productcost decimal not null default 0,
price decimal not null default 0,
weightinpounds decimal not null default 0);
create table orderdetails (
orderdetailid serial not null primary key,
orderid int not null references "order" (orderid),
productid int not null references product (productid),
quantity decimal not null default 1);



SELECT 'postgresql' AS dbms,t.table_catalog,t.table_schema,t.table_name,c.column_name,c.ordinal_position,c.data_type,c.character_maximum_length,n.constraint_type,k2.table_schema,k2.table_name,k2.column_name FROM information_schema.tables t NATURAL LEFT JOIN information_schema.columns c LEFT JOIN(information_schema.key_column_usage k NATURAL JOIN information_schema.table_constraints n NATURAL LEFT JOIN information_schema.referential_constraints r)ON c.table_catalog=k.table_catalog AND c.table_schema=k.table_schema AND c.table_name=k.table_name AND c.column_name=k.column_name LEFT JOIN information_schema.key_column_usage k2 ON k.position_in_unique_constraint=k2.ordinal_position AND r.unique_constraint_catalog=k2.constraint_catalog AND r.unique_constraint_schema=k2.constraint_schema AND r.unique_constraint_name=k2.constraint_name WHERE t.TABLE_TYPE='BASE TABLE' AND t.table_schema NOT IN('information_schema','pg_catalog');


insert into customer (customername)
values ('Tom'),
	   ('Marge'),
	   ('Neha'),
	   ('Sunnit'),
	   ('Chen'),
	   ('Dirk'),
	   ('Sasha'),
	   ('Mikhail'),
	   ('Nancy');
	   
insert into shippingmethod (shippingmethod, costperpound, estimatedtimetodeliver)
values ('UPS', 5.99, 5),
	   ('Fedex Ground', 9.85, 4),
	   ('Fedex', 14.99, 2),
	   ('Next Day', 24.99, 1);

insert into productcategory (categoryname)
values ('Widgets'),
	   ('Wodgets'),
	   ('Whatchamacallits'),
	   ('Thingamabobs');

insert into product (productname, productcategoryid, productcost, price, weightinpounds)
values ('Skink', 1, 10.8, 17, 1),
	   ('Stink', 1, 17.23, 25, 2),
	   ('Stank', 1, 2.34, 5, 0.4),
	   ('Stunk', 1, 5.80, 10, 0.5),
	   ('Thing1', 2, 89, 125, 5),
	   ('Thing2', 2, 89, 125, 5),
	   ('Cat', 2, 999, 1875, 10),
	   ('Hat', 2, 89.99, 120, .25),
	   ('Dino', 3, 0, 60, 145),
	   ('Bone', 3, 0, 3.99, 2),
	   ('Dodo bird', 3, 24000, 32000, 100),
	   ('Thimble', 4, 1.25, 3, .05),
	   ('Sewing needles (10)', 4, .99, 1.98, .01),
	   ('Ribbon', 4, 3, 4.59, .02);

insert into "order" (customerid, shippingmethodid, taxrate)
values (1, 1, 6.9),
	   (1, 3, 6.9),
	   (1, 3, 6.9),
	   (1, 1, 6.9),
	   (2, 1, 5),
	   (2, 4, 5),
	   (2, 3, 5),
	   (2, 3, 5),
	   (3, 1, 4.7),
	   (3, 1, 4.7),
	   (3, 1, 4.7),
	   (4, 1, 4.7),	   (4, 1, 4.7),	   (4, 1, 4.7),	   (4, 1, 4.7),
	   (5, 4, 8.25),
	   (5, 4, 8.25),
	   (5, 4, 8.25),
	   (5, 4, 8.25),
	   (5, 4, 8.25),
	   (5, 4, 8.25),
	   (6, 3, 2.24),(6, 3, 2.24),(6, 3, 2.24),
	   (7, 2, 8.25),(7, 2, 8.25),
	   (9, 1, 6), (9,1,6);
	   
select max(productid) from product; --14
select max(orderid) from "order";  --28

insert into orderdetails (productid, orderid, quantity)
values (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int),
	   (floor(random() * 14 + 1)::int, floor(random() * 28 + 1)::int, floor(random() * 25 + 1)::int)
	   
	   
	   
	   
SELECT 'postgresql' AS dbms,t.table_catalog,t.table_schema,t.table_name,c.column_name,c.ordinal_position,c.data_type,c.character_maximum_length,n.constraint_type,k2.table_schema,k2.table_name,k2.column_name FROM information_schema.tables t NATURAL LEFT JOIN information_schema.columns c LEFT JOIN(information_schema.key_column_usage k NATURAL JOIN information_schema.table_constraints n NATURAL LEFT JOIN information_schema.referential_constraints r)ON c.table_catalog=k.table_catalog AND c.table_schema=k.table_schema AND c.table_name=k.table_name AND c.column_name=k.column_name LEFT JOIN information_schema.key_column_usage k2 ON k.position_in_unique_constraint=k2.ordinal_position AND r.unique_constraint_catalog=k2.constraint_catalog AND r.unique_constraint_schema=k2.constraint_schema AND r.unique_constraint_name=k2.constraint_name WHERE t.TABLE_TYPE='BASE TABLE' AND t.table_schema NOT IN('information_schema','pg_catalog');


select * from customer;

-- customer name with order details
select customer.customername, "order".*
from "order"
inner join customer
on customer.customerid = "order".customerid
order by customer.customername;

-- to calculate shipping charge
select o.orderid, sm.costperpound * od.quantity * p.weightinpounds as ShippingCharge
from "order" o inner join shippingmethod sm
	on o.shippingmethodid = sm.shippingmethodid
inner join orderdetails od
	on o.orderid = od.orderid
inner join product p
	on od.productid = p.productid

-- which customers don't have orders
select c.*
from customer c left join "order" o
	on c.customerid = o.customerid
where o.orderid is null;

-- which products have not been ordered
select p.*
from orderdetails od right join product p
	on od.productid = p.productid
where od.orderdetailid is null;

-- how many orders has each customer placed?
select customername, count(o.orderid) as numberoforders
from customer c left join "order" o
	on c.customerid = o.customerid
group by c.customerid
having count(o.orderid) > 3             -- alias of numberoforders does not work here
order by numberoforders desc;

-- total number of products sold in each category
select categoryname, count(distinct p.productid) as numberofproductssold, sum(quantity) as quantityofproductssold
from orderdetails od inner join product p
	on od.productid = p.productid
inner join productcategory pc
	on pc.productcategoryid = p.productcategoryid
group by categoryname;

-- how many days it will take to ship each order
select o.orderid, (select estimatedtimetodeliver from shippingmethod sm 
		where o.shippingmethodid = sm.shippingmethodid) as timetodeliver
from "order" o;

-- total quantity by order by customer (subquery method - can also do joins)
select c.customername, count(orderid), sum(totalquantity) as totalquantity
from customer c inner join (
	select o.customerid, o.orderid, sum(quantity) as totalquantity
	from "order" o inner join orderdetails od
		on o.orderid = od.orderid
	group by o.orderid) a
on c.customerid = a.customerid
group by c.customername;

--(same as above, but using joins instead)
select c.customername, count(distinct o.orderid) as countoforders, sum(quantity) as totalquantity
from customer c inner join "order" o
	on c.customerid = o.customerid
inner join orderdetails od
	on o.orderid = od.orderid
group by c.customername;

--how many orders are on the last day of this customer's orders
-- which orders are furthest into the future for each customer
create view ordersfurthestdate
as

select ord.* 
from "order" ord
inner join (
	select customerid, max(orderdate) as maxdate            -- this subquery finds the max date
	from "order" o
	group by customerid) a
on ord.customerid = a.customerid
and ord.orderdate = a.maxdate;

select * from ordersfurthestdate;

select c.customername, count(orderid) as countoforders, sum(ordertotal) as total
from ordersfurthestdate as ofd inner join customer c
	on ofd.customerid = c.customerid
group by c.customername;

-- What is the total profit (not including shipping) for the orders on July 25?
select sum(quantity * (price - productcost)) as profit
from "order" o
inner join orderdetails od
	on o.orderid = od.orderid
inner join product p
	on p.productid = od.productid
where o.orderdate = '2019-07-25';

select orderdate, count(*) from "order" group by orderdate;



-- What are the total sales and total profit by product category for each customer for
-- the orders on July 26?

select customername, categoryname, sum(quantity*price)

