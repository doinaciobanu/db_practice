# Create a query which will total amount per month
# ------------------------------------------------------------

SELECT date, sum(`amount`) AS total
  FROM expenses
 GROUP BY year(date),month(date);

# -------------------------------------------------------------------
# Create a query which will find per day which person spent the most
# -------------------------------------------------------------------
SELECT e.date, CONCAT_WS(' ', u.firstname, u.lastname) AS username, max(e.amount) AS amount
  FROM expenses AS e
  JOIN users AS u
    ON u.id = e.user_id
 GROUP BY e.date;

# ----------------------------------------------------------------------------
# Create Update query which will increase all expensive for some day with 2%
# ----------------------------------------------------------------------------
UPDATE expenses 
   SET amount = amount + (amount * 2.0 / 100.0) 
 WHERE date = '2018-01-20 00:00:00';   