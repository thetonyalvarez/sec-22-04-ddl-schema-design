DROP DATABASE IF EXISTS soccer_league_db;

CREATE DATABASE soccer_league_db;

\c soccer_league_db;

CREATE TABLE Stadium (
    id serial PRIMARY KEY,
    name text NOT NULL,
    city text NOT NULL,
    region text NOT NULL
);

CREATE TABLE Season (
    season_number serial PRIMARY KEY,
    name text NOT NULL UNIQUE,
    start_date date NOT NULL,
    end_date date NOT NULL
);

CREATE TABLE Player (
    id serial PRIMARY KEY,
    first_name text NOT NULL,
    last_name text NOT NULL
);

CREATE TABLE Coach (
    id serial PRIMARY KEY,
    first_name text NOT NULL,
    last_name text NOT NULL
);

CREATE TABLE Referee (
    id serial PRIMARY KEY,
    first_name text NOT NULL,
    last_name text NOT NULL
);

CREATE TABLE Team (
    id serial PRIMARY KEY,
    team_name text NOT NULL UNIQUE,
    coaches int NOT NULL REFERENCES Coach,
    players int NOT NULL REFERENCES Player
);

CREATE TABLE League (
    id serial PRIMARY KEY,
    name text NOT NULL UNIQUE,
    region text NOT NULL,
    teams int NOT NULL REFERENCES Team,
    seasons int NOT NULL REFERENCES Season
);

CREATE TABLE Match (
    ID serial PRIMARY KEY,
    mdate date NOT NULL,
    team1 int NOT NULL REFERENCES Team,
    team2 int NOT NULL REFERENCES Team,
    stadium int NOT NULL REFERENCES Stadium,
    referees int NOT NULL REFERENCES Referee
);

CREATE TABLE Goal (
    match int PRIMARY KEY REFERENCES Match,
    player int NOT NULL REFERENCES Player,
    team int NOT NULL REFERENCES Team,
    time timestamp NOT NULL
);