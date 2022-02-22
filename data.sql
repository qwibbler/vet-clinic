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
-- DELETE FROM animals
-- WHERE date_of_birth > '2022-01-01';
-- SAVEPOINT SP1;
-- ROLLBACK TO SP1;
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
INSERT INTO vets (name, age, date_of_graduation)
VALUES ('William Tatcher', 45, '2000-04-23'),
  ('Maisy Smith', 26, '2019-01-17'),
  ('Stephanie Mendez', 64, '1981-05-04'),
  ('Jack Harkness', 38, '2008-06-08');
INSERT INTO specializations
VALUES (1, 1),
  (3, 1),
  (3, 2),
  (4, 2);
INSERT INTO animals (
    name,
    date_of_birth,
    weight_kg,
    neutered,
    escape_attempts
  )
VALUES ('Plantmon', '2022-11-15', -5.7, TRUE, 2);
INSERT INTO visits
VALUES (1, 1, '2020-05-24'),
  (3, 1, '2020-07-22'),
  (4, 2, '2021-02-02'),
  (2, 3, '2020-01-05'),
  (2, 3, '2020-03-08'),
  (2, 3, '2020-05-14'),
  (3, 4, '2021-05-04'),
  (4, 5, '2021-02-24'),
  (2, 13, '2019-12-21'),
  (1, 13, '2020-08-10'),
  (2, 13, '2021-04-07'),
  (3, 7, '2019-09-29'),
  (4, 12, '2020-10-03'),
  (4, 12, '2020-11-04'),
  (2, 8, '2019-01-24'),
  (2, 8, '2019-05-15'),
  (2, 8, '2020-02-27'),
  (2, 8, '2020-08-03'),
  (3, 9, '2020-05-24'),
  (1, 9, '2021-01-11');
INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT *
FROM (
    SELECT id
    FROM animals
  ) animal_ids,
  (
    SELECT id
    FROM vets
  ) vets_ids,
  generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;
INSERT INTO  owners (full_name, email)
SELECT 'Owner ' || generate_series(1, 2500000),
  'owner_' || generate_series(1, 2500000) || '@mail.com';