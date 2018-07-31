SELECT
  items.name AS "Bid on Items"
FROM
  items
WHERE
  items.id IN (SELECT item_id from bids)
