/* Database schema to keep the structure of entire database. */
CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL,
    species_id INT,
    owner_id INT,
    PRIMARY KEY (id)
);
-- ALTER TABLE animals ADD species VARCHAR(50);
-- ALTER TABLE animals DROP COLUMN species;
-- ALTER TABLE animals ADD species_id INT;
ALTER TABLE animals ADD FOREIGN KEY (species_id) REFERENCES species(id);
-- ALTER TABLE animals ADD owner_id INT;
ALTER TABLE animals ADD FOREIGN KEY (owner_id) REFERENCES owners(id);
CREATE TABLE owners(
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(50),
    age INT,
    email VARCHAR(120),
    PRIMARY KEY (id)
);
-- ALTER TABLE owners ADD COLUMN email VARCHAR(120);
CREATE TABLE species(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50),
    PRIMARY KEY (id)
);
CREATE TABLE vets (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50),
    age VARCHAR(50),
    date_of_graduation DATE,
    PRIMARY KEY (id)
);
CREATE TABLE specializations (
    vet_id INT,
    species_id INT,
    FOREIGN KEY (vet_id) REFERENCES vets (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (species_id) REFERENCES species (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    PRIMARY KEY (vet_id, species_id)
);
CREATE TABLE visits (
    id INT GENERATED ALWAYS AS IDENTITY,
    vet_id INT,
    animal_id INT,
    date_of_visit DATE,
    FOREIGN KEY (vet_id) REFERENCES vets (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (animal_id) REFERENCES animals (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    PRIMARY KEY (id)
);

CREATE INDEX animal_id_acs ON visits (animal_id ASC);
CREATE INDEX vet_id_asc ON visits(vet_id ASC);
CREATE INDEX email_asc ON owners(email ASC);

