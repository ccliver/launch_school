drop table if exists stars;

create table stars (
  id serial primary key,
  name varchar(25) unique not null,
  distance integer not null check (distance > 0),
  spectral_type char(1) not null,
  companions integer not null check (companions >= 0)
);
