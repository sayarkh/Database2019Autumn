CREATE  TABLE warehouses(
    code integer,
    location character varying(255),
    capacity integer
);

drop table boxes;
INSERT INTO warehouses
    VALUES  (1, 'Chicago', 3),
            (2, 'Chicago', 4),
            (3, 'New York', 7),
            (4, 'Los Angeles', 2),
            (5, 'San Francisco', 8);

CREATE TABLE boxes(
            code character(4),
            contents character(255),
            value real,
            warehouse integer
);

INSERT INTO boxes
    VALUES  ('0MN7', 'Rocks', 180, 3),
            ('4H8P', 'Rocks', 250, 1),
            ('4RT3', 'Scissors', 190, 4),
            ('7G3H', 'Rocks', 200, 1),
            ('8JN6', 'Papers', 75, 1),
            ('8Y6U', 'Papers', 50, 3),
            ('9J6F', 'Papers', 175, 2),
            ('LL08', 'Rocks', 140, 4),
            ('P0H6', 'Scissors', 125, 1),
            ('P2T6', 'Scissors', 150, 2),
            ('TU55', 'Papers', 90, 5);

UPDATE boxes SET value = value*0.85 WHERE value = (SELECT value FROM boxes OFFSET 2 LIMIT 1);

SELECT  *FROM warehouses WHERE location = 'Chicago';

SELECT *FROM  boxes WHERE value>140 AND value<=200;

SELECT count(DISTINCT contents) AS total, warehouse FROM boxes
GROUP BY warehouse;

SELECT DISTINCT warehouse FROM boxes
WHERE contents ='Rocks' AND value < 220;

UPDATE boxes SET value = value*1.2
WHERE contents = 'Papers' AND warehouse IN (SELECT code FROM warehouses WHERE location ='New York' OR location = 'San Francisco');

SELECT code FROM boxes WHERE boxes.warehouse IN(SELECT  code FROM warehouses WHERE capacity >3 AND location LIKE  '%o');

SELECT value FROM boxes WHERE warehouse IN(SELECT code from warehouses WHERE location NOT LIKE  'Chicago') OFFSET 1 LIMIT 1;

DELETE FROM boxes WHERE value<150;