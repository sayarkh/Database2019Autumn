CREATE TABLE users(
    id serial,
    first_name varchar(50),
    last_name varchar(50)
    );

ALTER TABLE  users
    ADD COLUMN is_admin INTEGER;

ALTER TABLE users
    ALTER COLUMN is_admin SET DATA TYPE BOOLEAN using is_admin::boolean;

ALTER TABLE  users ALTER COLUMN is_admin SET DEFAULT FALSE;
ALTER TABLE users ADD PRIMARY KEY(id);

CREATE TABLE tasks(
    id serial PRIMARY KEY,
    name varchar(50),
    user_id integer
);

DROP TABLE tasks CASCADE;

