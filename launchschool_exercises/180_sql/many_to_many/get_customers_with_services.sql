SELECT DISTINCT
  customers.name, customers.payment_token
FROM
  customers_services
INNER JOIN customers ON customer_id = customers.id
INNER JOIN services ON service_id = services.id
