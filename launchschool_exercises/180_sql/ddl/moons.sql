drop table if exists moons;

create table moons (
  id serial primary key,
  designation serial not null,
  semi_major_axis numeric  check (semi_major_axis > 0),
  mass numeric check (mass > 0),
  planet_id integer not null references planets (id)
);
