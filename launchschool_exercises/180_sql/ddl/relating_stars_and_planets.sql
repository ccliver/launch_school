alter table planets
add column star_id integer not null references stars (id);
