DROP TABLE IF EXISTS services;

CREATE TABLE services (
  id SERIAL PRIMARY KEY,
  description TEXT NOT NULL,
  price NUMERIC(10, 2) NOT NULL CHECK (price >= 0.00)
);
