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
