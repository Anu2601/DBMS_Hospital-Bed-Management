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
	d_phone BIGINT CHECK(d_phone BETWEEN 1000000000 AND 9999999999),
	h_regno INT CHECK(h_regno BETWEEN 100000 AND 999999),
	FOREIGN KEY(h_regno) REFERENCES hospital(h_regno) ON DELETE SET NULL
	ON UPDATE CASCADE
);

CREATE TABLE patient (
	h_regno INT CHECK(h_regno BETWEEN 100000 AND 999999),
	p_id INT PRIMARY KEY CHECK(p_id BETWEEN 100000 AND 999999),
	p_name VARCHAR(300),
	p_age INT CHECK(p_age BETWEEN 0 AND 200),
	p_phone BIGINT CHECK(p_phone BETWEEN 1000000000 AND 9999999999),
	severity INT CHECK(severity BETWEEN 0 AND 10),
	FOREIGN KEY(h_regno) REFERENCES hospital(h_regno) ON DELETE SET NULL
	ON UPDATE CASCADE
);

CREATE TABLE diagnosis ( 
	fever DECIMAL(6,2),
	difficulty_b VARCHAR(3) CHECK(difficulty_b IN ('yes','no')),
	cough VARCHAR(3) CHECK(cough IN ('yes','no')),
	covid VARCHAR(3) CHECK(covid IN ('yes','no')),
	o2levels DECIMAL(6,2) NOT NULL,
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
	duration NUMERIC(5,2),
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
	wait_id INT CHECK(wait_id BETWEEN 0 AND 100),
	phone_no BIGINT CHECK(phone_no BETWEEN 1000000000 AND 9999999999),
	age INT CHECK(age BETWEEN 0 AND 200),
	address VARCHAR(400),
	h_regno INT CHECK(h_regno BETWEEN 100000 AND 999999),
	FOREIGN KEY(h_regno) REFERENCES hospital(h_regno) ON DELETE SET NULL
	ON UPDATE CASCADE
);

CREATE TABLE entrylog_patient(
	h_regno INT CHECK(h_regno BETWEEN 100000 AND 999999),
	p_id INT CHECK(p_id BETWEEN 100000 AND 999999),
	entry_date TEXT NOT NULL
);

CREATE TABLE entrylog_doctor(
	h_regno INT CHECK(h_regno BETWEEN 100000 AND 999999),
	d_id INT CHECK(d_id BETWEEN 100000 AND 999999),
	entry_date TEXT NOT NULL
);

CREATE TABLE new_medicines(
	med_id INT PRIMARY KEY CHECK(med_id BETWEEN 100000 AND 999999),
	med_name VARCHAR(200),
	entry_date TEXT NOT NULL
);

CREATE TABLE new_hospital(
	h_location VARCHAR(400),
	h_regno INT PRIMARY KEY CHECK(h_regno BETWEEN 100000 AND 999999),
	availability INT CHECK(availability BETWEEN 0 AND 999)
);

\c covidhospital

INSERT into HOSPITAL values('Ramamurthy Nagar', 431276, 15);
INSERT into HOSPITAL values('Kormangala', 109468, 4);
INSERT into HOSPITAL values('Kammanahalli', 241487, 26);
INSERT into HOSPITAL values('Electronic City', 518651, 10);
INSERT into HOSPITAL values('Sarjapur', 172501, 6);
INSERT into HOSPITAL values('Banshankari', 143806, 11);
INSERT into HOSPITAL values('JP nagar', 834781, 21);
INSERT into HOSPITAL values('Majestic', 737863, 3);

INSERT into DOCTOR values(681473, 'Shrivatsa Sarna', 9087622972, 241487);
INSERT into DOCTOR values(194282, 'Manish Rao', 9814242043, 431276);
INSERT into DOCTOR values(846198, 'Vedanti Krishna', 5949107414, 109468);
INSERT into DOCTOR values(149681, 'Adnan Kalita', 8973471358, 518651);
INSERT into DOCTOR values(980716, 'Prabhat Atwal', 6148038031, 172501);
INSERT into DOCTOR values(261090, 'Janya Garg', 9831551571, 834781);
INSERT into DOCTOR values(541740, 'Nakul Krishnamurthy', 9874376177, 143806);
INSERT into DOCTOR values(807466, 'Dhruv Andra', 9908787321, 737863);
INSERT into DOCTOR values(187346, 'Lata Deep', 9838477317, 172501);
INSERT into DOCTOR values(105846, 'Akanksha Narayanan', 9875102875, 241487);


INSERT into PATIENT values(172501,212897,'Arathi',51,8712324598,2);
INSERT into PATIENT values(143806,134650,'Vasu',27,7203756142,9);
INSERT into PATIENT values(834781,712804,'Vishal',27,7203756142,10);
INSERT into PATIENT values(241487,278248,'Parushuram',43,8765121278,8);
INSERT into PATIENT values(518651,928788,'Hamsa',38,9786584268,2);
INSERT into PATIENT values(431276,210021,'Satish',37,7203756142,8);
INSERT into PATIENT values(109468,258702,'Veena',29,4870922531,3);
INSERT into PATIENT values(737863,872508,'Verma',37,7203756142,8);
INSERT into PATIENT values(172501,928752,'Megha',37,7203756142,8);
INSERT into PATIENT values(241487,528701,'John',37,7203756142,8);
INSERT into PATIENT values(431276,598571,'Rohan',37,7203756142,8);


INSERT into DIAGNOSIS values(99.00,'yes','yes','yes',87.00, 194282,210021);
INSERT into DIAGNOSIS values(97.00,'no','no','no',96.00, 681473,278248);
INSERT into DIAGNOSIS values(NULL,'no','yes','no',90.00, 149681,928788);
INSERT into DIAGNOSIS values(99.00,'no','no','yes',95.00, 541740,134650);
INSERT into DIAGNOSIS values(98.00,'no','yes','yes',97.00, 980716,212897);
INSERT into DIAGNOSIS values(100.00,'yes','yes','yes',91.00, 261090,712804);
INSERT into DIAGNOSIS values(97.00,'no','no','yes',96.00, 807466,872508);
INSERT into DIAGNOSIS values(99.00,'yes','yes','yes',89.00, 187346,928752);
INSERT into DIAGNOSIS values(97.00,'no','no','yes',95.00, 105846,528701);
INSERT into DIAGNOSIS values(98.00,'no','yes','yes',95.00, 187346,598571);


INSERT into BED values(241487,401,7);
INSERT into BED values(518651,121,11);
INSERT into BED values(431276,234,10);
INSERT into BED values(109468,119,4);
INSERT into BED values(172501,156,11);
INSERT into BED values(143806,106,9);
INSERT into BED values(737863,145,10);
INSERT into BED values(834781,215,4);
INSERT into BED values(172501,256,3);
INSERT into BED values(241487,101,19);
INSERT into BED values(431276,134,5);

INSERT into BED_PATIENT values(172501,'2021-05-03','2021-05-10', 928752,156);
INSERT into BED_PATIENT values(241487,'2021-05-13','2021-03-17', 528701,401);
INSERT into BED_PATIENT values(431276,'2021-04-11','2021-04-21', 598571,234);
INSERT into BED_PATIENT values(431276,'2021-03-12','2021-03-16', 210021,134);
INSERT into BED_PATIENT values(109468,'2021-03-10','2021-03-13', 258702,119);
INSERT into BED_PATIENT values(241487,'2021-04-03','2021-04-05', 278248,101);
INSERT into BED_PATIENT values(518651,'2021-05-12','2021-05-16', 928788,121);
INSERT into BED_PATIENT values(143806,'2021-04-15','2021-04-21', 134650,106);
INSERT into BED_PATIENT values(172501,'2021-03-07','2021-03-17', 212897,156);
INSERT into BED_PATIENT values(737863,'2021-04-11','2021-04-19', 872508,145);
INSERT into BED_PATIENT values(834781,'2021-05-02','2021-05-08', 712804,215);


INSERT into MEDICINE values(275653,'thrombolysis');
INSERT into MEDICINE values(116171,'ibuprofen');
INSERT into MEDICINE values(431851,'remdesvir');


INSERT into PRESCRIPTION values(210044,278248,116171, 681473);
INSERT into PRESCRIPTION values(134980,928788,275653, 194282);
INSERT into PRESCRIPTION values(486166,210021,431851, 194282);
INSERT into PRESCRIPTION values(641836,258702,431851, 846198);
INSERT into PRESCRIPTION values(876781,210021,431851, 980716);
INSERT into PRESCRIPTION values(671019,134650,431851, 541740);
INSERT into PRESCRIPTION values(598146,712804,431851, 261090);
INSERT into PRESCRIPTION values(346873,872508,431851, 807466);
INSERT into PRESCRIPTION values(143524,928752,431851, 187346);
INSERT into PRESCRIPTION values(564534,528701,431851, 105846);
INSERT into PRESCRIPTION values(143565,598571,431851, 194282);

INSERT into ICU values(518651,4,15.30,'2021-05-12',928788);
INSERT into ICU values(431276,13,29.30,'2021-03-10',210021);


INSERT into WAITING values(7,'Ramesh',23,6843214908,56,'113, 3rd main road, Whitefield',431276);
INSERT into WAITING values(6,'Veena',13,9876351559,71,'134, 2nd main road, Kormangala',109468);
INSERT into WAITING values(6,'Mary',05,8974693524,34,'564, 4th main road, Bilal road',241487);
INSERT into WAITING values(4,'Sufi',14,5418192825,62,'146, 6th main road, Kasturi Nagar',518651);
INSERT into WAITING values(9,'Mani',23,9876541678,45,'12, 3rd main road, Indira Nagar',737863);
INSERT into WAITING values(8,'Hazif',17,6879878624,23,'541, 2nd main road, MG Road',172501);
INSERT into WAITING values(6,'Bhagat',19,7658358627,65,'12, 4th main road, Hosa Road',241487);
INSERT into WAITING values(9,'Shravani',40,6875642583,43,'133, 5th main road, Marathahalli',143806);

--trigger example 1
CREATE OR REPLACE FUNCTION patient_entry() returns TRIGGER as $entry_patient$
BEGIN
INSERT INTO entrylog_patient(h_regno, p_id, entry_date) values(new.h_regno, new.p_id, current_timestamp);
RETURN NEW;
END;
$entry_patient$ LANGUAGE plpgsql;
CREATE TRIGGER patient_enter AFTER INSERT ON PATIENT for EACH ROW EXECUTE PROCEDURE patient_entry();

--trigger example 2
CREATE OR REPLACE FUNCTION doctor_entry() returns TRIGGER as $entry_doctor$
BEGIN
INSERT INTO entrylog_doctor(h_regno, d_id, entry_date) values(new.h_regno, new.d_id, current_timestamp);
RETURN NEW;
END;
$entry_doctor$ LANGUAGE plpgsql;
CREATE TRIGGER doctor_enter AFTER INSERT ON DOCTOR for EACH ROW EXECUTE PROCEDURE doctor_entry();

--trigger example 3
CREATE OR REPLACE FUNCTION new_med() returns TRIGGER as $new_med$
BEGIN
INSERT INTO new_medicines(med_id, med_name, entry_date) values(new.med_id, new.med_name, current_timestamp);
RETURN NEW;
END;
$new_med$ LANGUAGE plpgsql;
CREATE TRIGGER new_med AFTER INSERT ON MEDICINE for EACH ROW EXECUTE PROCEDURE new_med();

--trigger example 4
CREATE OR REPLACE FUNCTION new_hos() returns TRIGGER as $new_hos$
BEGIN
INSERT INTO new_hospital(h_location, h_regno, availability) values(new.h_location, new.h_regno, new.availability);
RETURN NEW;
END;
$new_hos$ LANGUAGE plpgsql;
CREATE TRIGGER new_hos AFTER INSERT ON HOSPITAL for EACH ROW EXECUTE PROCEDURE new_hos();

--inserting values for triggers
INSERT into PATIENT values(241487,211897,'Vijay',47,8712324398,5);
INSERT into DOCTOR values(624473, 'Pruthvi Kumar', 8578272287, 241487);
INSERT into MEDICINE values(145653,'cetirizine');
INSERT into HOSPITAL values('Indira Nagar', 654327, 56);

--queries for outputs after triggers
select * from entrylog_patient;
select * from entrylog_doctor;
select * from new_medicines;
select * from new_hospital;

-- cursor 1
CREATE OR REPLACE FUNCTION patient_list(num INT) 
    returns text as $cursor_1$
declare
    titles text default '';
    list1 record;
    cur_patient cursor(num INT)
    for select p_id,p_name
        from PATIENT
        where p_id=num;
begin
    open cur_patient(num);
    loop
        fetch cur_patient into list1;
        exit when not found;
    titles:=titles || list1.p_id || ' : ' || list1.p_name;
    end loop;
    close cur_patient;
    return titles;
end; $cursor_1$
language plpgsql;

-- cursor 2
CREATE OR REPLACE FUNCTION hospital_avail(num INT) 
    returns text as $cursor_2$
declare
    titles text default '';
    list2 record;
    cur_hospital cursor(num INT)
    for select h_regno, availability
        from HOSPITAL
        where h_regno=num;
begin
    open cur_hospital(num);
    loop
        fetch cur_hospital into list2;
        exit when not found;
    titles:=titles || list2.h_regno || ' : ' || list2.availability;
    end loop;
    close cur_hospital;
    return titles;
end; $cursor_2$
language plpgsql;

-- outputs for 2 cursors
select patient_list(210021);
select hospital_avail(143806);

--simple query 1
select * from patient where h_regno=172501;

--simple query 2
update DOCTOR set d_phone=9876553481 where d_name='Manish Rao';
select * from DOCTOR;

--simple query 3
select SUM(availability) from HOSPITAL;

--simple query 4
select h_regno,p_name,p_phone,p_age from PATIENT where p_id=278248;

--simple query 5
select count(*) from WAITING where severity>=5;

--complex query 1
select PATIENT.p_id, p_name
from PATIENT where h_regno=109468 or h_regno=834781;

--complex query 2
select WAITING.phone_no from WAITING
except(select WAITING.phone_no from WAITING where severity<=5 or age>40);

--complex query 3
select p_name from PATIENT,PRESCRIPTION
where PATIENT.p_id=PRESCRIPTION.p_id
and PRESCRIPTION.med_id=431851 and PRESCRIPTION.d_id=194282;

--complex query 4
select d_name,d_phone from DOCTOR
where h_regno=172501 or h_regno=737863;

--complex query 5
select p_name,p_phone from PATIENT,PRESCRIPTION
where PRESCRIPTION.p_id=PATIENT.p_id union
select p_name,p_phone from PATIENT,PRESCRIPTION
where PRESCRIPTION.med_id=431851;

--user privileges

create user apurva with password 'apurva60' createdb;
create user anjali with password 'anjali47' createdb;
create user anusha with password 'anusha55' createdb;

--error could be shown for the above since it is compiled together

grant all privileges on database "covidhospital" to anjali;
grant update on PRESCRIPTION to anusha;
grant insert on PATIENT to apurva;

revoke update on PRESCRIPTION from anusha;
revoke insert on PATIENT from apurva;



-- transactions

CREATE TABLE accounts (
	h_regno INT,
	p_id INT PRIMARY KEY CHECK(p_id BETWEEN 100000 AND 999999),
	discharge DATE,
	amount NUMERIC(20,2)
);

-- insert in transaction
BEGIN;
INSERT into accounts values(172501,928752,'2021-05-10',100000.56);
INSERT into accounts values(518651,928788,'2021-05-16',245052.94);
INSERT into accounts values(109468,258702,'2021-03-13',65432.56);
INSERT into accounts values(834781,712804,'2021-05-08',16765.56);
COMMIT;

--update in amount in transaction
BEGIN;

UPDATE accounts 
SET amount = amount + 1034.45
WHERE p_id = 712804;


UPDATE accounts
SET discharge = '2021-03-15' WHERE p_id = 928788; 
UPDATE bed_patient
SET out_date = '2021-03-15' WHERE p_id = 928788; 

COMMIT;

--rollback in transactions
BEGIN;
UPDATE accounts SET amount=1000 WHERE p_id=928752;
ROLLBACK;