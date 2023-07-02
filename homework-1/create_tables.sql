-- SQL-команды для создания таблиц

create table customers
(
	customer_id char(5) primary key,
	company_name varchar(70) not null,
	contact_name varchar(70) not null
);

create table employees (
	employee_id int primary key,
	first_name varchar(30) not null,
	last_name varchar(30) not null,
	title varchar(50) not null,
	birth_date date not null,
	notes text
);

create table orders (
	order_id int primary key,
	customer_id char(5) unique REFERENCES customers(customer_id) not null,
	employee_id int REFERENCES employees(employee_id) not null,
	order_date date not null,
	ship_city varchar(50) not null
)
