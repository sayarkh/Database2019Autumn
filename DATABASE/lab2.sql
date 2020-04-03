CREATE TABLE project(
    id serial,
    fake_id integer PRIMARY KEY,
    name varchar (50),
    start_datetime date,
    end_datetime timestamp without time zone,
    is_finished boolean,
    description text,
    CONSTRAINT fake_id primary key(fake_id)
);

ALTER TABLE project
    ADD COLUMN created_at interval;

ALTER TABLE project RENAME COLUMN name to full_name;

ALTER TABLE project
ADD CONSTRAINT SK_Person UNIQUE(full_name);

ALTER TABLE project
    ALTER COLUMN  is_finished SET NOT NULL;

ALTER TABLE project
    DROP CONSTRAINT fake_id;

ALTER TABLE project
    DROP COLUMN fake_id;

ALTER TABLE project ADD PRIMARY KEY(id);

CREATE TABLE tasks(
    id serial primary key (id),
    name varchar(50),
    description text,
    priority smallint,
    project_id integer,
    FOREIGN KEY (project_id) references tasks(id);
);

 DROP TABLE project RESTRICT ;

DROP TABLE tasks CASCADE ;