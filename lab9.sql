DROP VIEW IF EXISTS NY_salesmen;
DROP VIEW IF EXISTS order_salesman_customer;
DROP VIEW IF EXISTS cust_max_grade;
DROP VIEW IF EXISTS salesmen_per_city;
DROP VIEW IF EXISTS salesmen_with_many_customers;

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS salesmen;

DROP USER IF EXISTS junior_dev;
DROP USER IF EXISTS intern;

CREATE TABLE salesmen(
	salesman_id INTEGER PRIMARY KEY,
	name VARCHAR(255),
	city VARCHAR(255),
	commission NUMERIC
);

CREATE TABLE customers(
	customer_id INTEGER PRIMARY KEY,
	cust_name VARCHAR(255),
	city VARCHAR(255),
	grade INTEGER,
	salesman_id INTEGER REFERENCES salesmen(salesman_id)
);

CREATE TABLE orders(
	ord_no INTEGER PRIMARY KEY,
	purch_amt NUMERIC,
	ord_date DATE,
	customer_id INTEGER REFERENCES customers(customer_id),	
	salesman_id INTEGER REFERENCES salesmen(salesman_id)
);


INSERT INTO salesmen (salesman_id, name, city, commission) 
VALUES	(5001, 'James Hoog', 'New York', 0.15),
	    (5002, 'Neil Knite', 'Paris', 0.13),
	    (5005, 'Pit Alex', 'London', 0.11),
	    (5006, 'Mc Lyon', 'Paris', 0.14),
	    (5003, 'Lauson Hen', DEFAULT , 0.12),
	    (5007, 'Paul Adam', 'Rome', 0.13);

INSERT INTO customers (customer_id, cust_name, city, grade, salesman_id) 
VALUES  (3002, 'Nick Rimando', 'New York', 100, 5001),
	    (3005, 'Graham Zusi', 'California', 200, 5002),
	    (3001, 'Brad Guzan', 'London', DEFAULT , 5005),
	    (3004, 'Fabian Johns', 'Paris', 300, 5006),
	    (3007, 'Brad Davis', 'New York', 200, 5001),
	    (3009, 'Geoff Camero', 'Berlin', 100, 5003),
	    (3008, 'Julian Green', 'London', 300, 5002);

INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id)
VALUES  (70001, 150.5, TO_DATE('2012-10-05', 'YYYY/MM/DD'), 3005, 5002),
		(70009, 270.65, TO_DATE('2012-09-10', 'YYYY/MM/DD'), 3001, 5005),
		(70002, 65.26, TO_DATE('2012-10-05', 'YYYY/MM/DD'), 3002, 5001),
		(70004, 110.5, TO_DATE('2012-08-17', 'YYYY/MM/DD'), 3009, 5003),
		(70007, 948.5, TO_DATE('2012-09-10', 'YYYY/MM/DD'), 3005, 5002),
		(70005, 2400.6, TO_DATE('2012-07-27', 'YYYY/MM/DD'), 3007, 5001),
		(70008, 5760, TO_DATE('2012-09-10', 'YYYY/MM/DD'), 3002, 5001);


CREATE USER junior_dev;

CREATE VIEW NY_salesmen AS SELECT * FROM salesmen WHERE city = 'New York';

CREATE VIEW order_salesman_customer AS SELECT ord_no, s.name, c.cust_name FROM
	(orders o CROSS JOIN salesmen s CROSS JOIN customers c) 
		WHERE s.salesman_id = o.salesman_id AND c.customer_id = o.customer_id;


GRANT ALL PRIVILEGES ON order_salesman_customer TO junior_dev;

CREATE VIEW cust_max_grade AS SELECT max(grade) FROM customers;
GRANT SELECT ON cust_max_grade TO junior_dev;

CREATE VIEW salesmen_per_city AS SELECT city, count(*) FROM salesmen GROUP BY city;

CREATE VIEW salesmen_with_many_customers AS SELECT salesman_id FROM salesmen AS s
	WHERE (SELECT count(*) FROM orders AS o WHERE s.salesman_id = o.salesman_id) > 1;
	

CREATE USER intern;
GRANT junior_dev TO intern;