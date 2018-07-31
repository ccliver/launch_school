DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  payment_token CHAR(8) NOT NULL CHECK (payment_token ~ '^[A-Z]{8}$')
);
