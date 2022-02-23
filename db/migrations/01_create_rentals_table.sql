CREATE TABLE rentals(id SERIAL PRIMARY KEY, title VARCHAR(60), rental_description VARCHAR(300), price FLOAT(2), contact_details VARCHAR(60));

ALTER TABLE rentals ADD COLUMN rental_start_date DATE;
ALTER TABLE rentals ADD COLUMN rental_end_date DATE;