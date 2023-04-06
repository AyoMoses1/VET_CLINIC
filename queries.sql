SELECT * from animals where name like '%mon%'
SELECT * from animals where date_of_birth between '2016-01-01' and '2019-12-31'
SELECT name from animals where neutered is true and escape_attempts < 3
SELECT date_of_birth from animals where name = 'Agumon' or name = 'Pikachu'
SELECT name, escape_attempts from animals where weight_kg > 10.5
SELECT * from animals where neutered is true
SELECT * from animals where name != 'Gabumon'
SELECT * from animals where weight_kg >= 10.4 and weight_kg <= 17.3


BEGIN;
UPDATE animals
SET species = 'unspecified'
ROLLBACK;

SELECT species from animals;



BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;
SELECT species from animals;

BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT species from animals;

BEGIN;
DELETE from animals WHERE date_of_birth > '2022-01-01'
SAVEPOINT AN1;
UPDATE animals 
SET weight_kg = weight_kg * -1
ROLLBACK TO AN1
UPDATE animals 
SET weight_kg = weight_kg * -1 WHERE weight_kg < 0
COMMIT;

select COUNT(*) from animals;
select COUNT(*) from animals where escape_attempts = 0
SELECT AVG(weight_kg) FROM animals;
SELECT neutered as neutered_animals , COUNT(*) as number_of_escape FROM animals WHERE escape_attempts > 0 GROUP BY neutered;
SELECT species, MIN(weight_kg) as minimum_weight , MAX(weight_kg) as maximum_weight FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) as avg_number_of_escape FROM animals WHERE date_of_birth BETWEEN '990-01-01' AND '2000-12-31' GROUP BY species;