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