alter table planets
alter column mass type numeric;

alter table planets
alter column mass set not null;

alter table planets
add check (mass > 0);
