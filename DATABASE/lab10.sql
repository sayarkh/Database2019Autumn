CREATE TABLE accounts(
    id serial primary key ,
    name varchar(20) not NULL,
    age int,
    balance int NOT NULL

);
/*2*/ BEGIN ;
UPDATE accounts  SET balance = balance +10000
  WHERE id=1;
UPDATE accounts SET balance = balance-20000
 WHERE id=2;
UPDATE accounts SET balance=balance-3000
 WHERE id=3;
COMMIT ;
/*3*/ BEGIN;
UPDATE accounts set balance = balance - 1500
  WHERE name = 'Kirill' ;
SAVEPOINT my_savepoint1;
UPDATE accounts set balance = balance + 1500
 WHERE name = 'Adam';
savepoint my_savepoint2;
UPDATE accounts set balance = balance + 1500
 WHERE name = 'Anna';
rollback to my_savepoint1;
COMMIT ;
/*4*/BEGIN ;
savepoint my_savepoint;
DELETE from accounts
 WHERE name = 'Dana';
rollback to my_savepoint;
UPDATE accounts set balance = 70000
 WHERE name = 'Dana';
COMMIT;
/*5*/
BEGIN;
UPDATE accounts set balance = balance - 3000
    WHERE id = 3;
savepoint my_savepoint3;
UPDATE accounts SET balance = balance+1000
    WHERE id BETWEEN 1 AND 2;
ROLLBACK to my_savepoint3;
COMMIT;

BEGIN;
UPDATE accounts
SET balance = balance * 1.05;

/*6*/

/*6.1 Request user2 will wait for COMMIT or ROLLBACK from User_1. (the request seems to freeze)
User_1 in his transaction will see his version of the snapshot of the database, where the discount is already equal to 33600*/

/*6.2 If user11 makes ROLLBACK, then the query of the user1 will not be committed. After which the request will be executed User_2,
   and the balance will be 49500*/

/*6.3 If user1 makes COMMIT, then the balance value will increase 1,05 times, and user2 will see the changes , then executed request User_2,
   which will increase balance 1.1 times.*/


