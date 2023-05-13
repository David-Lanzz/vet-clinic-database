INSERT INTO animals
VALUES (1,'Agumon','2020-03-02',0,false,10.23)

INSERT INTO animals
VALUES (2,'Gabumon','2018-11-15',2,true,8)


UPDATE animals
SET neutered = true 
WHERE neutered = false

INSERT INTO animals
VALUES (3,'Pikachu','2021-01-07',1,false,15.04),(4,'Devimon','2017-05-12',5,true,11)

UPDATE animals
SET data_of_birth = '2020-02-03'
WHERE data_of_birth = '2020-03-02'

ALTER TABLE animals
RENAME COLUMN data_of_birth TO date_of_birth

SELECT * FROM animals ORDER BY id

INSERT INTO animals
VALUES 
(5,'Charmander','2020-02-08',0,false,11),
(6,'Plantmon','2021-11-15',2,true,5.7),
(7,'Squirtle','1993-04-02',3,false,12.13),
(8,'Angemon','2005-06-12',1,true,45),
(9,'Boarmon','2005-06-07',7,true,20.4),
(10,'Blossom','1998-10-13',3,true,17),
(11,'Ditto','2022-05-14',4,true,22);

BEGIN TRANSACTION;
INSERT INTO owners(full_name,age)
VALUES('Sam Smith',34),
('Jennifer Orwell',19),
('Bob',45),
('Melody Pond',77),
('Dean Winchester',14),
('Jodie Whittaker',38)
COMMIT TRANSACTION

INSERT INTO species(name)
VALUES ('Pokemon'),('Digimon')

BEGIN TRANSACTION;
UPDATE animals
SET species_id = 2
WHERE name LIKE '%mon';
UPDATE animals
SET species_id = 1
WHERE NOT name LIKE '%mon';
COMMIT TRANSACTION;

BEGIN TRANSACTION;
UPDATE animals
SET owner_id = 1
WHERE name = 'Agumon';
UPDATE animals
SET owner_id = 2
WHERE name = 'Gabumon' OR name = 'Pikachu';
UPDATE animals
SET owner_id = 3
WHERE name = 'Devimon' OR name = 'Plantmon';
UPDATE animals
SET owner_id = 4
WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
UPDATE animals
SET owner_id = 5
WHERE name = 'Angemon' OR name = 'Boarmon';
COMMIT TRANSACTION;
SELECT * FROM animals

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

