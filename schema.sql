CREATE DATABASE umuzi;
\c umuzi

CREATE TABLE customer(
customerID INT NOT NULL PRIMARY KEY,
firstname VARCHAR(50) NOT NULL,
lastname VARCHAR(50) NOT NULL,
gender VARCHAR(7) NOT NULL,
address VARCHAR(200) NOT NULL,
phone int(10) NOT NULL,
email VARCHAR(100)
city VARCHAR(20),
country VARCHAR(50));

INSERT into customer(customerID,firstname,lastname,gender,address,phone,email,city,country)
VALUES(1,'John','Hilbert','male','284 chaucer st',084789657,'john@gmail.com','Johnnesburg','South Africa'),
(2,'Thando','Sithole','female','240 Sect 1',0794445584,'thando@gmail.com','Cape Town','South Africa'),
(3,'Leon','Glen','Male','81 Everton rd, Gillits',0820832830,'leon@gmail.com','Durban','South Africa'),
(4,'Charl','Muller','Male','290A Dorset Ecke',+44856872553,'Charl.muller@yahoo.com','Berlin','Germany'),
(5,'Julia','Stein','female','2 Wernerring',+448672445058,'js234@yahoo.com','Frankfurt','Germany');

CREATE TABLE employees(
employeeID INT NOT NULL PRIMARY KEY,
firstname VARCHAR(50) NOT NULL,
lastname VARCHAR(50) NOT NULL,
email VARCHAR(100),
jobtitle VARCHAR(20));

INSERT INTO employees(employeeID,firstname,lastname,email,jobtitle) 
VALUES(1,'Kani','Matthew','mat@gmail.com','Manager'),
(2,'Lesly','Cronje','LesC@gmail.com','Clerk'),
(3,'Gideon','Maduku','m@gmail.com','Accountant');

CREATE TABLE products(
productID INT NOT NULL PRIMARY KEY,
productname VARCHAR(100) NOT NULL,
description VARCHAR(300) NOT NULL,
buyprice DECIMAL NOT NULL);

INSERT INTO products(productID,productname,description,buyprice)
VALUES(1,'Harley Davidson Cooper','This replica features working kickstand, front suspension, gear-shift lever',150.75),
(2,'Classic Car','Turnable front wheels, steering function', 550.75),
(3,'Sports Car','Turnable front wheels, steering function',700.60);

CREATE TABLE payments(
customerID INT NOT NULL FOREIGN KEY,
paymentID INT NOT NULL PRIMARY KEY,
paymentDate DATE,
amount DECIMAL NOT NULL);

INSERT INTO payments(CustomerID,
PaymentID,
PaymentDate,
Amount)VALUES(
(1,1,'01-09-2018',150.75),
(5,2,'03-09-2018',150.75),
(4,3,'03-09-2018',700.60)
);

CREATE TABLE orders(
OrderID INT PRIMARY KEY,
ProductID INT,
PaymentID INT,
FulfilledByEmployeeID INT,
DateRequired DATE,
DateShipped DATE,
Status VARCHAR(50));

INSERT INTO orders(OrderID,ProductID,
PaymentID,
FulfilledByEmployeeID,
DateRequired,
DateShipped,
Status)VALUES((1,1,1,2,'05-09-2018',null,'Not Shipped'),
(2,1,2,2,'04-09-2018','03-09-2018','Shipped'),
(3,3,3,3,'06-09-2018',null,'Not Shipped'));





<--Querying the database-->

SELECT * FROM customers;

SELECT firstname FROM customers;

SELECT firstname FROM customers WHERE customerID=1;

UPDATE customers SET firstname = 'Lerato', lastname = 'Mabitso' WHERE customerID=1;

DELETE * FROM customers WHERE customerID=2;

SELECT Status FROM orders, COUNT (*) GROUP BY Status;

SELECT MAX(amount) FROM payments;

SELECT * FROM customer ORDER BY country;

SELECT * FROM products WHERE country= 'Germany' AND city='Berlin';

SELECT * FROM products WHERE buyprice BETWEEN 100 AND 600;

SELECT * FROM customers WHERE (city = 'Cape Town' OR city = 'Durban');

SELECT * FROM products WHERE buyprice > 500;

SELECT sum(amount) FROM payments;

SELECT Status , count(*) FROM orders WHERE Status ='Shipped';

SELECT AVG(buyprice), AVG(buyprice * 12) FROM products;

SELECT customers.customerID ,firstname,lastname,email,amount,paymentDate FROM customers INNER JOIN payments ON payments.customerID == customers.customerID;

SELECT * FROM products WHERE description = 'Turnable front wheels, steering function';
