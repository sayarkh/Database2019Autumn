create index film_title on film(title);

create index film_title_description on film (title,description);

create index film_rating on film (rating);

create index film_substring_title on film(substring(title , 1 , 4));

select * from pg_indexes;

select * from pg_indexes where tablename = 'film';

drop index film_rating;

SELECT