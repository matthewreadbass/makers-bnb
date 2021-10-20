CREATE TABLE spaces (id SERIAL PRIMARY KEY, title VARCHAR(50), description VARCHAR(200), price INTEGER, available_from DATE, available_to DATE);

ALTER TABLE spaces ADD COLUMN "available" BOOLEAN DEFAULT TRUE;
