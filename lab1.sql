CREATE DATABASE lab1;

CREATE TABLE users(
  id  SERIAL PRIMARY KEY,
  firstname CHAR(50),
  lastname  CHAR(50)
);

ALTER TABLE users ADD COLUMN isadmin INTEGER;


SELECT * FROM users;

ALTER TABLE users ALTER COLUMN isadmin DROP DEFAULT;
ALTER TABLE users ALTER isadmin TYPE bool USING CASE WHEN isadmin = 0 THEN FALSE ELSE TRUE END;

ALTER TABLE users ALTER COLUMN isadmin SET DEFAULT FALSE;

INSERT INTO users (firstname, lastname, isadmin)
VALUES ('Diana', 'Tuk', TRUE);

SELECT * FROM users;

ALTER TABLE users ADD PRIMARY KEY (id);

CREATE TABLE tasks(
  id  SERIAL PRIMARY KEY,
  name  CHAR(50),
  user_id INT
);

SELECT * FROM tasks;

DROP TABLE tasks;

DROP DATABASE lab1;