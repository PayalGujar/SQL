--Table Creation
create table Student(rollno int primary key,sname varchar(30),degree varchar(20),Birthdate date,
courseid int,feespaid varchar(15),Remark varchar(20),isplaced varchar(20),constraint f1key foreign key(courseid)
 references course(courseid))

create table course(courseid int primary key,coursename varchar(20),duration int,trainerid int,
totalfees int,constraint fc2key foreign key(trainerid) references trainer(trainerid))

create table trainer(trainerid int primary key,trainername varchar(30),joinDate date,email varchar(20) unique,
experience int)