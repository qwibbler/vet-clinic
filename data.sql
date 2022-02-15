/* Populate database with sample data. */
INSERT INTO animals (
    name,
    date_of_birth,
    weight_kg,
    neutered,
    escape_attempts
  )
VALUES ('Agumon', '2020-02-03', 10.23, true, 0);
INSERT INTO animals (
    name,
    date_of_birth,
    weight_kg,
    neutered,
    escape_attempts
  )
VALUES ('Gabumon', '2018-11-15', 8, true, 2);
INSERT INTO animals (
    name,
    date_of_birth,
    weight_kg,
    neutered,
    escape_attempts
  )
VALUES ('Pikachu', '2021-01-07', 15.04, false, 1);
INSERT INTO animals (
    name,
    date_of_birth,
    weight_kg,
    neutered,
    escape_attempts
  )
VALUES ('Devimon', '2017-05-12', 11, true, 5);
INSERT INTO animals (
    name,
    date_of_birth,
    weight_kg,
    neutered,
    escape_attempts
  )

VALUES ('Charmander', '2020-02-08', -11, FALSE, 0);
INSERT INTO animals (
    name,
    date_of_birth,
    weight_kg,
    neutered,
    escape_attempts
  )
VALUES ('Plantmon', '2022-11-15', -5.7, TRUE, 2);
INSERT INTO animals (
    name,
    date_of_birth,
    weight_kg,
    neutered,
    escape_attempts
  )
VALUES ('Squirtle', '1993-04-02', -12.13, FALSE, 3);
INSERT INTO animals (
    name,
    date_of_birth,
    weight_kg,
    neutered,
    escape_attempts
  )
VALUES ('Angemon', '2005-06-12', -45, TEUE, 1);
INSERT INTO animals (
    name,
    date_of_birth,
    weight_kg,
    neutered,
    escape_attempts
  )
VALUES ('Boarmon', '2006-01-7', -20.4, TRUE, 7);
INSERT INTO animals (
    name,
    date_of_birth,
    weight_kg,
    neutered,
    escape_attempts
  )
VALUES ('Blossom', '1998-10-13', -20.4, TRUE, 7);

BEGIN;
UPDATE animals
SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';
SELECT * FROM animals;
UPDATE animals
SET species = 'pokemon'
WHERE NOT name LIKE '%mon';
SELECT * FROM animals;
COMMIT;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';
SELECT * FROM animals;
SAVEPOINT SP1;
UPDATE animals
SET weight_kg = weight_kg * -1
SELECT * FROM animals;
ROLLBACK TO SP1;
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;