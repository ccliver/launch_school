SELECT
  sum(services.price)
FROM
  customers_services
INNER JOIN services ON service_id = services.id
WHERE
  services.price > 100;

SELECT
  sum(price) * (select count(*) from customers)
FROM
  services
WHERE
  services.price > 100
