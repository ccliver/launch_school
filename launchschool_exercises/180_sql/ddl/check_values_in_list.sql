alter table stars
add check (spectral_type in ('O', 'B', 'A', 'F', 'G', 'K', 'M')),
