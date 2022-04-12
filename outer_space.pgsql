DROP DATABASE IF EXISTS outer_space_db;

CREATE DATABASE outer_space_db;

\c outer_space_db;

CREATE TABLE planets (
    id serial PRIMARY KEY,
    name text NOT NULL UNIQUE,
    orbital_period_in_years float NOT NULL
);

CREATE TABLE galaxies (
    id serial PRIMARY KEY,
    name text NOT NULL UNIQUE
);

CREATE TABLE moons (
    id serial PRIMARY KEY,
    name text NOT NULL UNIQUE,
    planet_id int REFERENCES planets (id)
);

CREATE TABLE suns (
    id serial PRIMARY KEY,
    name text NOT NULL UNIQUE,
    galaxy_id int REFERENCES galaxies (id)
);

CREATE TABLE suns_galaxies (
    id serial PRIMARY KEY,
    planet_id int REFERENCES planets (id),
    sun_id int REFERENCES suns (id)
);

INSERT INTO planets (name, orbital_period_in_years) VALUES
    ('Earth', 1.00),
    ('Mars', 1.88),
    ('Venus', 0.62),
    ('Neptune', 164.8),
    ('Proxima Centauri b', 0.03),
    ('Gliese 876 b', 0.23);

INSERT INTO galaxies (name) VALUES
    ('Milky Way');

INSERT INTO moons (name, planet_id) VALUES
    ('The Moon', 1),
    ('Phobos', 2),
    ('Deimos', 2),
    ('Naiad', 4),
    ('Thalassa', 4),
    ('Despina', 4),
    ('Galatea', 4),
    ('Larissa', 4),
    ('S/2004 N 1', 4),
    ('Proteus', 4),
    ('Triton', 4),
    ('Nereid', 4),
    ('Halimede', 4),
    ('Sao', 4),
    ('Laomedeia', 4),
    ('Psamathe', 4),
    ('Neso', 4);

INSERT INTO suns (name, galaxy_id) VALUES
    ('The Sun', 1),
    ('Proxima Centauri', 1),
    ('Gliese 876', 1);

INSERT INTO suns_galaxies (planet_id, sun_id) VALUES
    (1,1),
    (2,2),
    (3,2),
    (4,2),
    (5,2),
    (6,3);