SELECT name FROM animals WHERE name LIKE '%mon'
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01'
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu'
SELECT name,escape_attempts FROM animals WHERE weight_kg > 10.5
SELECT * FROM animals WHERE neutered = true
SELECT * FROM animals WHERE NOT name = 'Gabumon'
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3
BEGIN TRANSACTION;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';
select * from animals;
COMMIT TRANSACTION;
BEGIN TRANSACTION;
UPDATE ANIMALS
SET species = 'pokemon'
WHERE SPECIES IS NULL;
COMMIT TRANSACTION;
BEGIN TRANSACTION;
DELETE FROM animals
ROLLBACK TRANSACTION;
SELECT * FROM animals;
BEGIN TRANSACTION;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';
SAVEPOINT clear_first_january;
UPDATE animals
SET weight_kg = weight_kg-1
ROLLBACK TO clear_first_january;
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT TRANSACTION;
SELECT * FROM animals;
SELECT COUNT(name) FROM animals
SELECT COUNT(escape_attempts) FROM animals
WHERE escape_attempts = 0
SELECT AVG(weight_kg) FROM animals
SELECT name FROM animals WHERE escape_attempts = (SELECT MAX(escape_attempts) FROM animals)
SELECT MIN(weight_kg),MAX(weight_kg) FROM animals GROUP BY species
SELECT AVG(escape_attempts) FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-01'
BEGIN TRANSACTION;
UPDATE animals
SET species = 'unspecified';
SELECT species FROM animals;
ROLLBACK TRANSACTION;
SELECT species FROM animals;