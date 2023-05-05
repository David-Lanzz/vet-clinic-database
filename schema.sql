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

INSERT INTO vets (
name,age,date_of_graduation
)
VALUES ('William Tatcher',45,'2000-04-23'),
('Maisy Smith',26,'2019-01-07'),
('Stephanie Mendez',64,'1981-05-04'),
('Jack Harkness',38,'2008-06-08')

INSERT INTO specializations
VALUES (1,1),(1,3),(2,3),(2,4);
SELECT * FROM specializations

BEGIN TRANSACTION;
INSERT INTO visits
VALUES (5,1,'2020-05-24'),(5,3,'2020-07-22'),(4,4,'2021-02-02'),(10,2,'2020-01-05'),(10,2,'2020-03-08'),
(10,2,'2020-05-14'),(1,3,'2021-05-04'),(7,4,'2021-02-24'),(2,2,'2019-12-21'),(2,1,'2020-08-10'),
(2,2,'2021-04-07'),(8,3,'2019-09-29'),(3,4,'2020-10-03'),(3,4,'2020-11-04'),(6,2,'2019-01-24'),
(6,2,'2019-05-15'),(6,2,'2020-02-27'),(6,2,'2020-08-03'),
(6,3,'2020-05-24'),(6,1,'2021-01-11');
COMMIT TRANSACTION

-- corrected mistake made in data insertion
UPDATE visits
SET animal_id = 11 WHERE vet_id = 3 AND date_of_visit = '2020-05-24' OR date_of_visit = '2021-01-11'

