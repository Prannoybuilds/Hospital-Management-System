/*
===========================================================
        CITY CARE HOSPITAL MANAGEMENT SYSTEM
                Database Schema
===========================================================

Developer : Prannoy Sen
Technology: Oracle SQL*Plus
Database  : Hospital Management System

Description:
This script creates the complete database structure
including all tables, constraints, and relationships.

===========================================================
*/

-----------------------------------------------------------
-- LOGIN TABLE
-----------------------------------------------------------

CREATE TABLE login
(
    id  NVARCHAR2(10),
    pwd NVARCHAR2(10)
);

INSERT INTO login
VALUES ('hospital','hospital');

COMMIT;

-----------------------------------------------------------
-- CREATE USER
-----------------------------------------------------------

DROP USER hospital CASCADE;

CREATE USER hospital
IDENTIFIED BY hospital;

GRANT DBA TO hospital;

CONNECT hospital/hospital;

-----------------------------------------------------------
-- PATIENTS
-----------------------------------------------------------

CREATE TABLE patients
(
    patient_id NUMBER(30) PRIMARY KEY,
    name NVARCHAR2(100) NOT NULL,
    dob NVARCHAR2(50),
    gender NVARCHAR2(10),
    contact NVARCHAR2(15),
    address NVARCHAR2(200),

    CONSTRAINT chk_gender
    CHECK(gender IN ('Male','Female','Other'))
);

-----------------------------------------------------------
-- DOCTORS
-----------------------------------------------------------

CREATE TABLE doctor
(
    doctor_id NUMBER(30) PRIMARY KEY,
    name NVARCHAR2(100) NOT NULL,
    specialization NVARCHAR2(50),
    contact NVARCHAR2(15),
    department NVARCHAR2(50)
);

-----------------------------------------------------------
-- STAFF
-----------------------------------------------------------

CREATE TABLE staff
(
    staff_id NUMBER(30) PRIMARY KEY,
    name NVARCHAR2(100) NOT NULL,
    role NVARCHAR2(50),
    contact NVARCHAR2(15),
    shift NVARCHAR2(20)
);

-----------------------------------------------------------
-- APPOINTMENTS
-----------------------------------------------------------

CREATE TABLE appointments
(
    appointment_id NUMBER(30) PRIMARY KEY,

    patient_id NUMBER(10) NOT NULL,

    doctor_id NUMBER(10) NOT NULL,

    appointment NVARCHAR2(50) NOT NULL,

    status NVARCHAR2(20),

    CONSTRAINT fk_patient
    FOREIGN KEY(patient_id)
    REFERENCES patients(patient_id)
    ON DELETE CASCADE,

    CONSTRAINT fk_doctor
    FOREIGN KEY(doctor_id)
    REFERENCES doctor(doctor_id)
    ON DELETE CASCADE
);

-----------------------------------------------------------
-- BILLING
-----------------------------------------------------------

CREATE TABLE billing
(
    bill_id NUMBER(30) PRIMARY KEY,

    patient_id NUMBER(10) NOT NULL,

    amount NUMBER(10,2)
    CHECK(amount>0),

    bill NVARCHAR2(50),

    status NVARCHAR2(20),

    CONSTRAINT fk_bill_patient
    FOREIGN KEY(patient_id)
    REFERENCES patients(patient_id)
    ON DELETE CASCADE
);

-----------------------------------------------------------
-- PHARMACY
-----------------------------------------------------------

CREATE TABLE pharmacy
(
    medicine_id NUMBER(30) PRIMARY KEY,

    name NVARCHAR2(100) NOT NULL,

    stock NUMBER(10)
    CHECK(stock>=0),

    price NUMBER(10,2)
    CHECK(price>0)
);

-----------------------------------------------------------
-- PRESCRIPTIONS
-----------------------------------------------------------

CREATE TABLE prescriptions
(
    prescription_id NUMBER(30) PRIMARY KEY,

    patient_id NUMBER(10) NOT NULL,

    doctor_id NUMBER(10) NOT NULL,

    medicine_id NUMBER(10) NOT NULL,

    dosage NVARCHAR2(50),

    CONSTRAINT fk_pres_patient
    FOREIGN KEY(patient_id)
    REFERENCES patients(patient_id)
    ON DELETE CASCADE,

    CONSTRAINT fk_pres_doctor
    FOREIGN KEY(doctor_id)
    REFERENCES doctor(doctor_id)
    ON DELETE CASCADE,

    CONSTRAINT fk_pres_medicine
    FOREIGN KEY(medicine_id)
    REFERENCES pharmacy(medicine_id)
    ON DELETE CASCADE
);

/*
===========================================================
                END OF DATABASE SCHEMA
===========================================================
*/