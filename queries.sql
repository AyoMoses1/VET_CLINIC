SELECT * from animals where name like '%mon%'
SELECT * from animals where date_of_birth between '2016-01-01' and '2019-12-31'
SELECT name from animals where neutered is true and escape_attempts < 3
SELECT date_of_birth from animals where name = 'Agumon' or name = 'Pikachu'
SELECT name, escape_attempts from animals where weight_kg > 10.5
SELECT * from animals where neutered is true
SELECT * from animals where name != 'Gabumon'
SELECT * from animals where weight_kg >= 10.4 and weight_kg <= 17.3