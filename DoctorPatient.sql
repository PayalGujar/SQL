--Table Creation
create table doctors(doctor_id int primary key,first_name varchar(30),last_name varchar(30),
spetiality varchar(25))

create table ProvinceName(province_id int primary key,province_name varchar(30))

create table patients(patient_id int primary key,first_name varchar(30),last_name varchar(30),
gender char(1),birth_date date,city varchar(30),province_id int,allergies varchar(80),
height decimal(3,0),Pweight decimal(4,0),constraint fa1key foreign key(province_id) references
ProvinceName(province_id))

create table admissions(admission_id int primary key,patient_id int,admission_date date,discharge_date date,diagnosis varchar(50),
attending_doctor_id int,constraint fa2key foreign key(patient_id) references patients(patient_id),
constraint fa3key foreign key(attending_doctor_id) references doctors(doctor_id))

select * from doctors
select * from ProvinceName
select * from patients
select * from admissions

insert into doctors values(2101,'Anirudh','Deshmukh','Orthopedic Surgeon'),(2102,'kedar','Kulkarni','Gastroenterologist')
,(2103,'Uday','khare','Hepatologist'),(2104,'Vrushali','khadake','pulmonologist')

insert into ProvinceName values(3101,'Maharashtra'),(3102,'Bihar'),(3103,'keral'),(3104,'gujarat')

insert into patients values(4101,'saket','amberdekar','M','6/17/1990','pune',3101,'None',5.7,78),
(4102,'akash','Nadkarni','M','10/11/1980','Surat',3104,'food',6.1,88),
(4103,'akshada','joshi','F','11/14/1996','kochi',3103,'Dust',5.5,58),
(4104,'pulkit','shotri','M','2/13/1994','patna',3102,'medications',5.4,70)
insert into patients(patient_id,first_name,last_name,gender,birth_date,city,province_id,height,Pweight)values
(4105,'nidhi','shah','F','12/13/1999','pune',3101,5.5,50)


insert into admissions values(1,4102,'9/20/2022','9/25/2022','Bone fracture',2101),
(2,4101,'10/15/2022','10/20/2022','fat liver',2103),(3,4103,'11/20/2022','11/25/2022','gastric infection',2102),
(4,4104,'2/20/2022','2/25/2022','Asthma',2104)


--1.Show the first name, last name and gender of patients who’s gender is ‘M’
select first_name,last_name,gender from patients where gender='M'

--2.Show the first name & last name of patients who does not have any allergies
select first_name,last_name from patients where allergies is null

--3.Show the patients details that start with letter ‘A’
select * from patients where first_name like 'a%'

--4.Show the patients details that height range 100 to 200/weight range between 50 to 70
select * from patients where Pweight between 50 and 70

--5.Update the patient table for the allergies column. Replace ‘NKA’ where allergies is null
update patients set allergies='NKA' where allergies is null

--6.Show how many patients have birth year is 2020/1999
select count(patient_id) as cnt from patients where year(cast(birth_date as date))=1999

--7.Show the patients details who have greatest height
select * from patients where height=(select max(height) from patients) 

--8.Show the total amount of male patients and the total amount of female patients in the patients table.
select gender,count(patient_id) from patients group by gender

--9.Show first and last name, allergies from patients which have allergies to either 
--'Penicillin' or 'Morphine'. Show results ordered ascending by allergies then by first_name then by last_name.
select first_name,last_name,allergies from patients
where allergies='food' or allergies='dust' 
order by allergies,first_name,last_name

--10.Show first_name, last_name, and the total number of admissions attended for each doctor.
--Every admission has been attended by a doctor.
select concat(d.first_name,' ',d.last_name),count(attending_doctor_id) as cnt
from doctors d 
inner join admissions a on d.doctor_id=a.attending_doctor_id
group by concat(d.first_name,' ',d.last_name)

--11.For every admission, display the patient's full name, their admission diagnosis, 
--and their doctor's full name who diagnosed their problem.
select admission_id ,concat(p.first_name,' ',p.last_name) as patient_name,a.diagnosis,concat(d.first_name,' ',d.last_name) 
as doctor_name                 
from admissions a
inner join patients p on p.patient_id=a.patient_id
inner join doctors d on d.doctor_id=a.attending_doctor_id


















