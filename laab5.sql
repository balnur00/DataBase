CREATE DATABASE lab4;

CREATE TABLE warehouses(
  code int PRIMARY KEY,
  location varchar(255),
  capacity int
);

CREATE TABLE boxes(
  code char(4),
  contents varchar(255),
  value real,
  warehouse int REFERENCES warehouses(code)
);

SELECT * FROM warehouses;
SELECT * FROM boxes WHERE VALUE > 150;
SELECT DISTINCT ON(contents) * FROM boxes;
SELECT warehouse, count(*) FROM boxes GROUP BY warehouse;
SELECT warehouse, count() FROM boxes GROUP BY warehouse HAVING count() > 2;

INSERT INTO warehouses (code, location, capacity) VALUES (6, 'New York', 3);
INSERT INTO boxes VALUES ('H5RT', 'Paper', 200, 6);

UPDATE boxes SET value = value * 1.15 WHERE code IN 
(SELECT code FROM boxes ORDER BY value DESC nulls last LIMIT 1 OFFSET 2);

DELETE FROM boxes WHERE VALUE < 150;
DELETE FROM boxes WHERE warehouse IN 
(SELECT code FROM warehouses WHERE location = 'New York') RETURNING *;