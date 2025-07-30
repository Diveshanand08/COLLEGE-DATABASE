CREATE DATABASE DTUDB;
USE DTUDB;
-- 1. DEPARTMENT TABLE
CREATE TABLE department (
  department_id INT PRIMARY KEY,
  department_name VARCHAR(255)
);

INSERT INTO department (department_id, department_name) VALUES
(01, 'Computer Science and Engineering'),
(02, 'Electrical Engineering'),
(03, 'Electronics and Communication Engineering'),
(04, 'Mechanical Engineering'),
(05, 'Civil Engineering'),
(06, 'Information Technology'),
(07, 'Chemical Engineering'),
(08, 'Aerospace Engineering'),
(09, 'Biotechnology'),
(10, 'Industrial Engineering'),
(11, 'Environmental Engineering'),
(12, 'Metallurgical Engineering'),
(13, 'Automobile Engineering'),
(14, 'Robotics and Automation'),
(15, 'Artificial Intelligence and Data Science'),

-- Humanities Departments
(16, 'English'),
(17, 'History'),
(18, 'Political Science'),
(19, 'Philosophy'),
(20, 'Sociology'),
(21, 'Psychology'),
(22, 'Economics');
SELECT *FROM department;
-- 2. HOD TABLE
CREATE TABLE hod (
  hod_id INT PRIMARY KEY,
  hod_name VARCHAR(255),
  department_id INT,
  FOREIGN KEY (department_id) REFERENCES department(department_id)
);

INSERT INTO hod (hod_id, hod_name, department_id) VALUES
(1, 'Dr. A. Sharma', 1),
(2, 'Dr. B. Gupta', 2),
(3, 'Dr. C. Mehta', 3),
(4, 'Dr. D. Verma', 4),
(5, 'Dr. E. Nair', 5),
(6, 'Dr. F. Khan', 22),
(7, 'Dr. G. Sinha', 7),
(8, 'Dr. H. Reddy', 8),
(9, 'Dr. I. Chatterjee', 9),
(10, 'Dr. J. Iyer', 10),
(11, 'Dr. K. Patel', 21),
(12, 'Dr. L. Yadav', 20),
(13, 'Dr. M. Joshi', 13),
(14, 'Dr. N. Prasad', 14),
(15, 'Dr. O. Rajan', 15),
(16, 'Dr. P. Deshmukh', 1),
(17, 'Dr. Q. Saxena', 17),
(18, 'Dr. R. Mishra', 3),
(19, 'Dr. S. Tripathi', 4),
(20, 'Dr. T. Bansal', 5),
(21, 'Dr. U. Arora', 6),
(22, 'Dr. V. Rao', 7),
(23, 'Dr. W. Aggarwal', 8),
(24, 'Dr. X. Dey', 9),
(25, 'Dr. Y. Goyal', 10),
(26, 'Dr. Z. Malhotra', 11),
(27, 'Dr. Anil Kumar', 12),
(28, 'Dr. Neha Saini', 13),
(29, 'Dr. Vivek Thakur', 14),
(30, 'Dr. Meenakshi Singh', 15),
(31, 'Dr. Saurabh Tiwari', 1),
(32, 'Dr. Rachna Bhatnagar', 2),
(33, 'Dr. Abhishek Bhardwaj', 3),
(34, 'Dr. Nidhi Jain', 4),
(35, 'Dr. Karan Oberoi', 5),
(36, 'Dr. Seema Rani', 6),
(37, 'Dr. Varun Chaudhary', 7),
(38, 'Dr. Jyoti Pandey', 8),
(39, 'Dr. Ritesh Khandelwal', 9),
(40, 'Dr. Pratibha Mishra', 10);



-- 3. degree TABLE
CREATE TABLE degree (
  degree_id INT PRIMARY KEY,
  degree_name VARCHAR(255),
  department_id INT,
  hod_id INT,
  degree_duration VARCHAR(255),
  FOREIGN KEY (department_id) REFERENCES department(department_id),
  FOREIGN KEY (hod_id) REFERENCES hod(hod_id)
);
INSERT INTO degree (degree_id, degree_name, department_id, hod_id, degree_duration) VALUES
(101, 'B.Tech', 1, 1, '4 years'),
(102, 'M.Tech', 1, 16, '2 years'),
(103, 'B.Tech', 2, 2, '4 years'),
(104, 'M.Tech', 2, 17, '2 years'),
(105, 'B.Tech', 3, 3, '4 years'),
(106, 'M.Tech', 3, 18, '2 years'),
(107, 'B.Tech', 4, 4, '4 years'),
(108, 'M.Tech', 4, 19, '2 years'),
(109, 'B.Tech', 5, 5, '4 years'),
(110, 'M.Tech', 5, 20, '2 years'),
(111, 'B.Tech', 6, 6, '4 years'),
(112, 'M.Tech', 6, 21, '2 years'),
(113, 'B.Tech', 7, 7, '4 years'),
(114, 'M.Tech', 7, 22, '2 years'),
(115, 'B.Tech', 8, 8, '4 years'),
(116, 'M.Tech', 8, 23, '2 years'),
(117, 'B.Sc', 9, 9, '3 years'),
(118, 'M.Sc', 9, 24, '2 years'),
(119, 'B.Tech', 10, 10, '4 years'),
(120, 'M.Tech', 10, 25, '2 years'),
(121, 'B.Sc', 11, 11, '3 years'),
(122, 'M.Sc', 11, 26, '2 years'),
(123, 'B.Tech', 12, 12, '4 years'),
(124, 'M.Tech', 12, 27, '2 years'),
(125, 'B.Tech', 13, 13, '4 years'),
(126, 'M.Tech', 13, 28, '2 years'),
(127, 'B.Tech', 14, 14, '4 years'),
(128, 'M.Tech', 14, 29, '2 years'),
(129, 'B.Tech', 15, 15, '4 years'),
(130, 'M.Tech', 15, 30, '2 years'),
(131, 'BA', 16, 31, '3 years'),
(132, 'MA', 16, 32, '2 years'),
(133, 'BA (English)', 17, 33, '3 years'),
(134, 'MA (English)', 17, 34, '2 years'),
(135, 'BA (History)', 18, 35, '3 years'),
(136, 'MA (History)', 18, 36, '2 years'),
(137, 'BA (Political Science)', 19, 37, '3 years'),
(138, 'MA (Political Science)', 19, 38, '2 years'),
(139, 'BA (Philosophy)', 20, 39, '3 years'),
(140, 'MA (Philosophy)', 20, 40, '2 years');


DROP TABLE IF EXISTS student;

CREATE TABLE student (
  student_id INT PRIMARY KEY,
  student_name VARCHAR(255),
  department_id INT,
  degree_id INT,
  year INT,
  age INT,
  address VARCHAR(255),
  FOREIGN KEY (department_id) REFERENCES department(department_id),
  FOREIGN KEY (degree_id) REFERENCES degree(degree_id)
);