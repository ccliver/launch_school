drop table if exists planets;

create table planets (
  id serial primary key,
  designation char(1) not null,
  mass integer
);
