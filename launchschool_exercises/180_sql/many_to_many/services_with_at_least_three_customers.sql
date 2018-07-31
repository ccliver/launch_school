SELECT
  services.description, count(customers_services.id) AS "count"
FROM
  customers_services
INNER JOIN services ON service_id = services.id
GROUP BY
  services.description
HAVING
  count(customers_services.id) >= 3
ORDER BY
  services.description
