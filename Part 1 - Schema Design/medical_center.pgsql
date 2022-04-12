DROP DATABASE IF EXISTS medical_center_db;

CREATE DATABASE medical_center_db;

\c medical_center_db;

CREATE TABLE Doctors (
    id serial PRIMARY KEY,
    first_name text NOT NULL,
    last_name text NOT NULL
);

CREATE TABLE Diseases (
    id serial PRIMARY KEY,
    disease text NOT NULL UNIQUE
);

CREATE TABLE MedicalCenters (
    id serial PRIMARY KEY,
    name text NOT NULL,
    doctor int NOT NULL REFERENCES Doctors
);

CREATE TABLE Patients (
    id serial PRIMARY KEY,
    first_name text NOT NULL,
    last_name text NOT NULL
);

CREATE TABLE Appointments (
    id serial PRIMARY KEY,
    appt_date date NOT NULL,
    doctor_id int NOT NULL REFERENCES Doctors,
    patient_id int NOT NULL REFERENCES Patients,
    medical_center_id int NOT NULL REFERENCES MedicalCenters
);


CREATE TABLE Diagnoses (
    id serial PRIMARY KEY,
    doctor_id int NOT NULL REFERENCES Doctors,
    appointment_id int NOT NULL REFERENCES Appointments,
    disease_id int NOT NULL REFERENCES Diseases,
    notes text NOT NULL
);