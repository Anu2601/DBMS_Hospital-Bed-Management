drop database covidhospital;
create database covidhospital;

\c covidhospital

CREATE TABLE hospital (
	h_location VARCHAR(400),
	h_regno INT PRIMARY KEY CHECK(h_regno BETWEEN 100000 AND 999999),
	availability INT CHECK(availability BETWEEN 0 AND 999)
);

CREATE TABLE doctor (
	d_id INT PRIMARY KEY CHECK(d_id BETWEEN 100000 AND 999999),
	d_name VARCHAR(300),
	d_phone INT CHECK(d_phone BETWEEN 1000000000 AND 9999999999),
	h_regno INT CHECK(h_regno BETWEEN 100000 AND 999999),
	FOREIGN KEY(h_regno) REFERENCES hospital(h_regno) ON DELETE SET NULL
	ON UPDATE CASCADE
);

CREATE TABLE patient (
	h_regno INT CHECK(h_regno BETWEEN 100000 AND 999999),
	p_id INT PRIMARY KEY CHECK(p_id BETWEEN 100000 AND 999999),
	p_name VARCHAR(300),
	p_age INT CHECK(p_age BETWEEN 0 AND 200),
	p_phone INT CHECK(p_phone BETWEEN 1000000000 AND 9999999999),
	severity INT CHECK(severity BETWEEN 0 AND 10),
	FOREIGN KEY(h_regno) REFERENCES hospital(h_regno) ON DELETE SET NULL
	ON UPDATE CASCADE
);

CREATE TABLE diagnosis (
	fever DECIMAL(3,2),
	difficulty_b VARCHAR(3) CHECK(difficulty_b IN ('yes','no')),
	cough VARCHAR(3) CHECK(cough IN ('yes','no')),
	covid VARCHAR(3) CHECK(covid IN ('yes','no')),
	o2levels DECIMAL(3,2) NOT NULL,
	d_id INT CHECK(d_id BETWEEN 100000 AND 999999),
	p_id INT CHECK(p_id BETWEEN 100000 AND 999999),
	FOREIGN KEY(d_id) REFERENCES doctor(d_id) ON DELETE SET NULL
	ON UPDATE CASCADE,
	FOREIGN KEY(p_id) REFERENCES patient(p_id) ON DELETE SET NULL
	ON UPDATE CASCADE
);

CREATE TABLE bed (
	h_regno INT CHECK(h_regno BETWEEN 100000 AND 999999),
	b_id INT PRIMARY KEY CHECK(b_id BETWEEN 100 AND 999),
	ward_no INT CHECK(ward_no BETWEEN 0 AND 999),
	FOREIGN KEY(h_regno) REFERENCES hospital(h_regno) ON DELETE SET NULL
	ON UPDATE CASCADE
);

CREATE TABLE medicine (
	med_id INT PRIMARY KEY CHECK(med_id BETWEEN 100000 AND 999999),
	med_name VARCHAR(200)
);

CREATE TABLE prescription (
	pres_no INT PRIMARY KEY CHECK(pres_no BETWEEN 100000 AND 999999),
	p_id INT CHECK(p_id BETWEEN 100000 AND 999999),
	med_id INT CHECK(med_id BETWEEN 100000 AND 999999),
	d_id INT CHECK(d_id BETWEEN 100000 AND 999999),
	FOREIGN KEY(p_id) REFERENCES patient(p_id) ON DELETE SET NULL
	ON UPDATE CASCADE,
	FOREIGN KEY(med_id) REFERENCES medicine(med_id) ON DELETE SET NULL
	ON UPDATE CASCADE,
	FOREIGN KEY(d_id) REFERENCES doctor(d_id) ON DELETE SET NULL
	ON UPDATE CASCADE
);

CREATE TABLE bed_patient (
	h_regno INT CHECK(h_regno BETWEEN 100000 AND 999999),
	in_date DATE,
	out_date DATE,
	p_id INT CHECK(p_id BETWEEN 100000 AND 999999),
	b_id INT CHECK(b_id BETWEEN 0 AND 999),
	FOREIGN KEY(h_regno) REFERENCES hospital(h_regno) ON DELETE SET NULL
	ON UPDATE CASCADE,
	FOREIGN KEY(p_id) REFERENCES patient(p_id) ON DELETE SET NULL
	ON UPDATE CASCADE,
	FOREIGN KEY(b_id) REFERENCES bed(b_id) ON DELETE SET NULL
	ON UPDATE CASCADE
);

CREATE TABLE icu(
	h_regno INT CHECK(h_regno BETWEEN 100000 AND 999999),
	icu_no INT CHECK(icu_no BETWEEN 0 AND 999),
	duration DECIMAL(3,2),
	start_date DATE,
	p_id INT CHECK(p_id BETWEEN 100000 AND 999999),
	FOREIGN KEY(h_regno) REFERENCES hospital(h_regno) ON DELETE SET NULL
	ON UPDATE CASCADE,
	FOREIGN KEY(p_id) REFERENCES patient(p_id) ON DELETE SET NULL
	ON UPDATE CASCADE
);

CREATE TABLE waiting (
	severity INT CHECK(severity BETWEEN 0 AND 10),
	name VARCHAR(300),
	wait_id INT CHECK(wait_id BETWEEN 100 AND 999),
	phone_no INT CHECK(phone_no BETWEEN 1000000000 AND 9999999999),
	age INT CHECK(age BETWEEN 0 AND 200),
	address VARCHAR(400),
	h_regno INT CHECK(h_regno BETWEEN 100000 AND 999999),
	FOREIGN KEY(h_regno) REFERENCES hospital(h_regno) ON DELETE SET NULL
	ON UPDATE CASCADE
);