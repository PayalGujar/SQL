create table EmployeeInfo(EmpId int primary key,EmpFname varchar(20),EmpLname varchar(20),Department
varchar(20),Project varchar(15),Address1 varchar(20),DOB Date,gender varchar(20))

create table EmployeePosition(Empid int,Empposition varchar(20),DateofJoining date,salary int,
constraint fb1key foreign key(EmpId) references EmployeeInfo(EmpId))

select * from EmployeeInfo
select * from EmployeePosition

insert into EmployeeInfo values(1,'Rohit','Gupta','Admin','p1','Delhi','12/02/1979','Male'),
(2,'Rahul','Mahajan','Admin','p2','Mumbai','10/10/1986','Male'),
(3,'Sonia','Banarjee','HR','p3','pune','06/05/1983','female'),
(4,'Ankita','Kapoor','HR','p4','Chennai','11/28/1983','female'),
(5,'Swati','Garg','HR','p5','Delhi','04/06/1991','female')

insert into EmployeePosition values(1,'Executive','04/01/2020',75000),
(2,'Manager','04/03/2020',50000),(3,'Manager','04/02/2020',150000),
(2,'officer','04/02/2020',90000),(1,'Manager','04/03/2020',30000)

--1. Create a query to generate the first records from the EmployeeInfo table.
select top 1 * from EmployeeInfo 
select top 1 * from EmployeeInfo order by empid
--2. Create a query to generate the last records from the EmployeeInfo table.
select top 1 *  from  EmployeeInfo order by EmpId desc
--3. Create a query to fetch the third-highest salary from the EmpPosition table.
select * from EmployeePosition order by salary desc offset 2 rows fetch next 1 row only
--4. Write a query to find duplicate records from a table.
 select ep.EmpPosition ,count(ep.Empposition) as cnt from EmployeePosition ep group by ep.Empposition
 having count(ep.Empposition)>1
--5. Create an SQL query to fetch EmpPostion and the total salary paid for each employee position.
select e.Empposition ,sum(e.salary) as totalsalary from EmployeePosition e group by e.Empposition  
--6. find the employee who has max salary
select top 1 e.Empfname ,max(e1.salary)from EmployeeInfo e join EmployeePosition e1 on e1.Empid=e.EmpId 
group by e.EmpFname order by max(e1.salary) desc
--7 find the employee who has max salary from HR department
select e.empfname,max(e2.salary) from EmployeeInfo e 
join EmployeePosition e2 on e.EmpId=e2.Empid
group by e.EmpFname
order by max(e2.salary)
--8 find the age of each employee

--9 display only female employee details
select *  from Employeeinfo where gender='female' 
--10 display employee whos position is executive
select e.empfname,e.emplname from EmployeeInfo e join EmployeePosition e1 on e1.Empid=e.EmpId where 
e1.Empposition
='Executive'
--11 display count of employee in each city
select address1 ,count(e.empid) as cnt from EmployeeInfo e group by Address1

