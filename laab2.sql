CREATE  DATABASE lab2;

CREATE TABLE countries (
  country_id SERIAL PRIMARY KEY,
  country_name VARCHAR(50),
  region INT,
  population INT
);


SELECT * FROM countries;

INSERT INTO countries(country_name, region, population)
  VALUES ('Spain', '44', '40000');

INSERT INTO countries(country_name)
  VALUES ('Italy');

INSERT INTO countries(region)
  VALUES (null);

INSERT INTO countries(country_name, region, population)
  VALUES ('France', '31', '20000'),
         ('England', '12', '30000'),
         ('Greece', '23', '60000');


SELECT * FROM countries;

ALTER TABLE countries
    ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';

INSERT INTO countries(country_name, region, population)
  VALUES (DEFAULT, '54', '16000');

INSERT INTO countries(country_name, region, population)
  VALUES (DEFAULT ,DEFAULT ,DEFAULT );

CREATE TABLE countries_new (
  LIKE countries
);

SELECT * FROM countries_new;

INSERT INTO countries_new(country_id, country_name, region, population)
  SELECT * FROM countries;

UPDATE countries_new
  SET region = '1' WHERE region IS NULL;

UPDATE countries
  SET population = population * 1.1
  RETURNING country_name, population as "New Population";

DELETE FROM countries
WHERE population < 100000;

DELETE FROM countries AS c USING countries_new AS n WHERE c.country_id = n.country_id RETURNING *;

DELETE FROM countries;

SELECT * FROM countries;
