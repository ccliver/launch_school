alter table birds add constraint check_age check (age > 0);

INSERT INTO birds (age, name, species) VALUES (-2, 'Alan', 'Blue Jay');
