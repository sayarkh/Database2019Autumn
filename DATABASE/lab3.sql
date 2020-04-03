CREATE TABLE countries(
    country_id serial PRIMARY KEY,
    country_name varchar,
    region_id integer,
    population integer
);

INSERT INTO  countries(country_id,country_name, region_id, population)
VALUES (2,'Turkey', 111, 4000);

INSERT INTO countries(country_id, country_name)
VALUES ('123', 'USA');

INSERT  INTO countries(region_id)
VALUES (NULL);

INSERT INTO countries VALUES ('5','China','1232','3000'),
                             ('80','Japan','1222','5000'),
                             ('38274','Korea','5232','9000');

ALTER TABLE  countries ALTER COLUMN country_name SET DEFAULT 'UK';

INSERT INTO countries VALUES(DEFAULT, DEFAULT, '1222', '123223');

CREATE TABLE new_countries (LIKE countries INCLUDING ALL);

INSERT INTO new_countries SELECT *FROM countries;

UPDATE countries SET region_id = 1 WHERE region_id is NULL;

UPDATE countries SET population = population * 1.1 RETURNING country_name, population as "New_Population";

DELETE FROM countries WHERE population < 100000;

DELETE FROM countries AS c USING countries_new AS n WHERE c.country_id = n.country_id RETURNING *;

DELETE FROM countries;

