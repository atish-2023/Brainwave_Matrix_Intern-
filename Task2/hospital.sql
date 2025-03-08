CREATE DATABASE hospital;
USE hospital;

CREATE TABLE patients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    contact VARCHAR(20),
    address VARCHAR(255)
);

CREATE TABLE appointments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    doctor VARCHAR(100),
    date DATE,
    FOREIGN KEY (patient_id) REFERENCES patients(id)
);

CREATE TABLE ehr (
    id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    diagnosis TEXT,
    prescription TEXT,
    FOREIGN KEY (patient_id) REFERENCES patients(id)
);

INSERT INTO patients (name, age, gender, contact, address) VALUES
('John Doe', 30, 'Male', '9876543210', '123 Main St'),
('Jane Smith', 45, 'Female', '9876543211', '456 Oak St');

INSERT INTO ehr (patient_id, diagnosis, prescription) VALUES
(1, 'Mild fever and cough', 'Paracetamol 500mg, Rest for 3 days'),
(2, 'Hypertension', 'Amlodipine 5mg daily, Reduce salt intake');

SELECT * FROM patients;
SELECT * FROM ehr;

CREATE TABLE admin (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL
);

INSERT INTO admin (username, password) VALUES ('admin', 'admin123');  -- Default admin



CREATE TABLE doctors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    specialization VARCHAR(100),
    contact_no VARCHAR(15),
    email VARCHAR(100)
);

INSERT INTO doctors (name, specialization, contact_no, email) VALUES
('Dr. Rajesh Sharma', 'Cardiologist', '9876543210', 'rajesh.sharma@example.com'),
('Dr. Priya Mehta', 'Dermatologist', '9765432109', 'priya.mehta@example.com'),
('Dr. Sameer Kulkarni', 'Orthopedic', '9988776655', 'sameer.kulkarni@example.com'),
('Dr. Anjali Desai', 'Pediatrician', '9876541230', 'anjali.desai@example.com'),
('Dr. Rohit Verma', 'Neurologist', '9865321470', 'rohit.verma@example.com');

select * from patients;
