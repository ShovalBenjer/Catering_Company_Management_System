create schema project1;
USE project1;

CREATE TABLE person
(person_ID int,
first_name varchar(20) NOT NULL,
last_name varchar(20) NOT NULL,
email varchar(40) ,
phone_number varchar(40),
PRIMARY KEY (person_ID));

CREATE TABLE customer
(customer_ID int,
first_name varchar(20) NOT NULL,
last_name varchar(20) NOT NULL,
email varchar(40) ,
phone_number varchar(40) ,
credit_card varchar(40) ,
PRIMARY KEY (customer_ID),
foreign key (customer_ID) references person(person_ID));

CREATE TABLE employee
(employee_ID int,
first_name varchar(20) NOT NULL,
last_name varchar(20) NOT NULL,
email varchar(40) ,
phone_number varchar(40),
starting_date date,
seniority_months INt,
payment_per_event int,
PRIMARY KEY (employee_ID),
foreign key (employee_ID) references person(person_ID));

CREATE TABLE waiter
(waiter_ID int,
first_name varchar(20) NOT NULL,
last_name varchar(20) NOT NULL,
email varchar(40) ,
phone_number varchar(40),
starting_date date,
seniority_months INt,
payment_per_event int,
waiter_rank int,
shift varchar(20),
PRIMARY KEY (waiter_ID),
foreign key (waiter_ID) references employee(employee_ID));

CREATE TABLE chef
(chef_ID int,
first_name varchar(20) NOT NULL,
last_name varchar(20) NOT NULL,
email varchar(40) ,
phone_number varchar(40),
starting_date date,
seniority_months INt,
payment_per_event int,
education  varchar(40),
PRIMARY KEY (chef_ID),
foreign key (chef_ID) references employee(employee_ID));

CREATE TABLE dish
(dish_ID int,
dish_name varchar(20) NOT NULL,
category varchar(20) NOT NULL,
kosher varchar(20) ,
cost int ,
price int,
PRIMARY KEY (dish_ID));

CREATE TABLE supplier
(supplier_ID int,
supplier_name varchar(20),
contact_phone  varchar(40),
bank_account_num varchar(20),
PRIMARY KEY (supplier_ID));

CREATE TABLE supplier_order
(order_number int,
supplier_ID int,
order_date date,
order_price int,
delay  varchar(5),
PRIMARY KEY (order_number),
foreign key (supplier_ID) references supplier(supplier_ID));


CREATE TABLE supplier_inventory
(supplier_ID int,
ingridient varchar(20) NOT NULL,
PRIMARY KEY (supplier_ID, ingridient),
foreign key (supplier_ID) references supplier(supplier_ID));


CREATE TABLE order_list
(order_number int,
ingridient varchar(20) NOT NULL,
PRIMARY KEY (order_number, ingridient),
foreign key (order_number) references supplier_order(order_number));


CREATE TABLE catering_event
(event_ID int,
event_date date,
location varchar(20) NOT NULL,
customer_ID int NOT NULL,
kosher varchar(20) ,
num_of_guests int ,
finale_payment int,
order_number int,
PRIMARY KEY (event_ID),
foreign key (customer_ID) references customer(customer_ID),
foreign key (order_number) references supplier_order(order_number));

CREATE TABLE dish_in_event
(event_ID int,
dish_ID int,
amount int,
PRIMARY KEY (event_ID,dish_ID),
foreign key (event_ID) references catering_event(event_ID),
foreign key (dish_ID) references dish(dish_ID));

CREATE TABLE chef_cook_dish
(dish_ID int,
chef_ID int,
PRIMARY KEY (chef_ID,dish_ID),
foreign key (chef_ID) references chef(chef_ID),
foreign key (dish_ID) references dish(dish_ID));

CREATE TABLE chef_in_event
(event_ID int,
chef_ID int,
PRIMARY KEY (chef_ID,event_ID),
foreign key (event_ID) references catering_event(event_ID),
foreign key (chef_ID) references chef(chef_ID));

CREATE TABLE waiter_in_event
(event_ID int,
waiter_ID int,
PRIMARY KEY (event_ID,waiter_ID),
foreign key (event_ID) references catering_event(event_ID),
foreign key (waiter_ID) references waiter(waiter_ID));

CREATE TABLE recipe
(dish_ID int,
ingridient varchar(20) NOT NULL,
PRIMARY KEY (dish_ID, ingridient),
foreign key (dish_ID) references dish(dish_ID));
