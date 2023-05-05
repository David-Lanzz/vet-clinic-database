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

CREATE TABLE owners (
id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
	full_name VARCHAR(75) NOT NULL,
	age INT,
	PRIMARY KEY(id)
);

CREATE TABLE species (
id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(75) NOT NULL,
	PRIMARY KEY(id)
);

ALTER TABLE animals
DROP COLUMN id;
ADD COLUMN id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY;

ALTER TABLE animals
DROP species


BEGIN TRANSACTION;
ALTER TABLE animals
ADD COLUMN species_id INT;
ALTER TABLE animals
ADD FOREIGN KEY(species_id)
REFERENCES species(id)
COMMIT TRANSACTION

BEGIN TRANSACTION;
ALTER TABLE animals
ADD COLUMN owner_id INT;
ALTER TABLE animals
ADD CONSTRAINT owner_id
FOREIGN KEY(owner_id)
REFERENCES owners(id);
COMMIT TRANSACTION

CREATE TABLE vets (
id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
	name VARCHAR(75) NOT NULL,
	age INT NOT NULL,
	date_of_graduation date NOT NULL
);

BEGIN TRANSACTION;
CREATE TABLE specializations (
species_id INT,
	vet_id INT
);

ALTER TABLE specializations
ADD CONSTRAINT fk_species
FOREIGN KEY (species_id) REFERENCES species(id);

CREATE TABLE visits (
	animal_id INT,
vet_id INT,
	date_of_visit date,
	PRIMARY KEY (vet_id,animal_id,date_of_visit)
	);
	ALTER TABLE visits
	ADD CONSTRAINT fk_animals
	FOREIGN KEY (animal_id) REFERENCES animals(id);
	ALTER TABLE visits
	ADD CONSTRAINT fk_vets
	FOREIGN KEY (vet_id) REFERENCES vets(id);
COMMIT TRANSACTION;
