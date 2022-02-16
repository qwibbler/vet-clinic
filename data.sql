/* Populate database with sample data. */
INSERT INTO animals (
    name,
    date_of_birth,
    weight_kg,
    neutered,
    escape_attempts
  )
VALUES ('Agumon', '2020-02-03', 10.23, true, 0),
  ('Gabumon', '2018-11-15', 8, true, 2),
  ('Pikachu', '2021-01-07', 15.04, false, 1),
  ('Devimon', '2017-05-12', 11, true, 5),
  ('Charmander', '2020-02-08', -11, FALSE, 0),
  ('Plantmon', '2022-11-15', -5.7, TRUE, 2),
  ('Squirtle', '1993-04-02', -12.13, FALSE, 3),
  ('Angemon', '2005-06-12', -45, TRUE, 1),
  ('Boarmon', '2006-01-7', -20.4, TRUE, 7),
  ('Blossom', '1998-10-13', -20.4, TRUE, 7);
BEGIN;
UPDATE animals
SET species = 'unspecified';
ROLLBACK;
BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';
UPDATE animals
SET species = 'pokemon'
WHERE NOT name LIKE '%mon';
COMMIT;
ROLLBACK;
BEGIN;
DELETE FROM animals;
ROLLBACK;
BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals
SET weight_kg = weight_kg * -1
SELECT *
FROM animals;
ROLLBACK TO SP1;
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;
INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34),
  ('Jennifer Orwell', 19),
  ('Bob', 45),
  ('Melody Pond', 77),
  ('Dean Winchester', 14),
  ('Jodie Whittaker', 38);
UPDATE animals
SET species_id = 1
WHERE name NOT LIKE '%mon';
UPDATE animals
SET species_id = 2
WHERE name LIKE '%mon';
UPDATE animals
SET owner_id = 1
WHERE name = 'Agumon';
UPDATE animals
SET owner_id = 2
WHERE name in ('Gabumon', 'Pikachu');
UPDATE animals
SET owner_id = 3
WHERE name in ('Devimon', 'Plantmon');
UPDATE animals
SET owner_id = 4
WHERE name in ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals
SET owner_id = 5
WHERE name in ('Angemon', 'Boarmon');