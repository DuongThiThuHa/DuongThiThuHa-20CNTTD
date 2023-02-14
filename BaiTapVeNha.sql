create database BT;
use BT;
	
create table PRODUCTLINES(
	productLine nvarchar(50),
    textDescription nvarchar(50),
    htmlDescription nvarchar(50),
	image nvarchar(50),
	constraint pk_PRODUCTLINES primary key(productLine)
);

create table PRODUCTS(
	productCode nvarchar(50),
	productName nvarchar(50),
	productLine nvarchar(50),
	productScale nvarchar(50),
	productVendor nvarchar(50),
	productDescription nvarchar(50),
	quantityInStock nvarchar(50),
	buyPrice int,
	MSRP int,
	constraint pk_PRODUCTS primary key(productCode),
	constraint fk_PRODUCTS_PRODUCTLINES foreign key(productLine) references PRODUCTLINES(productLine)
);

create table ORDERDETAILS(
	orderNumber int,
	productCode nvarchar(50),
	quantityOrdered nvarchar(50),
	priceEach int,
	orderLineNumber nvarchar(50),
	constraint pk_ORDERDETAILS primary key(orderNumber,productCode),
	constraint fk_ORDERDETAILS_PRODUCTS foreign key(productCode) references PRODUCTS(productCode)
);

create table OFFICES(
	officeCode nvarchar(50),
	city nvarchar(50),
	phone int,
	addressLine1 nvarchar(50),
	addressLine2 nvarchar(50),
	state nvarchar(50),
	country nvarchar(50),
	postalCode nvarchar(50),
	territory nvarchar(50),
	constraint pk_OFFICES primary key(officeCode)
);

create table EMPLOYEES(
	employeeNumber nvarchar(50),
	lastname varchar(50),
	firstname varchar(50),
	extension varchar(50),
	email varchar(50),
	officeCode nvarchar(50),
	reportsTo nvarchar(50),
	jobTitle nvarchar(50),
	constraint pk_EMPLOYEES primary key(employeeNumber)
);

create table CUSTOMERS(
	customerNumber nvarchar(50),
	customerName nvarchar(50),
	contactLastname varchar(50),
	contactFirstname varchar(50),
	phone int,
	addressLine1 nvarchar(50),
	addressLine2 nvarchar(50),
	city nvarchar(50),
	state nvarchar(50),
	postalCode nvarchar(50),
	country nvarchar(50),
	salesRepEmployeeNumber nvarchar(50),
	creditLimit nvarchar(50),
	constraint pk_CUSTOMERS primary key(customerNumber)
);

create table ORDERS (
	orderNumber int,
	orderDate int,
	requiredData nvarchar(50),
	shippedDate nvarchar(50),
	status varchar(50),
	comments varchar(50),
	customerNumber nvarchar(50),
	constraint pk_ORDERS primary key(orderNumber),
	constraint fk_ORDERS_CUSTOMERS foreign key(customerNumber) references CUSTOMERS(customerNumber)
);

create table PAYMENTS(
	customerNumber nvarchar(50),
	checkNumber nvarchar(50),
	paymentDate int,
	amount nvarchar(50),
	constraint pk_PAYMENTS primary key(customerNumber,checkNumber),
	constraint fk_PAYMENTS_CUSTOMERS foreign key(customerNumber) references CUSTOMERS(customerNumber)
);

insert into EMPLOYEES(employeeNumber,lastname,firstname,extension,email,officeCode,reportsTo,jobTitle) values
('1002','Murphy','Diane','x5800','dmuphy@classicmodelcars','1',NULL,'President'),
('1056','Patterson','Mary','x4611','mpatterso@classicmodelcars','1','1002','VP Sales'),
('1076','Firrelli','Jelf','x9273','jfirelli@classicmodelcars','6','1143','sales Rep');

select firstname from EMPLOYEES;

select employeeNumber,lastname,firstname,extension,email,officeCode,reportsTo,jobTitle 
from EMPLOYEES;

select * from EMPLOYEES;

create table TASKS (
 task_id int,
 title varchar(255),
 startdate date,
 duedate date,
 priority varchar(50),
 description text,
 constraint pk_TASKS primary key(task_id)
);

insert into tasks (task_id,title,startdate,duedate,priority,description) values ('01','Learn MySQL INSERT Statement',NULL,NULL,1,NULL);
select * from TASKS;

insert into tasks(task_id,title,startdate,duedate,priority,description) values ('02','Understanding DEFAULT keyword in INSERT',NULL,NULL,3,NULL);
select * from TASKS;

insert into tasks(task_id,title,startdate,duedate,priority,description) values ('03','Insert date into table','2018-01-09','2018-09-15',3,NULL);
select * from TASKS;

insert into tasks(task_id,title,startdate,duedate,priority,description) values 
('04','Use current date for the task','2018-09-02','2018-09-02',3,NULL),
('05','My first task',NULL,NULL,1,NULL),
('06','It is the second task',NULL,NULL,2,NULL),
('07','This is the third task of the week',NULL,NULL,3,NULL);
select * from TASKS;

update employees set email = 'jfirelli@classicmodelcars.com' where employeeNumber = 1076;
select * from EMPLOYEES;

update EMPLOYEES set extension = 'x5700' where employeeNumber = 1002;
select * from EMPLOYEES;

update employees set email = replace(email,'@classicmodelcars.com','@mysqltutorial.org')
where jobTitle = 'Sales Rep' and officeCode = 6;
select * from EMPLOYEES;
 
 insert into CUSTOMERS (customerNumber,customerName,contactLastname,contactFirstname, phone,addressLine1,addressLine2,city,state,postalCode,country,salesRepEmployeeNumber,creditLimit) values 
 ('01','Havel & Zbyszek Co',NULL,NULL,0773006251,NULL,NULL,'Can Tho',NULL,NULL,NULL,NULL,NULL),
 ('02','Porto Imports Co.',NULL,NULL,0978556324,NULL,NULL,NULL,'HCM',NULL,NULL,NULL,NULL),
 ('03','Asian Shopping Network, Co',NULL,NULL,0966632185,NULL,NULL,'Da Nang',NULL,NULL,NULL,NULL,NULL),
 ('04','Naturlich Autos',NULL,NULL,0876259841,NULL,NULL,'Ha Noi',NULL,NULL,NULL,NULL,NULL),
 ('05','ANG Resellers',NULL,NULL,0905350811,NULL,NULL,'HCM',NULL,NULL,NULL,NULL,NULL),
 ('06','Messner Shopping Network',NULL,NULL,0769852136,NULL,NULL,'Hai Phong',NULL,NULL,NULL,NULL,NULL),
 ('07','Franken Gifts, Co',NULL,NULL,0977145369,NULL,NULL,'Da Nang',NULL,NULL,NULL,NULL,NULL),
 ('08','BG&E Collectablles',NULL,NULL,077985632,NULL,NULL,'Da Nang',NULL,NULL,NULL,NULL,NULL);

select * from CUSTOMERS;

select customerName, salesRepEmployeeNumber from CUSTOMERS;

delete from EMPLOYEES where firstname = 'Diane';

select * from EMPLOYEES;