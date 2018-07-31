alter table stars
drop constraint stars_spectral_type_check;

create type spectral_type as enum('O', 'B', 'A', 'F', 'G', 'K', 'M');

alter table stars
alter column spectral_type type spectral_type using spectral_type::spectral_type;
