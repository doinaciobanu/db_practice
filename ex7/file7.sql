# Create a stored procedure with parametre ID and giving the id 
# returns all the expenses for this user
# ------------------------------------------------------------
DELIMITER //
CREATE PROCEDURE list_user_expenses (id int)
 BEGIN
      SELECT CONCAT_WS (' ', u.firstname, u.lastname) AS user,
             c.name AS category,
             e.amount AS amount,
             cu.name AS currency,
             e.date AS date
        FROM users AS u
        JOIN expenses AS e
          ON e.user_id = u.id
        JOIN categories AS c
          ON e.category_id = c.id
        JOIN currency AS cu
          ON e.currency_id = cu.id
       WHERE u.id LIKE id
    ;
 END //
DELIMITER ;

CALL list_user_expenses (1);



