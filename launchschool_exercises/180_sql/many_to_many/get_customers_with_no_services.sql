SELECT
  customers.name
FROM
  customers
WHERE
  customers.id NOT IN (SELECT customer_id from customers_services)
