/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
id INT NOT NULL,
	name VARCHAR(50) NOT NULL,
	data_of_birth DATE NOT NULL,
	escape_attempts INT,
	neutered BOOL,
	weight_kg DECIMAL
);

ALTER TABLE animals
ADD species text;
