DROP DATABASE IF EXISTS craigslist_db;

CREATE DATABASE craigslist_db;

\c craigslist_db;

CREATE TABLE region (
    city serial PRIMARY KEY
);

CREATE TABLE category (
    name serial PRIMARY KEY 
);

CREATE TABLE user_account (
    id serial PRIMARY KEY,
    username varchar(12) UNIQUE NOT NULL,
    password varchar(25) NOT NULL,
    preferred_region INTEGER REFERENCES region
);

CREATE TABLE post (
    id serial PRIMARY KEY,
    post_date date NOT NULL,
    title varchar(25) NOT NULL,
    post_content text NOT NULL,
    location text NOT NULL,
    region_id int NOT NULL REFERENCES region,
    user_id INTEGER REFERENCES user_account,
    category_id int NOT NULL REFERENCES category
);
