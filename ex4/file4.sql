# Create indexes for the tables
# ------------------------------------------------------------

# Index for Categories Table

CREATE UNIQUE INDEX index_id
ON categories (id);

# Index for Country Table

CREATE UNIQUE INDEX index_id
ON country (id);

# Index for Expenses Table

CREATE UNIQUE INDEX index_id
ON expenses (id);

# Index for Language Table

CREATE UNIQUE INDEX index_id
ON language (id);

# Index for Profesions Table

CREATE UNIQUE INDEX index_id
ON profesions (id);

# Index for Salary Table

CREATE UNIQUE INDEX index_id
ON salary (id);

# Index for user_lang Table

CREATE UNIQUE INDEX index_id
ON user_lang (id);

# Index for Users Table

CREATE UNIQUE INDEX index_user
ON users (id, firstname, lastname);