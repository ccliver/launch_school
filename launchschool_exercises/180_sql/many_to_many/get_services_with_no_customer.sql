SELECT
  services.description
FROM
  customers_services
RIGHT OUTER JOIN services ON service_id = services.id
WHERE
  services.id NOT IN (SELECT service_id from customers_services)
