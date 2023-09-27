--Table Creation
create table Student(rollno int primary key,sname varchar(30),degree varchar(20),Birthdate date,
courseid int,feespaid varchar(15),Remark varchar(20),isplaced varchar(20),constraint f1key foreign key(courseid)
 references course(courseid))

 --alter feespaid varchar to int
 alter table student alter column feespaid int

create table course(courseid int primary key,coursename varchar(20),duration int,trainerid int,
totalfees int,constraint fc2key foreign key(trainerid) references trainer(trainerid))

create table trainer(trainerid int primary key,trainername varchar(30),joinDate date,email varchar(20) unique,
experience int)

select * from Student
select * from course
select * from trainer

insert into trainer values(1,'ketki','3/4/2021','ketki@gmail.com',2),
(2,'deepa','12/22/2020','deepa@gmail.com',5),
(3,'sangita','11/6/2021','sangita@gmail.com',3),
(4,'chaya','4/1/2022','chaya@gmail.com',7),
(5,'fatima','8/11/2022','fatima@gmail.com',1)

insert into course values(101,'python',7,3,10000),
(102,'dotnet',8,1,55000),
(103,'ppl',12,2,44000),
(104,'Data structure',24,5,12000),
(105,'JAVA',6,4,15000)

insert into Student values(2101,'samruddhi','mcs','11/30/1997',104,12000,'Eligible','yes'),
(2102,'alish','btech','10/12/2003',102,40000,'not Eligible','no'),
(2103,'neha','bcs','3/28/1999',101,9000,'Eligible','yes'),
(2104,'rucha','bca','4/3/2000',103,40000,'not Eligible','no'),
(2105,'vinaya','mtech','6/20/2001',104,10000,'Eligible','yes')


--1.Show list of students. List contains roll no , student name , course name , trainer name in
--order of course name and student name.
select s1.rollno,s1.sname,s2.coursename,s3.trainername
from Student s1
inner join course s2 on s2.courseid=s1.courseid
inner join trainer s3 on s3.trainerid=s2.trainerid

--2. Show list of students who have pending fees more than 1000rs . List should have student
--name , course name , balance fees . Show this list in descending order of balance fees. 
select s1.sname,s2.coursename ,(s2.totalfees-s1.feespaid) as 'balance_fees'
from student s1
join course s2 on s2.courseid=s1.courseid
where s1.balance_fees > 1000
order by balance_fees desc

--4. Update table student. Update ‘remark’ field. Remark should be ‘Eligible for exam’ if fees paid
--by student is more than 60%.
update student set Remark='Eligible' where feespaid> any
(select totalfees-0.6 from course)

--5. Create a index to make retrieval faster based on course name.
create Index a_index on course(coursename)

--6. List name of course for which more than 20/2 students are enrolled.
select coursename from course c
join Student s on s.courseid=c.courseid
group by c.coursename
having count(s.courseid)>=2

--7. List name of course for which maximum revenue was generated. ( max fee collection)
select top 1 with ties c.coursename ,sum(s.feespaid) as total from course c
join Student s on s.courseid=c.courseid
group by c.coursename
order by total desc

--9. Delete all students who are in course which is less than 2 (6 months)months duration.
delete from student  
where courseid in
(select courseid from course where duration =12) 

--10.Delete all students for whom is placed is ‘yes’ and who have paid all the fees of their course.
delete from student  
where courseid=  
(select courseid from course where (totalfees-feespaid)=0 and isplaced='yes') 

--13. Show names of students who are more than 23 years old.
select sname
from Student 
where year(cast(getdate() as date))-year(cast(birthdate as date)) > 23

--14. Show names of students who have paid all the fees. 
select s.sname
from student s
join course c on c.courseid=s.courseid
where (c.totalfees-s.feespaid)=0


--Not Done-3,4,8,11,12,15






