CREATE TABLE customers(
    customer_id integer PRIMARY KEY,
    cust_name text,
    city character varying(255),
    grade real,
    salesman_id integer
);

CREATE TABLE orders(
    ord_id integer PRIMARY KEY ,
    purch_amt float,
    ord_date date,
    customer_id integer REFERENCES customers(customer_id),
    salesman_id integer
);

INSERT INTO customers
    VALUES (3002, 'Nick Rimando', 'New York', 100, 5001),
           (3005, 'Graham Zusi', 'California', 200, 5002),
           (3001, 'Brad Guzan', 'London', DEFAULT , 5005),
           (3004, 'Fabian Johns', 'Paris', 300, 5006),
           (3007, 'Brad Davis', 'New York', 200, 5001),
           (3009, 'Geoff Camero', 'Berlin', 100, 5003),
           (3008, 'Julian Green', 'London', 300, 5002);

INSERT INTO orders
    VALUES (70001, 150.5, '2012-10-05', 3005, 5002),
           (70009, 270.65, '2012-09-10', 3001, 5005),
           (70002, 65.26, '2012-10-05', 3002, 5001),
           (70004, 110.5, '2012-08-17', 3009, 5003),
           (70007, 948.5, '2012-09-10', 3005, 5002),
           (70005, 2400.6, '2012-07-27', 3007, 5001),
           (70008, 5760, '2012-09-10', 3002, 5001);

SELECT sum(purch_amt) from orders;

SELECT avg(purch_amt) from orders;

SELECT count(cust_name) from customers;

SELECT min(purch_amt) from orders;

SELECT max(grade) FROM customers;

SELECT   *FROM customers WHERE cust_name LIKE '%n %';

SELECT  * FROM orders WHERE salesman_id IN(SELECT salesman_id FROM customers WHERE city = 'New York');

SELECT *FROM customers WHERE EXISTS(SELECT purch_amt from orders WHERE purch_amt>10);

SELECT *FROM orders WHERE purch_amt >(SELECT avg(purch_amt) FROM orders);

SELECT purch_amt,
    CASE WHEN purch_amt BETWEEN 0 AND 100 THEN 'low'
         WHEN  purch_amt BETWEEN 100 AND 1000 THEN 'high'
         ELSE 'very_high'
    END
         FROM orders;


