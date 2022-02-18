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

SELECT animals.name 
  FROM visits 
    LEFT JOIN animals 
      ON animal_id = id 
  WHERE date_of_visit = (
    SELECT MAX(date_of_visit) 
      FROM visits 
    WHERE vet_id = 1);
SELECT COUNT(DISTINCT(animal_id)) FROM visits WHERE vet_id = 3;
SELECT vets.name as vet, species.name as specialization 
  FROM specializations 
    FULL JOIN vets 
      ON vet_id = vets.id 
    LEFT JOIN species 
      ON species_id = species.id;
SELECT name, date_of_visit  
  FROM visits 
    LEFT JOIN animals 
      ON animal_id = id 
  WHERE vet_id = 3 
    AND date_of_visit 
      BETWEEN '2020-04-01' 
        AND '2020-08-30';
SELECT name, COUNT(date_of_visit)
  FROM (
    SELECT name, date_of_visit 
      FROM visits
        LEFT JOIN animals ON animal_id = id) AS c 
    GROUP BY name
  HAVING COUNT (date_of_visit) = (
    SELECT MAX(count)
      FROM (
        SELECT COUNT(date_of_visit) 
          FROM visits 
        GROUP BY animal_id)
      AS c);
SELECT animals.name 
  FROM visits 
    LEFT JOIN animals 
      ON animal_id = id 
  WHERE date_of_visit = (
    SELECT MIN(date_of_visit) 
      FROM visits 
    WHERE vet_id = 3);

SELECT animals.name as animal, vets.name as vet, date_of_visit
  FROM visits 
    LEFT JOIN animals 
      ON animal_id = animals.id 
    LEFT JOIN vets
      ON vet_id = vets.id
  WHERE date_of_visit = (
    SELECT MIN(date_of_visit) 
      FROM visits);

SELECT COUNT(*) AS unspecialized
  FROM visits
  LEFT JOIN animals ON animal_id = id
  WHERE animals.species_id NOT IN (
    SELECT specializations.species_id FROM specializations 
    WHERE visits.vet_id = specializations.vet_id);

SELECT species_name FROM (
  SELECT species.name as species_name, COUNT(animals.species_id) 
    FROM visits LEFT JOIN animals ON animal_id = id 
      LEFT JOIN species ON animals.species_id = species.id
    WHERE vet_id = 2 
    GROUP BY species.name) as spec_count
  WHERE count = (
    SELECT MAX(count) FROM (
      SELECT COUNT(animals.species_id) 
      FROM visits LEFT JOIN animals ON animal_id = id 
      WHERE vet_id = 2 
      GROUP BY species_id) AS count);