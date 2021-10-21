CREATE TABLE spaces (id SERIAL PRIMARY KEY, title VARCHAR(50), description VARCHAR(200), price INTEGER, available_from DATE, available_to DATE);

ALTER TABLE spaces ADD COLUMN available BOOLEAN DEFAULT TRUE;
ALTER TABLE spaces DROP COLUMN available;
ALTER TABLE spaces DROP COLUMN available_from;
ALTER TABLE spaces DROP COLUMN available_to;
ALTER TABLE spaces ADD COLUMN user_id VARCHAR(50);