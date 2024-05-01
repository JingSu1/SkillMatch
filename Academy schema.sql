DROP TABLE IF EXISTS streams;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS streams_courses;
DROP TABLE IF EXISTS trainees;
DROP TABLE IF EXISTS exam_results;
DROP TABLE IF EXISTS academies;
DROP TABLE IF EXISTS trainers;
DROP TABLE IF EXISTS trainers_courses;


CREATE TABLE streams
(
stream_id INT PRIMARY KEY,
name VARCHAR(30),
duration_weeks INT
);


CREATE TABLE courses
(
course_id INT PRIMARY KEY,
name VARCHAR(30),
duration_days INT
);


CREATE TABLE streams_courses
(
stream_id INT,
course_id INT,
CONSTRAINT streams_courses_pk PRIMARY KEY(stream_id, course_id),
CONSTRAINT stream_id_fk FOREIGN KEY(stream_id) REFERENCES streams(stream_id),
CONSTRAINT course_id_fk FOREIGN KEY(course_id) REFERENCES courses(course_id)
);


CREATE TABLE academies
(
academy_id  INT PRIMARY KEY,
city        VARCHAR(20),
address     VARCHAR(100)
);

CREATE TABLE trainees
(
trainee_id INT PRIMARY KEY,
name VARCHAR(50),
stream_id INT,
start_date DATE,
academy_id INT,
CONSTRAINT trainee_stream_fk FOREIGN KEY(stream_id) REFERENCES streams(stream_id),
CONSTRAINT trainee_academy_fk FOREIGN KEY(academy_id) REFERENCES academies(academy_id)
);


CREATE TABLE exam_results
(
trainee_id INT,
course_id INT,
exam_date DATE,
score INT,
CONSTRAINT exam_pk PRIMARY KEY (trainee_id, course_id, exam_date),
CONSTRAINT exam_trainee_id FOREIGN KEY (trainee_id) REFERENCES trainees(trainee_id),
CONSTRAINT exam_course_id FOREIGN KEY (course_id) REFERENCES courses(course_id)
);


CREATE TABLE trainers
(
trainer_id INT PRIMARY KEY,
name      VARCHAR(40),
start_date  DATE,
academy_id INT,
CONSTRAINT trainer_academy_fk FOREIGN KEY (academy_id) REFERENCES academies(academy_id)
);

CREATE TABLE trainers_courses
(
trainer_id INT,
course_id  INT,
CONSTRAINT trainer_course_pk PRIMARY KEY (trainer_id, course_id),
CONSTRAINT trainer_course_fk1 FOREIGN KEY (trainer_id) REFERENCES trainers(trainer_id),
CONSTRAINT trainer_course_fk2 FOREIGN KEY (course_id) REFERENCES courses(course_id)
);



INSERT INTO academies VALUES (1,'London','Cottons Centre, Cottons Ln, London SE1 2QG, United Kingdom');
INSERT INTO academies VALUES (2,'Manchester','Westminster House, 11 Portland St, Manchester M1 3HU, United Kingdom');
INSERT INTO academies VALUES (3,'Frankfurt','Mainzer Landstraße 41, 60329 Frankfurt, Germany');

INSERT INTO streams VALUES (1,'PMO',9);
INSERT INTO streams VALUES (2,'Data Analyst',6);
INSERT INTO streams VALUES (3,'Application Support',11);
INSERT INTO streams VALUES (4,'Testing',8);
INSERT INTO streams VALUES (5,'Development',14);

INSERT INTO trainees VALUES (1,'Roni Whitney',1,date_add(curdate(), interval -99 day),1);
INSERT INTO trainees VALUES (2,'Shanti Gould',1,date_add(curdate(), interval -98 day),1);
INSERT INTO trainees VALUES (3,'Antonina Wilbanks',2,date_add(curdate(), interval -98 day),1);
INSERT INTO trainees VALUES (4,'Sophia Hartwig',2,date_add(curdate(), interval -96 day),3);
INSERT INTO trainees VALUES (5,'Josef Krumrey',5,date_add(curdate(), interval -94 day),3);
INSERT INTO trainees VALUES (6,'Marko Schmucker',2,date_add(curdate(), interval -90 day),3);
INSERT INTO trainees VALUES (7,'Traute Seifert',2,date_add(curdate(), interval -85 day),3);
INSERT INTO trainees VALUES (8,'Nidia Dowd',3,date_add(curdate(), interval -84 day),2);
INSERT INTO trainees VALUES (9,'Thurman Wing',1,date_add(curdate(), interval -83 day),2);
INSERT INTO trainees VALUES (10,'Ima Quinonez',2,date_add(curdate(), interval -83 day),2);
INSERT INTO trainees VALUES (11,'Rosanne Marino',1,date_add(curdate(), interval -81 day),1);
INSERT INTO trainees VALUES (12,'Bharadwaj Santhanakrishnan',2,date_add(curdate(), interval -80 day),1);
INSERT INTO trainees VALUES (13,'Sumathi Sahar',1,date_add(curdate(), interval -80 day),1);
INSERT INTO trainees VALUES (14,'Zachariah Acevedo',4,date_add(curdate(), interval -79 day),1);
INSERT INTO trainees VALUES (15,'Salina Blakely',5,date_add(curdate(), interval -77 day),1);
INSERT INTO trainees VALUES (16,'Sri Munish',2,date_add(curdate(), interval -73 day),1);
INSERT INTO trainees VALUES (17,'Giuseppe Rosas',2,date_add(curdate(), interval -68 day),1);
INSERT INTO trainees VALUES (18,'Marry Roland',1,date_add(curdate(), interval -67 day),1);
INSERT INTO trainees VALUES (19,'Leighann Oldham',4,date_add(curdate(), interval -65 day),1);
INSERT INTO trainees VALUES (20,'Amati Jinen',5,date_add(curdate(), interval -64 day),1);
INSERT INTO trainees VALUES (21,'Nydia Mcwilliams',1,date_add(curdate(), interval -64 day),1);
INSERT INTO trainees VALUES (22,'Brianna Leavitt',2,date_add(curdate(), interval -61 day),1);
INSERT INTO trainees VALUES (23,'Lannie Handley',3,date_add(curdate(), interval -59 day),1);
INSERT INTO trainees VALUES (24,'Devorah Kahn',1,date_add(curdate(), interval -55 day),1);
INSERT INTO trainees VALUES (25,'Buck Bonilla',5,date_add(curdate(), interval -54 day),1);
INSERT INTO trainees VALUES (26,'James Ritter',1,date_add(curdate(), interval -54 day),1);
INSERT INTO trainees VALUES (27,'Tifany Fite',2,date_add(curdate(), interval -53 day),1);
INSERT INTO trainees VALUES (28,'Hana Treadwell',3,date_add(curdate(), interval -52 day),1);
INSERT INTO trainees VALUES (29,'Abbie Byrnes',1,date_add(curdate(), interval -52 day),1);
INSERT INTO trainees VALUES (30,'Ashlea Nowak',5,date_add(curdate(), interval -50 day),1);
INSERT INTO trainees VALUES (31,'Annett Roden',1,date_add(curdate(), interval -50 day),1);
INSERT INTO trainees VALUES (32,'Sibongile Toure',2,date_add(curdate(), interval -48 day),1);
INSERT INTO trainees VALUES (33,'Daina Aviles',3,date_add(curdate(), interval -46 day),1);
INSERT INTO trainees VALUES (34,'Bettie Vickery',4,date_add(curdate(), interval -45 day),1);
INSERT INTO trainees VALUES (35,'Reinhold Blech',1,date_add(curdate(), interval -42 day),3); 
INSERT INTO trainees VALUES (36,'Thies Güntzler',2,date_add(curdate(), interval -39 day),3); 
INSERT INTO trainees VALUES (37,'Stefan Gildehaus',3,date_add(curdate(), interval -38 day),3); 
INSERT INTO trainees VALUES (38,'Syble Bivins',2,date_add(curdate(), interval -38 day),1);
INSERT INTO trainees VALUES (39,'Hallie Hawks',4,date_add(curdate(), interval -34 day),1);
INSERT INTO trainees VALUES (40,'Mariette Kirk',1,date_add(curdate(), interval -33 day),1);
INSERT INTO trainees VALUES (41,'Serwa Ndiaye',1,date_add(curdate(), interval -31 day),1);
INSERT INTO trainees VALUES (42,'Leslee Laird',2,date_add(curdate(), interval -31 day),1);
INSERT INTO trainees VALUES (43,'Femi Bah',3,date_add(curdate(), interval -30 day),1);
INSERT INTO trainees VALUES (44,'Fay Quezada',2,date_add(curdate(), interval -30 day),1);
INSERT INTO trainees VALUES (45,'Bud Hardesty',1,date_add(curdate(), interval -28 day),1);
INSERT INTO trainees VALUES (46,'Cliff Marble',1,date_add(curdate(), interval -28 day),2);
INSERT INTO trainees VALUES (47,'Dannielle Sapp',2,date_add(curdate(), interval -25 day),2);
INSERT INTO trainees VALUES (48,'Celinda Valencia',2,date_add(curdate(), interval -23 day),2);
INSERT INTO trainees VALUES (49,'Tawanda Tinsley',1,date_add(curdate(), interval -22 day),2);
INSERT INTO trainees VALUES (50,'Tarah Shay',5,date_add(curdate(), interval -22 day),2);
INSERT INTO trainees VALUES (51,'Rosanne Funk',1,date_add(curdate(), interval -21 day),2);
INSERT INTO trainees VALUES (52,'Harley Littlejohn',2,date_add(curdate(), interval -19 day),2);
INSERT INTO trainees VALUES (53,'Albina Mclaurin',2,date_add(curdate(), interval -18 day),2);
INSERT INTO trainees VALUES (54,'Meda Layne',1,date_add(curdate(), interval -18 day),2);
INSERT INTO trainees VALUES (55,'Lilian Denning',5,date_add(curdate(), interval -12 day),2);
INSERT INTO trainees VALUES (56,'Callie Sheldon',1,date_add(curdate(), interval -8 day),2);
INSERT INTO trainees VALUES (57,'Bernarda Labbe',2,date_add(curdate(), interval -5 day),2);
INSERT INTO trainees VALUES (58,'Margarete Empting',3,date_add(curdate(), interval -3 day),3);  
INSERT INTO trainees VALUES (59,'Lidia Jung',4,date_add(curdate(), interval -2 day),3);  
INSERT INTO trainees VALUES (60,'Markus Rebohle',2,date_add(curdate(), interval -1 day),3);


INSERT INTO trainers VALUES (1,'Edmund Blair',date_add(curdate(), interval -772 day),1);
INSERT INTO trainers VALUES (2,'Sherman Brown',date_add(curdate(), interval -978 day),1);
INSERT INTO trainers VALUES (3,'Arthur Santiago',date_add(curdate(), interval -1022 day),1);
INSERT INTO trainers VALUES (4,'Ted Waters',date_add(curdate(), interval -287 day),1);
INSERT INTO trainers VALUES (5,'Patrick Carroll',date_add(curdate(), interval -594 day),1);
INSERT INTO trainers VALUES (6,'Cecil Griffin',date_add(curdate(), interval -242 day),1);
INSERT INTO trainers VALUES (7,'Jessica Owens',date_add(curdate(), interval -625 day),1);
INSERT INTO trainers VALUES (8,'Alfonso Valdez',date_add(curdate(), interval -317 day),1);
INSERT INTO trainers VALUES (9,'Lamar Carson',date_add(curdate(), interval -1137 day),1);
INSERT INTO trainers VALUES (10,'Scott Robbins',date_add(curdate(), interval -698 day),1);
INSERT INTO trainers VALUES (11,'Connie Douglas',date_add(curdate(), interval -687 day),2);
INSERT INTO trainers VALUES (12,'Myrtle Wolfe',date_add(curdate(), interval -627 day),2);
INSERT INTO trainers VALUES (13,'Maureen Franklin',date_add(curdate(), interval -457 day),2);
INSERT INTO trainers VALUES (14,'Cedric Houston',date_add(curdate(), interval -994 day),2);
INSERT INTO trainers VALUES (15,'Vivian Lambert',date_add(curdate(), interval -611 day),2);
INSERT INTO trainers VALUES (16,'Alexander Krenz',date_add(curdate(), interval -855 day),3);
INSERT INTO trainers VALUES (17,'Elke Manteuffel',date_add(curdate(), interval -350 day),3);


INSERT INTO courses VALUES (1,'FIA',5);
INSERT INTO courses VALUES (2,'SQL',5);
INSERT INTO courses VALUES (3,'UNIX',5);
INSERT INTO courses VALUES (4,'Excel VBA',5);
INSERT INTO courses VALUES (5,'Web Applications',5);
INSERT INTO courses VALUES (6,'Manual Testing',5);
INSERT INTO courses VALUES (7,'PSO',5);
INSERT INTO courses VALUES (8,'Common Development',5);
INSERT INTO courses VALUES (9,'Communication Skills',3);
INSERT INTO courses VALUES (10,'PRINCE 2',5);
INSERT INTO courses VALUES (11,'BA',5);
INSERT INTO courses VALUES (12,'Agile Testing',1);
INSERT INTO courses VALUES (13,'ISTQB ISEB',5);


INSERT INTO streams_courses VALUES (1,1);
INSERT INTO streams_courses VALUES (2,1);
INSERT INTO streams_courses VALUES (3,1);
INSERT INTO streams_courses VALUES (1,2);
INSERT INTO streams_courses VALUES (2,2);
INSERT INTO streams_courses VALUES (3,2);
INSERT INTO streams_courses VALUES (4,2);
INSERT INTO streams_courses VALUES (5,2);
INSERT INTO streams_courses VALUES (3,3);
INSERT INTO streams_courses VALUES (4,3);
INSERT INTO streams_courses VALUES (5,3);
INSERT INTO streams_courses VALUES (1,4);
INSERT INTO streams_courses VALUES (2,4);
INSERT INTO streams_courses VALUES (3,4);
INSERT INTO streams_courses VALUES (4,4);
INSERT INTO streams_courses VALUES (5,4);
INSERT INTO streams_courses VALUES (3,5);
INSERT INTO streams_courses VALUES (4,5);
INSERT INTO streams_courses VALUES (4,6);
INSERT INTO streams_courses VALUES (1,7);
INSERT INTO streams_courses VALUES (5,8);
INSERT INTO streams_courses VALUES (1,9);
INSERT INTO streams_courses VALUES (2,9);
INSERT INTO streams_courses VALUES (3,9);
INSERT INTO streams_courses VALUES (4,9);
INSERT INTO streams_courses VALUES (5,9);
INSERT INTO streams_courses VALUES (1,10);
INSERT INTO streams_courses VALUES (1,11);
INSERT INTO streams_courses VALUES (4,12);
INSERT INTO streams_courses VALUES (4,13);


INSERT INTO trainers_courses VALUES (1,1);
INSERT INTO trainers_courses VALUES (1,2);
INSERT INTO trainers_courses VALUES (1,3);
INSERT INTO trainers_courses VALUES (2,2);
INSERT INTO trainers_courses VALUES (2,3);
INSERT INTO trainers_courses VALUES (3,6);
INSERT INTO trainers_courses VALUES (3,12);
INSERT INTO trainers_courses VALUES (3,13);
INSERT INTO trainers_courses VALUES (3,3);
INSERT INTO trainers_courses VALUES (4,7);
INSERT INTO trainers_courses VALUES (4,9);
INSERT INTO trainers_courses VALUES (4,11);
INSERT INTO trainers_courses VALUES (4,10);
INSERT INTO trainers_courses VALUES (5,9);
INSERT INTO trainers_courses VALUES (6,8);
INSERT INTO trainers_courses VALUES (6,5);
INSERT INTO trainers_courses VALUES (7,1);
INSERT INTO trainers_courses VALUES (7,2);
INSERT INTO trainers_courses VALUES (8,5);
INSERT INTO trainers_courses VALUES (8,8);
INSERT INTO trainers_courses VALUES (9,7);
INSERT INTO trainers_courses VALUES (9,11);
INSERT INTO trainers_courses VALUES (10,2);
INSERT INTO trainers_courses VALUES (10,3);
INSERT INTO trainers_courses VALUES (11,2);
INSERT INTO trainers_courses VALUES (11,3);
INSERT INTO trainers_courses VALUES (11,9);
INSERT INTO trainers_courses VALUES (12,1);
INSERT INTO trainers_courses VALUES (12,4);
INSERT INTO trainers_courses VALUES (12,5);
INSERT INTO trainers_courses VALUES (13,7);
INSERT INTO trainers_courses VALUES (13,9);
INSERT INTO trainers_courses VALUES (13,10);
INSERT INTO trainers_courses VALUES (13,11);
INSERT INTO trainers_courses VALUES (14,12);
INSERT INTO trainers_courses VALUES (14,13);
INSERT INTO trainers_courses VALUES (15,7);
INSERT INTO trainers_courses VALUES (16,7);
INSERT INTO trainers_courses VALUES (16,2);
INSERT INTO trainers_courses VALUES (16,3);
INSERT INTO trainers_courses VALUES (16,5);
INSERT INTO trainers_courses VALUES (17,6);
INSERT INTO trainers_courses VALUES (17,9);
INSERT INTO trainers_courses VALUES (17,2);

INSERT INTO exam_results VALUES (1,1,date_add(curdate(), interval -54 day),36);
INSERT INTO exam_results VALUES (1,1,date_add(curdate(), interval -42 day),65);
INSERT INTO exam_results VALUES (1,1,date_add(curdate(), interval -35 day),94);
INSERT INTO exam_results VALUES (1,2,date_add(curdate(), interval -40 day),88);
INSERT INTO exam_results VALUES (1,2,date_add(curdate(), interval -30 day),80);
INSERT INTO exam_results VALUES (1,4,date_add(curdate(), interval -56 day),82);
INSERT INTO exam_results VALUES (1,7,date_add(curdate(), interval -27 day),96);
INSERT INTO exam_results VALUES (1,9,date_add(curdate(), interval -52 day),85);
INSERT INTO exam_results VALUES (1,10,date_add(curdate(), interval -14 day),88);
INSERT INTO exam_results VALUES (1,11,date_add(curdate(), interval -14 day),78);
INSERT INTO exam_results VALUES (2,1,date_add(curdate(), interval -11 day),76);
INSERT INTO exam_results VALUES (2,2,date_add(curdate(), interval -29 day),76);
INSERT INTO exam_results VALUES (2,4,date_add(curdate(), interval -17 day),88);
INSERT INTO exam_results VALUES (2,7,date_add(curdate(), interval -24 day),82);
INSERT INTO exam_results VALUES (2,9,date_add(curdate(), interval -58 day),99);
INSERT INTO exam_results VALUES (2,10,date_add(curdate(), interval -24 day),95);
INSERT INTO exam_results VALUES (2,11,date_add(curdate(), interval -29 day),89);
INSERT INTO exam_results VALUES (3,1,date_add(curdate(), interval -21 day),83);
INSERT INTO exam_results VALUES (3,2,date_add(curdate(), interval -10 day),84);
INSERT INTO exam_results VALUES (3,4,date_add(curdate(), interval -45 day),79);
INSERT INTO exam_results VALUES (3,9,date_add(curdate(), interval -49 day),77);
INSERT INTO exam_results VALUES (4,1,date_add(curdate(), interval -30 day),75);
INSERT INTO exam_results VALUES (4,2,date_add(curdate(), interval -60 day),86);
INSERT INTO exam_results VALUES (4,4,date_add(curdate(), interval -40 day),81);
INSERT INTO exam_results VALUES (4,9,date_add(curdate(), interval -22 day),96);
INSERT INTO exam_results VALUES (5,2,date_add(curdate(), interval -47 day),57);
INSERT INTO exam_results VALUES (5,2,date_add(curdate(), interval -40 day),74);
INSERT INTO exam_results VALUES (5,2,date_add(curdate(), interval -36 day),98);
INSERT INTO exam_results VALUES (5,3,date_add(curdate(), interval -54 day),76);
INSERT INTO exam_results VALUES (5,4,date_add(curdate(), interval -13 day),77);
INSERT INTO exam_results VALUES (5,8,date_add(curdate(), interval -43 day),70);
INSERT INTO exam_results VALUES (5,8,date_add(curdate(), interval -30 day),80);
INSERT INTO exam_results VALUES (5,9,date_add(curdate(), interval -25 day),97);
INSERT INTO exam_results VALUES (6,1,date_add(curdate(), interval -24 day),94);
INSERT INTO exam_results VALUES (6,2,date_add(curdate(), interval -52 day),78);
INSERT INTO exam_results VALUES (6,4,date_add(curdate(), interval -41 day),76);
INSERT INTO exam_results VALUES (6,9,date_add(curdate(), interval -28 day),83);
INSERT INTO exam_results VALUES (7,1,date_add(curdate(), interval -28 day),98);
INSERT INTO exam_results VALUES (7,2,date_add(curdate(), interval -55 day),90);
INSERT INTO exam_results VALUES (7,4,date_add(curdate(), interval -37 day),99);
INSERT INTO exam_results VALUES (7,9,date_add(curdate(), interval -25 day),98);
INSERT INTO exam_results VALUES (8,1,date_add(curdate(), interval -42 day),85);
INSERT INTO exam_results VALUES (8,2,date_add(curdate(), interval -11 day),86);
INSERT INTO exam_results VALUES (8,3,date_add(curdate(), interval -54 day),75);
INSERT INTO exam_results VALUES (8,4,date_add(curdate(), interval -58 day),82);
INSERT INTO exam_results VALUES (8,5,date_add(curdate(), interval -26 day),91);
INSERT INTO exam_results VALUES (8,9,date_add(curdate(), interval -56 day),94);
INSERT INTO exam_results VALUES (9,1,date_add(curdate(), interval -53 day),81);
INSERT INTO exam_results VALUES (9,2,date_add(curdate(), interval -12 day),82);
INSERT INTO exam_results VALUES (9,4,date_add(curdate(), interval -25 day),92);
INSERT INTO exam_results VALUES (9,7,date_add(curdate(), interval -30 day),81);
INSERT INTO exam_results VALUES (9,9,date_add(curdate(), interval -60 day),89);
INSERT INTO exam_results VALUES (9,9,date_add(curdate(), interval -42 day),86);
INSERT INTO exam_results VALUES (9,10,date_add(curdate(), interval -31 day),90);
INSERT INTO exam_results VALUES (9,11,date_add(curdate(), interval -30 day),82);
INSERT INTO exam_results VALUES (10,1,date_add(curdate(), interval -24 day),86);
INSERT INTO exam_results VALUES (10,2,date_add(curdate(), interval -10 day),98);
INSERT INTO exam_results VALUES (10,4,date_add(curdate(), interval -53 day),92);
INSERT INTO exam_results VALUES (10,9,date_add(curdate(), interval -42 day),93);
INSERT INTO exam_results VALUES (11,1,date_add(curdate(), interval -58 day),77);
INSERT INTO exam_results VALUES (11,2,date_add(curdate(), interval -10 day),91);
INSERT INTO exam_results VALUES (11,4,date_add(curdate(), interval -16 day),96);
INSERT INTO exam_results VALUES (11,7,date_add(curdate(), interval -36 day),75);
INSERT INTO exam_results VALUES (11,9,date_add(curdate(), interval -55 day),96);
INSERT INTO exam_results VALUES (11,10,date_add(curdate(), interval -18 day),77);
INSERT INTO exam_results VALUES (11,11,date_add(curdate(), interval -27 day),75);
INSERT INTO exam_results VALUES (12,1,date_add(curdate(), interval -53 day),89);
INSERT INTO exam_results VALUES (12,2,date_add(curdate(), interval -39 day),100);
INSERT INTO exam_results VALUES (12,4,date_add(curdate(), interval -46 day),98);
INSERT INTO exam_results VALUES (12,9,date_add(curdate(), interval -45 day),87);
INSERT INTO exam_results VALUES (13,1,date_add(curdate(), interval -28 day),86);
INSERT INTO exam_results VALUES (13,2,date_add(curdate(), interval -23 day),90);
INSERT INTO exam_results VALUES (13,4,date_add(curdate(), interval -10 day),85);
INSERT INTO exam_results VALUES (13,7,date_add(curdate(), interval -41 day),76);
INSERT INTO exam_results VALUES (13,9,date_add(curdate(), interval -20 day),92);
INSERT INTO exam_results VALUES (13,10,date_add(curdate(), interval -49 day),78);
INSERT INTO exam_results VALUES (13,11,date_add(curdate(), interval -10 day),75);
INSERT INTO exam_results VALUES (14,2,date_add(curdate(), interval -4 day),98);
INSERT INTO exam_results VALUES (14,3,date_add(curdate(), interval -28 day),88);
INSERT INTO exam_results VALUES (14,4,date_add(curdate(), interval -45 day),80);
INSERT INTO exam_results VALUES (14,5,date_add(curdate(), interval -46 day),50);
INSERT INTO exam_results VALUES (14,5,date_add(curdate(), interval -41 day),35);
INSERT INTO exam_results VALUES (14,5,date_add(curdate(), interval -34 day),28);
INSERT INTO exam_results VALUES (14,6,date_add(curdate(), interval -32 day),75);
INSERT INTO exam_results VALUES (14,9,date_add(curdate(), interval -36 day),84);
INSERT INTO exam_results VALUES (14,12,date_add(curdate(), interval -12 day),94);
INSERT INTO exam_results VALUES (14,13,date_add(curdate(), interval -16 day),86);
INSERT INTO exam_results VALUES (15,2,date_add(curdate(), interval -17 day),85);
INSERT INTO exam_results VALUES (15,3,date_add(curdate(), interval -2 day),80);
INSERT INTO exam_results VALUES (15,3,date_add(curdate(), interval -10 day),72);
INSERT INTO exam_results VALUES (15,4,date_add(curdate(), interval -48 day),78);
INSERT INTO exam_results VALUES (15,8,date_add(curdate(), interval -46 day),78);
INSERT INTO exam_results VALUES (15,9,date_add(curdate(), interval -5 day),96);
INSERT INTO exam_results VALUES (16,1,date_add(curdate(), interval -42 day),78);
INSERT INTO exam_results VALUES (16,2,date_add(curdate(), interval -19 day),95);
INSERT INTO exam_results VALUES (16,4,date_add(curdate(), interval -40 day),93);
INSERT INTO exam_results VALUES (16,9,date_add(curdate(), interval -30 day),81);
INSERT INTO exam_results VALUES (17,1,date_add(curdate(), interval -31 day),99);
INSERT INTO exam_results VALUES (17,2,date_add(curdate(), interval -43 day),80);
INSERT INTO exam_results VALUES (17,4,date_add(curdate(), interval -47 day),84);
INSERT INTO exam_results VALUES (17,9,date_add(curdate(), interval -41 day),87);
INSERT INTO exam_results VALUES (18,1,date_add(curdate(), interval -11 day),78);
INSERT INTO exam_results VALUES (18,2,date_add(curdate(), interval -15 day),97);
INSERT INTO exam_results VALUES (18,4,date_add(curdate(), interval -28 day),81);
INSERT INTO exam_results VALUES (18,7,date_add(curdate(), interval -3 day),88);
INSERT INTO exam_results VALUES (18,9,date_add(curdate(), interval -8 day),98);
INSERT INTO exam_results VALUES (18,10,date_add(curdate(), interval -34 day),85);
INSERT INTO exam_results VALUES (18,11,date_add(curdate(), interval -14 day),97);
INSERT INTO exam_results VALUES (19,2,date_add(curdate(), interval -38 day),75);
INSERT INTO exam_results VALUES (19,3,date_add(curdate(), interval -45 day),69);
INSERT INTO exam_results VALUES (19,3,date_add(curdate(), interval -37 day),72);
INSERT INTO exam_results VALUES (19,3,date_add(curdate(), interval -30 day),83);
INSERT INTO exam_results VALUES (19,4,date_add(curdate(), interval -33 day),86);
INSERT INTO exam_results VALUES (19,5,date_add(curdate(), interval -45 day),84);
INSERT INTO exam_results VALUES (19,6,date_add(curdate(), interval -22 day),77);
INSERT INTO exam_results VALUES (19,9,date_add(curdate(), interval -34 day),86);
INSERT INTO exam_results VALUES (19,12,date_add(curdate(), interval -12 day),90);
INSERT INTO exam_results VALUES (19,13,date_add(curdate(), interval -2 day),91);
INSERT INTO exam_results VALUES (20,2,date_add(curdate(), interval -35 day),95);
INSERT INTO exam_results VALUES (20,3,date_add(curdate(), interval -6 day),78);
INSERT INTO exam_results VALUES (20,4,date_add(curdate(), interval -32 day),98);
INSERT INTO exam_results VALUES (20,8,date_add(curdate(), interval -21 day),79);
INSERT INTO exam_results VALUES (20,9,date_add(curdate(), interval -17 day),99);
INSERT INTO exam_results VALUES (21,1,date_add(curdate(), interval -3 day),85);
INSERT INTO exam_results VALUES (21,2,date_add(curdate(), interval -23 day),76);
INSERT INTO exam_results VALUES (21,4,date_add(curdate(), interval -2 day),96);
INSERT INTO exam_results VALUES (21,7,date_add(curdate(), interval -34 day),77);
INSERT INTO exam_results VALUES (21,9,date_add(curdate(), interval -26 day),99);
INSERT INTO exam_results VALUES (21,10,date_add(curdate(), interval -14 day),80);
INSERT INTO exam_results VALUES (21,11,date_add(curdate(), interval -43 day),61);
INSERT INTO exam_results VALUES (21,11,date_add(curdate(), interval -38 day),86);
INSERT INTO exam_results VALUES (22,1,date_add(curdate(), interval -4 day),82);
INSERT INTO exam_results VALUES (22,2,date_add(curdate(), interval -38 day),88);
INSERT INTO exam_results VALUES (22,4,date_add(curdate(), interval -9 day),91);
INSERT INTO exam_results VALUES (22,9,date_add(curdate(), interval -15 day),77);
INSERT INTO exam_results VALUES (23,1,date_add(curdate(), interval -12 day),92);
INSERT INTO exam_results VALUES (23,2,date_add(curdate(), interval -41 day),88);
INSERT INTO exam_results VALUES (23,3,date_add(curdate(), interval -43 day),20);
INSERT INTO exam_results VALUES (23,3,date_add(curdate(), interval -35 day),36);
INSERT INTO exam_results VALUES (23,3,date_add(curdate(), interval -30 day),47);
INSERT INTO exam_results VALUES (23,4,date_add(curdate(), interval -44 day),77);
INSERT INTO exam_results VALUES (23,5,date_add(curdate(), interval -30 day),80);
INSERT INTO exam_results VALUES (23,9,date_add(curdate(), interval -14 day),91);
INSERT INTO exam_results VALUES (24,1,date_add(curdate(), interval -43 day),79);
INSERT INTO exam_results VALUES (24,2,date_add(curdate(), interval -42 day),90);
INSERT INTO exam_results VALUES (24,4,date_add(curdate(), interval -2 day),86);
INSERT INTO exam_results VALUES (24,7,date_add(curdate(), interval -19 day),90);
INSERT INTO exam_results VALUES (24,9,date_add(curdate(), interval -13 day),87);
INSERT INTO exam_results VALUES (24,10,date_add(curdate(), interval -9 day),78);
INSERT INTO exam_results VALUES (24,11,date_add(curdate(), interval -13 day),77);
INSERT INTO exam_results VALUES (25,2,date_add(curdate(), interval -44 day),45);
INSERT INTO exam_results VALUES (25,2,date_add(curdate(), interval -40 day),57);
INSERT INTO exam_results VALUES (25,2,date_add(curdate(), interval -34 day),68);
INSERT INTO exam_results VALUES (25,3,date_add(curdate(), interval -40 day),17);
INSERT INTO exam_results VALUES (25,3,date_add(curdate(), interval -35 day),35);
INSERT INTO exam_results VALUES (25,3,date_add(curdate(), interval -31 day),51);
INSERT INTO exam_results VALUES (25,4,date_add(curdate(), interval -23 day),12);
INSERT INTO exam_results VALUES (25,4,date_add(curdate(), interval -17 day),34);
INSERT INTO exam_results VALUES (25,4,date_add(curdate(), interval -12 day),44);
INSERT INTO exam_results VALUES (25,8,date_add(curdate(), interval -22 day),85);
INSERT INTO exam_results VALUES (25,9,date_add(curdate(), interval -25 day),91);
INSERT INTO exam_results VALUES (26,1,date_add(curdate(), interval -42 day),94);
INSERT INTO exam_results VALUES (26,2,date_add(curdate(), interval -31 day),87);
INSERT INTO exam_results VALUES (26,4,date_add(curdate(), interval -11 day),79);
INSERT INTO exam_results VALUES (26,7,date_add(curdate(), interval -34 day),79);
INSERT INTO exam_results VALUES (26,9,date_add(curdate(), interval -28 day),89);
INSERT INTO exam_results VALUES (26,10,date_add(curdate(), interval -43 day),92);
INSERT INTO exam_results VALUES (26,11,date_add(curdate(), interval -8 day),98);
INSERT INTO exam_results VALUES (27,1,date_add(curdate(), interval -45 day),78);
INSERT INTO exam_results VALUES (27,2,date_add(curdate(), interval -4 day),79);
INSERT INTO exam_results VALUES (27,4,date_add(curdate(), interval -18 day),81);
INSERT INTO exam_results VALUES (27,9,date_add(curdate(), interval -29 day),76);
INSERT INTO exam_results VALUES (28,1,date_add(curdate(), interval -6 day),98);
INSERT INTO exam_results VALUES (28,2,date_add(curdate(), interval -29 day),77);
INSERT INTO exam_results VALUES (28,3,date_add(curdate(), interval -5 day),93);
INSERT INTO exam_results VALUES (28,4,date_add(curdate(), interval -44 day),77);
INSERT INTO exam_results VALUES (28,5,date_add(curdate(), interval -32 day),95);
INSERT INTO exam_results VALUES (28,9,date_add(curdate(), interval -12 day),91);
INSERT INTO exam_results VALUES (29,1,date_add(curdate(), interval -32 day),96);
INSERT INTO exam_results VALUES (29,2,date_add(curdate(), interval -11 day),78);
INSERT INTO exam_results VALUES (29,4,date_add(curdate(), interval -50 day),65);
INSERT INTO exam_results VALUES (29,4,date_add(curdate(), interval -45 day),94);
INSERT INTO exam_results VALUES (29,7,date_add(curdate(), interval -19 day),77);
INSERT INTO exam_results VALUES (29,9,date_add(curdate(), interval -1 day),99);
INSERT INTO exam_results VALUES (29,10,date_add(curdate(), interval -10 day),85);
INSERT INTO exam_results VALUES (29,11,date_add(curdate(), interval -37 day),89);
INSERT INTO exam_results VALUES (30,2,date_add(curdate(), interval -11 day),84);
INSERT INTO exam_results VALUES (30,3,date_add(curdate(), interval -5 day),88);
INSERT INTO exam_results VALUES (30,4,date_add(curdate(), interval -13 day),97);
INSERT INTO exam_results VALUES (30,8,date_add(curdate(), interval -45 day),96);
INSERT INTO exam_results VALUES (30,9,date_add(curdate(), interval -0 day),77);
INSERT INTO exam_results VALUES (31,1,date_add(curdate(), interval -25 day),80);
INSERT INTO exam_results VALUES (31,2,date_add(curdate(), interval -24 day),82);
INSERT INTO exam_results VALUES (31,4,date_add(curdate(), interval -35 day),85);
INSERT INTO exam_results VALUES (31,7,date_add(curdate(), interval -15 day),98);
INSERT INTO exam_results VALUES (31,9,date_add(curdate(), interval -33 day),100);
INSERT INTO exam_results VALUES (31,10,date_add(curdate(), interval -35 day),93);
INSERT INTO exam_results VALUES (31,11,date_add(curdate(), interval -9 day),91);
INSERT INTO exam_results VALUES (32,1,date_add(curdate(), interval -9 day),89);
INSERT INTO exam_results VALUES (32,2,date_add(curdate(), interval -17 day),91);
INSERT INTO exam_results VALUES (32,4,date_add(curdate(), interval -35 day),81);
INSERT INTO exam_results VALUES (32,9,date_add(curdate(), interval -4 day),83);
INSERT INTO exam_results VALUES (33,1,date_add(curdate(), interval -1 day),89);
INSERT INTO exam_results VALUES (33,2,date_add(curdate(), interval -14 day),89);
INSERT INTO exam_results VALUES (33,3,date_add(curdate(), interval -26 day),85);
INSERT INTO exam_results VALUES (33,4,date_add(curdate(), interval -20 day),92);
INSERT INTO exam_results VALUES (33,5,date_add(curdate(), interval -6 day),81);
INSERT INTO exam_results VALUES (33,9,date_add(curdate(), interval -20 day),96);
INSERT INTO exam_results VALUES (34,2,date_add(curdate(), interval -11 day),89);
INSERT INTO exam_results VALUES (34,3,date_add(curdate(), interval -8 day),98);
INSERT INTO exam_results VALUES (34,4,date_add(curdate(), interval -34 day),77);
INSERT INTO exam_results VALUES (34,5,date_add(curdate(), interval -6 day),87);
INSERT INTO exam_results VALUES (34,6,date_add(curdate(), interval -27 day),35);
INSERT INTO exam_results VALUES (34,6,date_add(curdate(), interval -35 day),54);
INSERT INTO exam_results VALUES (34,6,date_add(curdate(), interval -30 day),70);
INSERT INTO exam_results VALUES (34,9,date_add(curdate(), interval -14 day),83);
INSERT INTO exam_results VALUES (34,12,date_add(curdate(), interval -13 day),87);
INSERT INTO exam_results VALUES (34,13,date_add(curdate(), interval -9 day),80);
INSERT INTO exam_results VALUES (35,1,date_add(curdate(), interval -30 day),93);
INSERT INTO exam_results VALUES (35,2,date_add(curdate(), interval -17 day),75);
INSERT INTO exam_results VALUES (35,4,date_add(curdate(), interval -22 day),86);
INSERT INTO exam_results VALUES (35,7,date_add(curdate(), interval -32 day),84);
INSERT INTO exam_results VALUES (35,9,date_add(curdate(), interval -14 day),90);
INSERT INTO exam_results VALUES (35,10,date_add(curdate(), interval -21 day),98);
INSERT INTO exam_results VALUES (35,11,date_add(curdate(), interval -21 day),96);
INSERT INTO exam_results VALUES (36,1,date_add(curdate(), interval -11 day),81);
INSERT INTO exam_results VALUES (36,2,date_add(curdate(), interval -23 day),86);
INSERT INTO exam_results VALUES (36,4,date_add(curdate(), interval -15 day),98);
INSERT INTO exam_results VALUES (36,9,date_add(curdate(), interval -23 day),83);
INSERT INTO exam_results VALUES (37,1,date_add(curdate(), interval -11 day),94);
INSERT INTO exam_results VALUES (37,2,date_add(curdate(), interval -17 day),83);
INSERT INTO exam_results VALUES (37,3,date_add(curdate(), interval -18 day),76);
INSERT INTO exam_results VALUES (37,4,date_add(curdate(), interval -8 day),93);
INSERT INTO exam_results VALUES (37,5,date_add(curdate(), interval -20 day),93);
INSERT INTO exam_results VALUES (37,9,date_add(curdate(), interval -25 day),98);
INSERT INTO exam_results VALUES (38,1,date_add(curdate(), interval -3 day),98);
INSERT INTO exam_results VALUES (38,2,date_add(curdate(), interval -4 day),77);
INSERT INTO exam_results VALUES (38,4,date_add(curdate(), interval -21 day),84);
INSERT INTO exam_results VALUES (38,9,date_add(curdate(), interval -15 day),100);
INSERT INTO exam_results VALUES (39,2,date_add(curdate(), interval -10 day),74);
INSERT INTO exam_results VALUES (39,2,date_add(curdate(), interval -6 day),100);
INSERT INTO exam_results VALUES (39,3,date_add(curdate(), interval -3 day),89);
INSERT INTO exam_results VALUES (39,4,date_add(curdate(), interval -18 day),93);
INSERT INTO exam_results VALUES (39,5,date_add(curdate(), interval -18 day),97);
INSERT INTO exam_results VALUES (39,6,date_add(curdate(), interval -18 day),88);
INSERT INTO exam_results VALUES (39,9,date_add(curdate(), interval -24 day),97);
INSERT INTO exam_results VALUES (39,12,date_add(curdate(), interval -4 day),93);
INSERT INTO exam_results VALUES (40,1,date_add(curdate(), interval -22 day),81);
INSERT INTO exam_results VALUES (40,2,date_add(curdate(), interval -9 day),78);
INSERT INTO exam_results VALUES (40,4,date_add(curdate(), interval -0 day),91);
INSERT INTO exam_results VALUES (40,9,date_add(curdate(), interval -15 day),80);
INSERT INTO exam_results VALUES (40,10,date_add(curdate(), interval -7 day),92);
INSERT INTO exam_results VALUES (40,11,date_add(curdate(), interval -18 day),96);
INSERT INTO exam_results VALUES (41,1,date_add(curdate(), interval -15 day),99);
INSERT INTO exam_results VALUES (41,2,date_add(curdate(), interval -0 day),86);
INSERT INTO exam_results VALUES (41,4,date_add(curdate(), interval -19 day),99);
INSERT INTO exam_results VALUES (41,9,date_add(curdate(), interval -17 day),100);
INSERT INTO exam_results VALUES (41,10,date_add(curdate(), interval -3 day),87);
INSERT INTO exam_results VALUES (41,11,date_add(curdate(), interval -7 day),78);
INSERT INTO exam_results VALUES (42,1,date_add(curdate(), interval -23 day),57);
INSERT INTO exam_results VALUES (42,1,date_add(curdate(), interval -15 day),70);
INSERT INTO exam_results VALUES (42,1,date_add(curdate(), interval -5 day),83);
INSERT INTO exam_results VALUES (42,2,date_add(curdate(), interval -16 day),97);
INSERT INTO exam_results VALUES (42,4,date_add(curdate(), interval -15 day),85);
INSERT INTO exam_results VALUES (42,9,date_add(curdate(), interval -22 day),83);
INSERT INTO exam_results VALUES (43,1,date_add(curdate(), interval -13 day),84);
INSERT INTO exam_results VALUES (43,2,date_add(curdate(), interval -2 day),92);
INSERT INTO exam_results VALUES (43,3,date_add(curdate(), interval -2 day),89);
INSERT INTO exam_results VALUES (43,4,date_add(curdate(), interval -10 day),80);
INSERT INTO exam_results VALUES (43,5,date_add(curdate(), interval -8 day),75);
INSERT INTO exam_results VALUES (43,9,date_add(curdate(), interval -6 day),82);
INSERT INTO exam_results VALUES (44,1,date_add(curdate(), interval -2 day),98);
INSERT INTO exam_results VALUES (44,2,date_add(curdate(), interval -15 day),90);
INSERT INTO exam_results VALUES (44,9,date_add(curdate(), interval -8 day),99);
INSERT INTO exam_results VALUES (45,1,date_add(curdate(), interval -19 day),82);
INSERT INTO exam_results VALUES (45,2,date_add(curdate(), interval -13 day),94);
INSERT INTO exam_results VALUES (45,4,date_add(curdate(), interval -8 day),77);
INSERT INTO exam_results VALUES (45,9,date_add(curdate(), interval -18 day),77);
INSERT INTO exam_results VALUES (45,10,date_add(curdate(), interval -12 day),100);
INSERT INTO exam_results VALUES (45,11,date_add(curdate(), interval -2 day),93);
INSERT INTO exam_results VALUES (46,1,date_add(curdate(), interval -12 day),78);
INSERT INTO exam_results VALUES (46,2,date_add(curdate(), interval -0 day),75);
INSERT INTO exam_results VALUES (46,4,date_add(curdate(), interval -4 day),83);
INSERT INTO exam_results VALUES (46,9,date_add(curdate(), interval -11 day),75);
INSERT INTO exam_results VALUES (47,1,date_add(curdate(), interval -6 day),95);
INSERT INTO exam_results VALUES (47,2,date_add(curdate(), interval -6 day),96);
INSERT INTO exam_results VALUES (47,9,date_add(curdate(), interval -17 day),91);
INSERT INTO exam_results VALUES (48,1,date_add(curdate(), interval -11 day),95);
INSERT INTO exam_results VALUES (48,2,date_add(curdate(), interval -15 day),100);
INSERT INTO exam_results VALUES (48,9,date_add(curdate(), interval -5 day),82);
INSERT INTO exam_results VALUES (49,1,date_add(curdate(), interval -5 day),75);
INSERT INTO exam_results VALUES (49,2,date_add(curdate(), interval -9 day),78);
INSERT INTO exam_results VALUES (49,9,date_add(curdate(), interval -3 day),91);
INSERT INTO exam_results VALUES (50,2,date_add(curdate(), interval -9 day),94);
INSERT INTO exam_results VALUES (50,3,date_add(curdate(), interval -13 day),94);
INSERT INTO exam_results VALUES (50,9,date_add(curdate(), interval -0 day),80);
INSERT INTO exam_results VALUES (51,1,date_add(curdate(), interval -6 day),100);
INSERT INTO exam_results VALUES (51,2,date_add(curdate(), interval -13 day),83);
INSERT INTO exam_results VALUES (51,9,date_add(curdate(), interval -15 day),97);
INSERT INTO exam_results VALUES (52,2,date_add(curdate(), interval -6 day),86);
INSERT INTO exam_results VALUES (52,9,date_add(curdate(), interval -11 day),79);
INSERT INTO exam_results VALUES (53,2,date_add(curdate(), interval -3 day),94);
INSERT INTO exam_results VALUES (53,9,date_add(curdate(), interval -1 day),77);
INSERT INTO exam_results VALUES (54,2,date_add(curdate(), interval -2 day),87);
INSERT INTO exam_results VALUES (54,9,date_add(curdate(), interval -9 day),75);
INSERT INTO exam_results VALUES (55,2,date_add(curdate(), interval -2 day),81);
INSERT INTO exam_results VALUES (55,9,date_add(curdate(), interval -9 day),88);
INSERT INTO exam_results VALUES (56,9,date_add(curdate(), interval -2 day),95);

Commit;