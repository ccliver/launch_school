-- Using ANY
SELECT name AS "Highest Bid Less Than 100 Dollars" FROM items
WHERE 100.00 > ANY
  (SELECT amount FROM bids WHERE item_id = items.id);

-- Using ALL
SELECT name AS "Highest Bid Less Than 100 Dollars" FROM items
WHERE 100.00 > ALL
  (SELECT amount FROM bids WHERE item_id = items.id);
