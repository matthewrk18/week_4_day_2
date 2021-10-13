CREATE TABLE customers(
	customer_id	SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	address VARCHAR(150),
	billing_info VARCHAR(150),
	date_of_birth VARCHAR(10)
);

CREATE TABLE movies(
	movies_id SERIAL PRIMARY KEY,
	movie_title VARCHAR(150),
	rating VARCHAR(6),
	duration INTEGER
);

CREATE TABLE box_office(
	box_office_id SERIAL PRIMARY KEY,
	tickets_id INTEGER,
	movies_id INTEGER,
	customer_id INTEGER,
	FOREIGN KEY(movies_id) REFERENCES movies(movies_id),
	FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE concessions(
	concession_id SERIAL PRIMARY KEY,
	prod_name VARCHAR(100),
	amount NUMERIC(4,2),
	upc INTEGER,
	FOREIGN KEY (upc) REFERENCES inventory(upc)
);

CREATE TABLE inventory(
	upc SERIAL PRIMARY KEY,
	product_count INTEGER,
	tickets_id INTEGER,
	concession_id INTEGER 
);

CREATE TABLE tickets(
	tickets_id SERIAL PRIMARY KEY,
	ticket_type VARCHAR(8),
	amount NUMERIC(4,2),
	quantity INTEGER,
	box_office_id INTEGER,
	movies_id INTEGER,
	upc INTEGER,
	FOREIGN KEY (box_office_id) REFERENCES box_office(box_office_id),
	FOREIGN KEY (movies_id) REFERENCES movies(movies_id),
	FOREIGN KEY (upc) REFERENCES inventory(upc)
);