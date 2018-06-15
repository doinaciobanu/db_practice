# Create an update to  expenses by multiply with 0.1 where currency EURO 
# ------------------------------------------------------------

UPDATE expenses AS e 
  JOIN currency AS c
    ON e.currency_id = c.id
   AND c.name = 'euro'
   SET e.amount = e.amount * 0.1;


# create a query to delete all expenses < 50
# ------------------------------------------------------------
DELETE FROM expenses WHERE amount < 50;
