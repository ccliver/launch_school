DROP TABLE IF EXISTS customers_services;

CREATE TABLE customers_services (
  id SERIAL PRIMARY KEY,
  customer_id INTEGER REFERENCES customers(id) ON DELETE CASCADE,
  service_id INTEGER REFERENCES services(id),
  UNIQUE(customer_id, service_id)
);
