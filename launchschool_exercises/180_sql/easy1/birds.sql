drop table if exists birds;

create table birds (
  id serial primary key,
  name varchar(25) NOT NULL,
  age integer NOT NULL,
  species varchar(125) NOT NULL
);
