DROP DATABASE med_center;
CREATE DATABASE med_center;
\c med_center;

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL
);

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,
    disease_name VARCHAR(30) UNIQUE NOT NULL,
    description TEXT 
);

CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients ON DELETE SET NULL,
    doctor_id INTEGER REFERENCES doctors ON DELETE SET NULL,
    diseases_id INTEGER REFERENCES diseases ON DELETE SET NULL,
    date_of_visit DATE NOT NULL
);




INSERT INTO patients (first_name, last_name)
VALUES
('first', 'patient'),
('nick', 'winters'),
('another', 'patient');

INSERT INTO doctors (first_name, last_name)
VALUES
('first', 'doctor'),
('doctor', 'pepper'),
('another', 'doctor');

INSERT INTO diseases (disease_name, description)
VALUES
('scurvey', 'sailors disease'),
('cancer', 'sorry walter white'),
('cauliflower ear', 'jiu jitsu problems');

INSERT INTO visits (patient_id, doctor_id, diseases_id, date_of_visit)
VALUES
(1, 1, 1, 'January 8, 1999'),
(1, 2, 1, 'January 10, 1999'),
(2, 1, 3, 'December 12, 2001'),
(3, 2, 2, 'December 15, 2001');



