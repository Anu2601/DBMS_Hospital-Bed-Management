\c covidhospital

INSERT into HOSPITAL values('Ramamurthy Nagar', 431276, 15);
INSERT into HOSPITAL values('Kormangala', 109468, 4);
INSERT into HOSPITAL values('Kammanahalli', 241487, 26);
INSERT into HOSPITAL values('Electronic City', 518651, 10);
INSERT into HOSPITAL values('Sarjapur', 072501, 6);
INSERT into HOSPITAL values('Banshankari', 143806, 11);
INSERT into HOSPITAL values('JP nagar', 834781, 21);
INSERT into HOSPITAL values('Sarjapur', 072501, 6);
INSERT into HOSPITAL values('Kammanahalli', 241487, 26);
INSERT into HOSPITAL values('Ramamurthy Nagar', 431276, 15);
INSERT into HOSPITAL values('Majestic', 737863, 3);

INSERT into DOCTOR values(681473, 'Shrivatsa Sarna', 9087622972, 241487);
INSERT into DOCTOR values(194282, 'Manish Rao', 9814242043, 431276);
INSERT into DOCTOR values(846198, 'Vedanti Krishna', 5949107414, 109468);
INSERT into DOCTOR values(149681, 'Adnan Kalita', 8973471358, 518651);
INSERT into DOCTOR values(980716, 'Prabhat Atwal', 6148038031, 072501);
INSERT into DOCTOR values(261090, 'Janya Garg', 9831551571, 834781);
INSERT into DOCTOR values(541740, 'Nakul Krishnamurthy', 9874376177, 143806);
INSERT into DOCTOR values(807466, 'Dhruv Andra', 9908787321, 737863);
INSERT into DOCTOR values(087346, 'Lata Deep', 9838477317, 072501);
INSERT into DOCTOR values(105846, 'Akanksha Narayanan', 9875102875, 241487);
INSERT into DOCTOR values(194282, 'Manish Rao', 9814242043, 431276);


INSERT into DIAGNOSIS values(99,'yes','yes','yes',87, 194282,210021);
INSERT into DIAGNOSIS values(98,'yes','no','yes',92, 846198,258702);
INSERT into DIAGNOSIS values(97,'no','no','no',96, 681473,078248);
INSERT into DIAGNOSIS values(NULL,'no','yes','no',90, 149681,928788);
INSERT into DIAGNOSIS values(99,'no','no','yes',95, 541740,134650);
INSERT into DIAGNOSIS values(98,'no','yes','yes',97, 980716,212897);
INSERT into DIAGNOSIS values(100,'yes','yes','yes',91, 261090,712804);
INSERT into DIAGNOSIS values(97,'no','no','yes',96, 807466,872508);
INSERT into DIAGNOSIS values(99,'yes','yes','yes',89, 087346,928752);
INSERT into DIAGNOSIS values(97,'no','no','yes',95, 105846,528701);
INSERT into DIAGNOSIS values(98,'no','yes','yes',95, 087346,098571);


INSERT into BED_PATIENT values(072501,'2021-05-03','2021-05-10', 928752,056);
INSERT into BED_PATIENT values(241487,'2021-05-13','2021-03-17', 528701,401);
INSERT into BED_PATIENT values(431276,'2021-04-11','2021-04-21', 098571,1345);
INSERT into BED_PATIENT values(431276,'2021-03-12','2021-03-16', 210021,1345);
INSERT into BED_PATIENT values(109468,'2021-03-10','2021-03-13', 258702,119);
INSERT into BED_PATIENT values(241487,'2021-04-03','2021-04-05', 078248,401);
INSERT into BED_PATIENT values(518651,'2021-05-12','2021-05-16', 928788,121);
INSERT into BED_PATIENT values(143806,'2021-04-15','2021-04-21', 134650,106);
INSERT into BED_PATIENT values(072501,'2021-03-07','2021-03-17', 212897,056);
INSERT into BED_PATIENT values(737863,'2021-04-11','2021-04-19', 872508,145);
INSERT into BED_PATIENT values(834781,'2021-05-02','2021-05-08', 712804,215);


INSERT into MEDICINE values(075653,'thrombolysis');
INSERT into MEDICINE values(016171,'ibuprofen');
INSERT into MEDICINE values(031851,'remdesvir');


INSERT into BED values(241487,401,7);
INSERT into BED values(518651,3,11);
INSERT into BED values(431276,1345,10);
INSERT into BED values(109468,119,4);
INSERT into BED values(072501,056,11);
INSERT into BED values(143806,106,9);
INSERT into BED values(737863,145,10);
INSERT into BED values(834781,215,4);
INSERT into BED values(072501,056,3);
INSERT into BED values(241487,401,19);
INSERT into BED values(431276,1345,5);


INSERT into PRESCRIPTION values(210044,078248,016171, 681473);
INSERT into PRESCRIPTION values(134980,928788,075653, 194282);
INSERT into PRESCRIPTION values(086166,210021,031851, 194282);
INSERT into PRESCRIPTION values(641836,258702,031851, 846198);
INSERT into PRESCRIPTION values(876781,210021,031851, 980716);
INSERT into PRESCRIPTION values(671019,134650,031851, 541740);
INSERT into PRESCRIPTION values(598146,712804,031851, 261090);
INSERT into PRESCRIPTION values(346873,872508,031851, 807466);
INSERT into PRESCRIPTION values(143524,928752,031851, 087346);
INSERT into PRESCRIPTION values(564534,528701,031851, 105846);
INSERT into PRESCRIPTION values(143565,098571,031851, 194282);

INSERT into ICU values(518651,4,15.3,'2021-05-12',928788);
INSERT into ICU values(431276, 13,'2021-03-10',29.3,210021);

INSERT into PATIENT values(072501,212897,'Arathi',51,8712324598,2);
INSERT into PATIENT values(143806,134650,'Vasu',27,7203756142,9);
INSERT into PATIENT values(834781,712804,'Vishal',27,7203756142,10);
INSERT into PATIENT values(241487,078248,'Parushuram',43,8765121278,8);
INSERT into PATIENT values(518651,928788,'Hamsa',38,9786584268,2);
INSERT into PATIENT values(431276,210021,'Satish',37,7203756142,8);
INSERT into PATIENT values(109468,258702,'Veena',29,4870922531,3);
INSERT into PATIENT values(737863,872508,'Satish',37,7203756142,8);
INSERT into PATIENT values(072501,928752,'Satish',37,7203756142,8);
INSERT into PATIENT values(241487,528701,'Satish',37,7203756142,8);
INSERT into PATIENT values(431276,098571,'Satish',37,7203756142,8);

INSERT into WAITING values(7,'Ramesh',23,6843214908,56,'113, 3rd main road, Whitefield',431276);
INSERT into WAITING values(6,'Veena',13,9876351559,71,'134, 2nd main road, Kormangala',109468);
INSERT into WAITING values(6,'Mary',05,8974693524,34,'564, 4th main road, Bilal road',241487);
INSERT into WAITING values(4,'Sufi',14,5418192825,62,'146, 6th main road, Kasturi Nagar',518651);
INSERT into WAITING values(9,'Mani',23,9876541678,45,'12, 3rd main road, Indira Nagar',737863);
INSERT into WAITING values(8,'Hazif',17,6879878624,23,'541, 2nd main road, MG Road',072501);
INSERT into WAITING values(6,'Bhagat',19,7658358627,65,'12, 4th main road, Hosa Road',241487);
INSERT into WAITING values(9,'Shravani',40,6875642583,43,'133, 5th main road, Marathahalli',143806);














