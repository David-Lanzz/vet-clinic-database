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

BEGIN TRANSACTION;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';
SELECT species FROM animals
WHERE name LIKE '%mon';
COMMIT TRANSACTION;

BEGIN TRANSACTION;
UPDATE animals
SET species = 'pokemon'
WHERE NOT name LIKE '%mon';
SELECT species FROM animals
WHERE NOT name LIKE '%mon';
COMMIT TRANSACTION;
SELECT * FROM animals

SELECT name FROM animals
JOIN owners
ON owners.id = animals.owner_id
WHERE owners.full_name = 'Melody Pond'

SELECT * FROM animals
JOIN species
ON animals.species_id = species.id
WHERE animals.species_id = 1

SELECT name FROM animals
JOIN owners
ON owners.id = animals.owner_id
WHERE owners.full_name = 'Jennifer Orwell'

SELECT name FROM animals
JOIN owners
ON owners.id = animals.owner_id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0

SELECT full_name,name FROM owners
FULL JOIN animals
ON animals.owner_id = owners.id 

SELECT species.name,COUNT(species_id) FROM animals
JOIN species
ON animals.species_id = species.id
GROUP BY species.name

SELECT owners.full_name,COUNT(name) FROM animals
JOIN owners
ON animals.owner_id = owners.id
GROUP BY owners.full_name
ORDER BY COUNT(name) DESC
LIMIT 1

ALTER TABLE visits
ADD COLUMN date_of_visit date

SELECT name,animal_id,vet_id,date_of_visit FROM visits JOIN animals
ON animal_id = id
WHERE vet_id = 1 AND date_of_visit = (SELECT MIN(date_of_visit) FROM visits WHERE vet_id = 1);

SELECT name,animal_id,vet_id FROM visits JOIN animals
ON animal_id = id
WHERE vet_id = 3 

SELECT vets.name,species.name FROM species
 FULL JOIN specializations
  ON species.id = specializations.species_id
 FULL JOIN vets
  ON specializations.species_id = vets.id;

  SELECT vets.name,animals.name,date_of_visit FROM vets JOIN visits
ON vets.id = visits.vet_id
JOIN animals
ON visits.animal_id = animals.id
WHERE vets.id = 3 AND date_of_visit BETWEEN '2020-04-01' AND '2020-09-30'

SELECT date_of_visit,name FROM visits JOIN animals
ON animal_id = id
WHERE vet_id = 2 AND date_of_visit = (SELECT MIN(date_of_visit) FROM visits WHERE vet_id = 2)

SELECT * FROM visits JOIN animals
ON animal_id = id
WHERE date_of_visit = (SELECT MAX(date_of_visit) FROM visits)

SELECT COUNT(date_of_visit) FROM visits FULL JOIN specializations
ON visits.vet_id = specializations.vet_id
WHERE specializations.vet_id IS NULL

SELECT COUNT(species_id),species.name FROM visits JOIN animals
ON animal_id = id
JOIN species
ON species_id = species.id
WHERE vet_id = 2
GROUP BY species.id
ORDER BY species.id DESC
LIMIT 1

SELECT COUNT(animal_id),animals.name FROM visits JOIN animals
on id = animal_id
JOIN vets ON visits.vet_id = vets.id
GROUP BY animals.name
ORDER BY COUNT DESC LIMIT 1