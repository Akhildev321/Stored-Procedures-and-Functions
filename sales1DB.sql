create database sales1db;
use sales1db;

create table customers (
    customer_id int primary key auto_increment,
    name varchar(50),
    city varchar(30),
    phone varchar(15)
);

create table orders (
    order_id int primary key auto_increment,
    customer_id int,
    product varchar(55),
    amount decimal(10,2),
    order_date date,
    foreign key (customer_id) references customers(customer_id)
);

-- adding customers data
insert into customers (name, city, phone) values
('akhil dev', 'hyderabad', '9876543210'),
('sneha singh', 'mumbai', '9123456780'),
('raj patel', 'delhi', '9988776655'),
('shreyas iyer', 'punjab', '9012345678'),
('pat cummins', 'hyderabad', '9876543255'),
('rohit sharma', 'mumbai', '91234565678'),
('axar patel', 'delhi', '9988755554'),
('rashid khan', 'gujarat', '9063245559'),
('nkr', 'hyderabad', '9999999999'),
('hardik pandya', 'mumbai', '8888888888'),
('lalith dora', 'delhi', '8585858585'),
('virat kohli', 'bengaluru', '9988445566');

-- adding orders data (order_id auto-increments)
insert into orders (customer_id, product, amount, order_date) values
(1, 'laptop', 55000, '2025-01-01'),
(2, 'smartphone', 25000, '2025-02-01'),
(5, 'mouse', 800, '2025-01-01'),
(12, 'keyboard', 1500, '2025-01-30'),
(4, 'cricket bat', 3500, '2025-02-03'),
(10, 'tablet', 18000, '2024-02-03'),
(3, 'headphones', 2200, '2025-05-10'),
(11, 'gaming chair', 12000, '2025-07-20'),
(9, 'camera', 45000, '2025-07-21'),
(6, 'gloves', 500, '2025-08-11'),
(10, 'smart watch', 7000, '2024-11-21'),
(5, 'laptop', 55000, '2024-12-31'),
(2, 'smartphone', 25000, '2025-08-14'),
(6, 'mouse', 800, '2025-05-29'),
(3, 'keyboard', 1500, '2025-03-15');

-- Procedure 1 - Get Orders by city
delimiter //

create procedure get_orders_by_city(in p_city varchar(30))
begin
    select c.name as customer_name,
           c.city,
           o.product,
           concat('₹', format(o.amount, 2)) as amount_in_rupees,
           o.order_date
    from orders o
    join customers c on o.customer_id = c.customer_id
    where c.city = p_city;
end //

delimiter ;
 
call get_orders_by_city ('delhi');
call get_orders_by_city ('mumbai');

-- Procedure 2 Get Total Sales
delimiter //

create procedure get_total_sales()
begin
    select concat('₹', format(sum(amount), 2)) as total_sales_in_rupees
    from orders;
end //

delimiter ;
call get_total_sales();

delimiter //

-- Function - Total Sales 
create function total_sales()
returns varchar(20)
deterministic
begin
    declare total varchar(20);
    select concat('₹', format(sum(amount), 2)) into total
    from orders;
    return total;
end //

delimiter ;

select total_sales();

-- For city
delimiter //
create function total_sales_for_city(city_name varchar(30))
returns decimal(10,2)
deterministic
begin
    declare total decimal(10,2);
    select sum(amount) into total
    from orders o
    join customers c on o.customer_id = c.customer_id
    where c.city = city_name;
    return total;
end //
delimiter ;

select total_sales_for_city('mumbai')

-- Procedure - Sales between Dates
delimiter //
create procedure get_sales_between_dates(in start_date date, in end_date date)
begin
    select o.order_id, c.name as customer_name, c.city, o.product, o.amount, o.order_date
    from orders o
    join customers c on o.customer_id = c.customer_id
    where o.order_date between start_date and end_date
    order by o.order_date;
end //
delimiter ;

call get_sales_between_dates('2025-01-01', '2025-03-31');
