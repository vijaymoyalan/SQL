use vijay_activities;
select * from departments;
select * from dept_emp;


-- Activity 1
-- creating database
create database vijay_activities;
commit;

-- creating the table
create table salesman (
	salesman_id int,
    saleman		varchar(20),
    city		varchar(20),
    commissiom	int,
    Primary key(salesman_id));
   
    describe salesman;
	

-- Activity 2    
-- Inserting the values
    insert into salesman values (1001,'Vijay Moyalan','Pune',10);
    insert into salesman values (1002,'Pankaj Tiwary','Lucknow',12);
    insert into salesman values (1003,'KC',' Mumbai',11);
    insert into salesman values (1004,'Nilesh N',' Mumbai',11);
    insert into salesman values (1005,'Amit K',' Mumbai',12);
 
 -- View the table
    select * from salesman;
	
-- Activity 3
    
    select count(city) from salesman;

	select salesman_id,city from salesman;
    select * from salesman where city='pune';
    select salesman_id,commissiom from salesman where saleman='KC';

-- ACTIVITY 4
-- alter command
	alter table salesman
    add Product varchar(10);
    
-- change the name of table
ALTER TABLE orders RENAME TO new_orders;
ALTER TABLE new_orders RENAME TO orders;
    
-- delete command
	alter table salesman
    drop column commissiom;
    
    alter table salesman
    modify column Product int ;
    
-- Activity 5
-- update query
	update salesman set saleman='Update', Product=20 where salesman_id=1002;

-- delete query
	delete from salesman where saleman='KC';
    rollback;


-- sorting by 2 column.
select * from salesman order by city desc, saleman desc;

-- distinct
select distinct(city) from salesman order by city desc ;

-- operator
select * from salesman where city = 'Pune' ;

select * from salesman where city = 'Pune' and salesman_id='1001' ;


-- ACTIVITY 6

-- Create a table named orders
create table orders(
    order_no int primary key, purchase_amount float, order_date date,
    customer_id int, salesman_id int);

-- Add values to the table
insert into orders values
(70001, 150.5, '2012-10-05', 3005, 5002), 
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001), 
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002), 
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760, '2012-08-15', 3002, 5001), 
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.4, '2012-10-10', 3009, 5003), 
(70012, 250.45, '2012-06-27', 3008, 5002),
(70011, 75.29, '2012-08-17', 3003, 5007), 
(70013, 3045.6, '2012-04-25', 3002, 5001);

select * from orders order by salesman_id asc;

-- Get all salesman ids without any repeated values
select distinct(salesman_id) from orders order by salesman_id asc;

-- Display the order number ordered by date in ascending order
select order_no from orders order by order_date asc;

-- Display the order number ordered by purchase amount in descending order
select order_no from orders order by purchase_amount desc;

-- Display the full data of orders that have purchase amount less than 500.
select * from orders where purchase_amount <500;

-- Display the full data of orders that have purchase amount between 1000 and 2000.
select * from orders where purchase_amount between 1000 and 2000;



-- Activity 7


--   	  Write an SQL statement to find the total purchase amount of all orders.
select round(sum(purchase_amount)) as TOTAL from orders;

--        Write an SQL statement to find the average purchase amount of all orders.
select round(avg(purchase_amount)) as Average from orders;

--        Write an SQL statement to get the maximum purchase amount of all the orders.
select max(purchase_amount) from orders;

--        Write an SQL statement to get the minimum purchase amount of all the orders.
select min(purchase_amount) from orders;

--        Write an SQL statement to find the number of salesmen listed in the table.
select count(distinct(salesman_id)) COUNT from orders;


-- Activity 8

 --   Write an SQL statement to find the highest purchase amount ordered by the each customer with their ID and highest purchase amount.
 select customer_id,max(purchase_amount) as Amount from orders group by customer_id ;
 
 --   Write an SQL statement to find the highest purchase amount on '2012-08-17' for each salesman with their ID.
 select salesman_id, max(purchase_amount) as ToTAL, order_date from orders where order_date='2012-08-17' group by salesman_id, order_date;
 
 --   Write an SQL statement to find the highest purchase amount with their ID and order date, for only those customers who have a higher purchase amount within the list [2030, 3450, 5760, 6000].
 SELECT customer_id, order_date, MAX(purchase_amount) AS "Max Amount" FROM orders GROUP BY customer_id, order_date HAVING MAX(purchase_amount) IN(2030, 3450, 5760, 6000);
 
 select * from customers;
select * from orders;
select * from salesman;

select distinct(s.saleman) as sales_man,s.city as city from salesman s, salesman ss
where s.city = ss.city
and s.salesman_id <> ss.salesman_id
order by s.city;
 
 
 
 -- Activity 9
 -- Create the customers table
create table customers (
    customer_id int primary key, customer_name varchar(32),
    city varchar(20), grade int, salesman_id int);

-- Insert values into it
insert into customers values 
(3002, 'Nick Rimando', 'New York', 100, 5001), 
(3007, 'Brad Davis', 'New York', 200, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3008, 'Julian Green', 'London', 300, 5002),
(3004, 'Fabian Johnson', 'Paris', 300, 5006), 
(3009, 'Geoff Cameron', 'Berlin', 100, 5003),
(3003, 'Jozy Altidor', 'Moscow', 200, 5007), 
(3001, 'Brad Guzan', 'London', 300, 5005);
select * from customers;
select * from orders;
select * from salesman;

   -- Write an SQL statement to know which salesman are working for which customer.
   select ss.salesman_id as Sales_Man, s.customer_name as Customer from customers s
   inner join customers ss on s.salesman_id=ss.salesman_id order by s.salesman_id;

   -- Write an SQL statement to make a list in ascending order for the customer who holds a grade less than 300 and works either through a salesman.
   select distinct(a.customer_id) as ID,a.customer_name as cutomer,a.city as city, b.salesman_id as salesman from customers a
   left join customers b on a.salesman_id=b.salesman_id where b.grade<300 order by a.customer_id;
 
 --  Write an SQL statement to find the list of customers who appointed a salesman for their jobs who gets a commission from the company is more than 12%.
 select a.customer_name, a.salesman_id, b.grade from customers a
 inner join customers b on a.salesman_id=b.salesman_id where b.grade > 120;
 
  --  Write an SQL statement to find the details of a order 
  -- i.e. order number, order date, amount of order, which customer gives the order and which salesman works for that customer and commission rate he gets for an order.

select a.order_no, a.order_date, a.purchase_amount, b.customer_name as Customer , b.grade, c.saleman as Salesman, c.comission FROM orders a 
inner join customers b on a.customer_id=b.customer_id 
inner join salesman c on a.salesman_id=c.salesman_id;

commit;

-- Activity 10 --
select * from customers;
select * from orders;
select * from salesman;

 --   Write a query to find all the orders issued against the salesman who may works for customer whose id is 3007.
 select * from orders o where o.salesman_id = (select c.salesman_id from customers c where c.customer_id=3007);
 
 --   Write a query to find all orders attributed to a salesman in Pune.
 select * from orders o where o.salesman_id=(select s.salesman_id from salesman s where s.city='Pune');
 
 --   Write a query to count the customers with grades above New York's average.
select grade, COUNT(*) from customers 
group by grade having grade>(select avg(grade) FROM customers WHERE city='New York');
 
 --   Write a query to extract the data from the orders table for those salesman who earned the maximum commission
 select * from orders where salesman_id =(select salesman_id from salesman where comission=(select max(comission) from salesman));



