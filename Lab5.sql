CREATE DATABASE Lab5;

CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  cust_name VARCHAR(50),
  city VARCHAR(50),
  grade INT,
  salesman_id INT
);

CREATE TABLE orders(
  ord_no INT PRIMARY KEY,
  purch_amt NUMERIC,
  ord_date DATE,
  customer_id INT REFERENCES customers(customer_id),
  salesman_id INT
);

SELECT sum(purch_amt) FROM orders;
SELECT avg(purch_amt) FROM orders;
SELECT count(cust_name) FROM customers WHERE cust_name NOTNULL;
SELECT min(purch_amt) FROM orders;
SELECT * FROM customers WHERE cust_name LIKE ('%b');
SELECT * FROM orders WHERE customer_id IN (SELECT customer_id FROM customers WHERE city = 'New York');
SELECT * FROM customers WHERE customer_id IN (SELECT customer_id FROM orders WHERE purch_amt>10);
SELECT sum(grade) FROM customers;
SELECT * FROM customers WHERE cust_name NOTNULL;
SELECT max(grade) FROM customers;