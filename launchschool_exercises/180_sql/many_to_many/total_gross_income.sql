SELECT
  sum(services.price)
FROM
  customers_services
INNER JOIN services ON service_id = services.id
