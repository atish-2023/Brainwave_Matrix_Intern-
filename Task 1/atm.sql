CREATE DATABASE atm;

USE atm;

CREATE TABLE userinfo (
    accno varchar(10)  PRIMARY KEY,           
    accholder VARCHAR(50) NOT NULL,  
    gender VARCHAR(10) NOT NULL,     
    balance INT DEFAULT 0,           
    pin INT NOT NULL,                
    acctype VARCHAR(20) NOT NULL,   
    phone VARCHAR(15) UNIQUE,        
    email VARCHAR(50) UNIQUE,        
    address TEXT,                    
    status VARCHAR(10) DEFAULT 'Active' 
);




describe userinfo;

INSERT INTO userinfo (accno, accholder, gender, balance, pin, acctype, phone, email, address, status) 
VALUES 
(100110022, 'Atish Pawar', 'Male', 0, 1234, 'Savings', '9876543210', 'atish@example.com', 'Pune, Maharashtra', 'Active'),
(100110055, 'Rahul Sharma', 'Male', 0, 5678, 'Current', '8765432109', 'rahul@example.com', 'Mumbai, Maharashtra', 'Active'),
(100300077, 'Sneha Joshi', 'Female', 3200, 4321, 'Savings', '7654321098', 'sneha@example.com', 'Nagpur, Maharashtra', 'Active');

select * from userinfo;





