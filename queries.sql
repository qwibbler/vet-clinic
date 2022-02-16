/*Queries that provide answers to the questions FROM all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT * FROM animals WHERE neutered AND escape_attempts < 3;
SELECT * FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered;
SELECT * FROM animals WHERE NOT name = 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;
SELECT AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-01';

SELECT name as pets 
  FROM animals 
    INNER JOIN owners 
      ON owner_id = owners.id 
  WHERE full_name = 'Melody Pond';
SELECT animals.name AS Pokemons 
  FROM animals 
    INNER JOIN species 
      ON species_id = species.id 
  WHERE species.name = 'Pokemon';
SELECT name AS pet, full_name AS owner 
  FROM animals 
    RIGHT JOIN owners 
      ON owner_id = owners.id;
SELECT species.name AS species, COUNT(*) 
  FROM species 
    LEFT JOIN animals 
      ON species.id = species_id 
    GROUP BY species.name;
SELECT animals.name
  FROM animals
    INNER JOIN owners
      ON owner_id = owners.id
    INNER JOIN species
      ON species_id = species.id
  WHERE full_name = 'Jennifer Orwell'
    AND species.name = 'Digimon';
SELECT name, escape_attempts
  FROM animals
    INNER JOIN owners
      ON owner_id = owners.id
  WHERE full_name = 'Dean Winchester'
    AND escape_attempts = 0;

SELECT full_name, COUNT(full_name)
  FROM (
    SELECT full_name 
      FROM animals 
        LEFT JOIN owners 
          ON owner_id = owners.id)
      AS c 
      GROUP BY full_name
    HAVING COUNT (full_name) = (
      SELECT MAX(count)
        FROM (
          SELECT full_name, COUNT(full_name) 
            FROM animals 
              LEFT JOIN owners 
                ON owner_id = owners.id 
          GROUP BY full_name)
        AS c);