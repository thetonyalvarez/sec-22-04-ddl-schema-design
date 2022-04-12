DROP DATABASE IF EXISTS air_traffic_db;

CREATE DATABASE air_traffic_db;

\c air_traffic_db;

CREATE TABLE Travelers (
    id serial PRIMARY KEY,
    first_name text NOT NULL,
    last_name text NOT NULL
);

CREATE TABLE Airports (
    airport_code varchar(3) PRIMARY KEY,
    city text NOT NULL,
    country text NOT NULL
);

CREATE TABLE Airlines (
    name text UNIQUE PRIMARY KEY
);

CREATE TABLE Tickets (
    id serial PRIMARY KEY,
    traveler int NOT NULL REFERENCES Travelers,
    seat varchar(3) NOT NULL,
    departure_time timestamp NOT NULL,
    arrival_time timestamp NOT NULL,
    airline text NOT NULL REFERENCES Airlines,
    departing_from varchar(3) NOT NULL REFERENCES Airports,
    arriving_to varchar(3) NOT NULL REFERENCES Airports
);


INSERT INTO Travelers (first_name, last_name)
    VALUES
        ('Jennifer', 'Finch'), 
        ('Thadeus', 'Gathercoal'), 
        ('Alvin', 'Leathes'), 
        ('Sonja', 'Pauley'), 
        ('Waneta', 'Skeleton'), 
        ('Cory', 'Squibbes'),
        ('Berkie', 'Wycliff');

INSERT INTO Airlines (name)
    VALUES
        ('Air China'),
        ('American Airlines'),
        ('Avianca Brasil'),
        ('British Airways'),
        ('Delta'),
        ('TUI Fly Belgium'),
        ('United');

INSERT INTO Airports (airport_code, city, country)
    VALUES
        ('PEK', 'Beijing', 'China'),
        ('CAS', 'Casablanca', 'Morocco'),
        ('CID', 'Cedar Rapids', 'United States'),
        ('CLT', 'Charlotte', 'United States'),
        ('ORD', 'Chicago', 'United States'),
        ('DXB', 'Dubai', 'UAE'),
        ('LAS', 'Las Vegas', 'United States'),
        ('LON', 'London', 'United Kingdom'),
        ('LAX', 'Los Angeles', 'United States'),
        ('MEX', 'Mexico City', 'Mexico'),
        ('MSY', 'New Orleans', 'United States'),
        ('NYC', 'New York', 'United States'),
        ('PAR', 'Paris', 'France'),
        ('CGH', 'Sao Paolo', 'Brazil'),
        ('SCL', 'Santiago', 'Chile'),
        ('SEA', 'Seattle', 'United States'),
        ('TYO', 'Tokyo', 'Japan'),
        ('WAS', 'Washington DC', 'United States');

INSERT INTO Tickets (traveler, seat, departure_time, arrival_time, airline, departing_from, arriving_to)
    VALUES
        (1, '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 'WAS', 'SEA'),
        (2, '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 'TYO', 'LON'),
        (4, '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 'LAX', 'LAS'),
        (1, '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 'SEA', 'MEX'),
        (5, '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 'PAR', 'CAS'),
        (2, '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 'DXB', 'PEK'),
        (7, '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 'NYC', 'CLT'),
        (3, '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 'CID', 'ORD'),
        (7, '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 'CLT', 'MSY'),
        (6, '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 'CGH', 'SCL');