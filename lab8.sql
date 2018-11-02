create database lab7;

create index index1 on countries using hash (name); --1

create index index2 on countries using hash (name, surname); --2

create unique index index3 on employees (salary); --3

create index index4 on employees (substring(name from 1 to 4)); --4

create index index5 on employees (department_id, salary); --5

create index index6 on departments (department_id, budget); --5