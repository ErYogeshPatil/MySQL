create database Project;
use Project;
 
show databases;
##  DESCRIPTION

## The data analyst of a hospital wants to store the patient diagnosis reports with the details 
## of the doctors and the patients for good medical practice and continuity of care

##  Objective:

## The database design helps to retrieve, update, and modify the patient’s details to keep track
## of the patient's health care routine.

## Task to be performed:

## •	Write a query to create a patients table with the fields such as date, patient id, patient name, age, weight, gender, location, phone number, disease, doctor name, and doctor id.

create table patients_datasets (date varchar(20),pid varchar(30), p_name varchar(30), age int , weight float , gender char(20), location varchar (30), phone_no bigint, disease varchar(25), doctor_name varchar(30), doctor_id int);
desc patients_datasets;

## •	Write a query to insert values into the patients table.

insert into patients_datasets values
('15-06-2019','AP2021','Sarath',67,76,'Male','chennai',5462829,'Cardiac','Mohan',21),
('13-02-2019','AP2022','John',62,80,'Male','banglore',1234731,'Cancer','Suraj',22),
('08-01-2018','AP2023','Henry',43,65,'Male','Kerala',9028320,'Liver','Mehta',23),
('04-02-2020','AP2024',	'Carl',56,72,'Female','Mumbai',9293829,'Asthma','Karthik',24),
('15-09-2017','AP2025','Shikar',55,71,'Male','Delhi',7821281,'Cardiac',	'Mohan',21),
('22-07-2018','AP2026','Piysuh',47,59,'Male','Haryana',8912819,'Cancer','Suraj',22),
('25-03-2017','AP2027','Stephen',69,55,'Male','Gujarat',8888211,'Liver','Mehta',23),
('22-04-2019','AP2028','Aaron',75,53,'Male','Banglore',9012192,'Asthma','Karthik',24);

select * from patients_datasets;

## •	Write a query to display the total number of patients in the table.

select count(p_name) as total_number_patients from patients_datasets;

## •	Write a query to display the patient id, patient name, gender, and disease of the patient whose age is maximum.

select pid, p_name,gender,disease from patients_datasets
where age=(select max(age) from patients_datasets);

## •	Write a query to display the patient’s name along with the current date.
select p_name,date from patients_datasets;
select curdate();

## •	Write a query to display the patient’s name, and the gender of the patient must be mentioned as M or F.

select p_name , left(gender,1) from patients_datasets;

## •	Write a query to combine the names of the patient and the doctor in a new column. 

select concat(p_name,' ',doctor_name) as new_column from patients_datasets;

## •	Write a query to display the patients’ age along with the logarithmic value (base 10) of their age.

select age , log10(age) as log_val from patients_datasets;

## •	Write a query to extract the year from the given date in a separate column.

select year(date) from patients_datasets;  ##(yyyy-mm-dd)
select right(date,4) from patients_datasets; ## (dd-mm-yyyy)

## •	Write a query to return NULL if the patient’s name and doctor’s name are similar else return the patient’s name.

select if(p_name=doctor_name,NULL,p_name) from patients_datasets;

## •	Write a query to return Yes if the patient’s age is greater than 40 else return No.

select age,if (age>40,'YES','NO') as age_morethan_40 from patients_datasets;

## •	Write a query to display the doctor’s duplicate name from the table.

SELECT doctor_name
FROM patients_datasets
GROUP BY doctor_name
HAVING COUNT(doctor_name) > 1;


