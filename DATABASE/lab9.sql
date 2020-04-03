CREATE DATABASE lab9;
create table orders (
 ord_no integer primary key,
 purch_amt real,
 ord_date date,
 customer_id integer references customers,
 salesman_id integer references salesman
);
create table customers (
 customer_id integer primary key,
 cust_name varchar(256),
 city varchar(256),
 grade integer,
 salesman_id integer references salesman
);
create table salesman (
 salesman_id integer primary key,
 name varchar(256),
 city varchar(256),
 commission real
);
/*3*/CREATE ROLE junior_dev WITH LOGIN PASSWORD 'Saya';

/*4*/CREATE VIEW avg_total_order AS SELECT s.name, AVG(o.purch_amt), SUM(o.purch_amt)
FROM salesman s INNER JOIN orders o using(salesman_id) GROUP BY s.name;

/*5*/CREATE VIEW orders_in_city AS SELECT  customers.city, count(*)
FROM customers INNER JOIN orders USING(salesman_id) GROUP BY(city);
GRANT ALL PRIVILEGES ON orders_in_city TO junior_dev;

/*6*/CREATE VIEW show_minimum as SELECT min(grade) from customers ;
grant select on show_lowest to junior_dev;
/*7*/CREATE VIEW salesman_grade AS SELECT count(*), grade FROM customers GROUP BY grade;

/*8*/create view order_salesman as select * from salesman
where 1<(select count(*) from orders where salesman.salesman_id = orders.salesman_id );

/*9*/CREATE ROLE intern;
REASSIGN OWNED BY junior_dev TO intern;
