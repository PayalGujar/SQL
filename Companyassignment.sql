--Company Assignment
create table Student(s_id int primary key,SName varchar(20),city varchar(20))
create table SubjectS(subid int primary key,subname varchar(20),maxmarks int,passingmarks int)
create table Exam(s_id int ,subid int,marks int,constraint f_ss_key foreign key(s_id) references Student(s_id)
,constraint f_s_key foreign key(subid) references subjects(subid))

Select * from Student
select * from SubjectS
select * from Exam

insert into Student values(1,'Ram','Pune'),(2,'sham','mumbai'),(3,'sita','Pune'),(4,'gita','Nashik')
insert into SubjectS values(1,'maths',100,40),(2,'English',100,40),(3,'Marathi',50,15),(4,'hindi',50,15)
insert into Exam values(1,1,100),(1,2,85),(1,3,40),(1,4,45),(2,1,35),(2,2,55),(2,3,25),(3,1,95),(3,2,87),
(3,3,45),(3,4,42)

--1)insert a new student {5,Ramesh,Haidrabad} into student table
insert into Student values(5,'Ramesh','Haidrabad')
--2)change city of sid=4(gita) to sangali
update Student set city='sangali' where s_id=4
--3)Return list of all students with column sid,name,city
select * from Student
--4)
--5)Return list of column sid,name,subname,marks,maxmarks,pass(Return p if student has passed ,
--f if student has failed)
select s2.s_id,s2.sname,s1.subname,e.marks,s1.maxmarks
from Exam e
left join SubjectS s1 on s1.subid=e.subid
left join Student s2 on s2.s_id=e.s_id

--Return list of columns sdi,name,subname of students who were absent for exam
select s_id,subname
from 

--Group by
--Find Total marks of each student
select s_id ,sum(marks) as Totalmarks from Exam group by s_id

select * from Exam
