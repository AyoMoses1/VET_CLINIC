/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
  id                INT GENERATED ALWAYS AS IDENTITY,
  name              VARCHAR(100),
  date_of_birth     date,
  escape_attempts   INT,
  neutered          BOOLEAN,
  weight_kg         DECIMAL,
  PRIMARY KEY(id)
);

ALTER TABLE animals ADD COLUMN species VARCHAR(255);

CREATE TABLE owners(
  id                INT GENERATED ALWAYS AS IDENTITY,
  full_name         VARCHAR(100),
  age               INT,
  PRIMARY KEY(id)
);

CREATE TABLE species(
  id                INT GENERATED ALWAYS AS IDENTITY,
  name              VARCHAR(100),
  PRIMARY KEY(id)
);

ALTER TABLE animals DROP column species;
ALTER TABLE animals ADD COLUMN species_id INT, ADD CONSTRAINT fk_species_id FOREIGN KEY (species_id) REFERENCES species(id);
ALTER TABLE animals ADD COLUMN owners_id INT, ADD CONSTRAINT fk_owners_id FOREIGN KEY (owners_id) REFERENCES owners(id)

CREATE TABLE vets(
  id                	INT GENERATED ALWAYS AS IDENTITY,
  name              	VARCHAR(100),
  age               	INT,
  date_of_graduation 	date,
  PRIMARY KEY(id)
);

CREATE TABLE specializations (  vet_id INTEGER REFERENCES vets(id),  species_id INTEGER REFERENCES species(id),  PRIMARY KEY (vet_id, species_id) );
CREATE TABLE visits ( id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, animal_id INT REFERENCES animals(id),	vet_id INT REFERENCES vets(id),	date_of_visit DATE );

