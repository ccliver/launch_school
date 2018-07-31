SELECT
  customers.name, STRING_AGG(services.description, ', ')
FROM
  customers
LEFT OUTER JOIN customers_services ON customer_id = customers.id
LEFT OUTER JOIN services ON service_id = services.id
GROUP BY
  customers.name
