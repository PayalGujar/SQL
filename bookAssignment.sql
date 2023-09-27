create table Book(bookid int primary key,bookname varchar(30),authorid int,price int,constraint 
fbkey foreign key(authorid) references Author(authorid))

create table Author(authorid int primary key,authorname varchar(30),phno varchar(20),au_address varchar(30),
city varchar(10))

create table Award(awardid int primary key,award_type_id int,authorid int,bookid int,a_year int
,constraint fakey foreign key(award_type_id) references award_master(award_type_id),constraint ffkey
foreign key(authorid) references Author(authorid),constraint fdkey foreign key(bookid) references 
book(bookid))

create table award_master(award_type_id int primary key,award_name varchar(30),award_price int)

select * from Author
select * from Award
select * from award_master
select * from Book

insert into Author values(1,'collen Hoover','983324575','USA','boston'),(2,'Neil Gaiman','83324575','Uk','whitec'),
(3,'Dan brown','9983324575','uk','london'),(4,'colson whitehead','113324575','Europe','Netherland'),
(5,'ocean vuong','77410022','Ireland','Dublin')

insert into book values(111,'Verity','1',950),(112,'the Niclect boys','4',750),(113,'on earth','5',1100),(114,'The lost symbol','5',950)

insert into award_master values(101,'book browse',100000),(102,'Pulitzer prize Winners',2500000),(103,'booker',30000)

insert into Award values(201,101,4,112,2014),(202,102,1,111,2000),(203,103,2,113,2012),(204,101,3,114,1997)
insert into Award values(205,103,4,112,1997)
--1)find the Book which is written by 'collen hoover'
select bookname from book b
join author a on a.authorid=b.authorid
where authorname='collen hoover'

--2)find author name for book 'on earth'
select Authorname from Author a 
join book b on b.authorid=a.authorid
where b.bookname='on earth'

--3)find author name who got award in 2000
select authorname from author a 
join Award a1 on a1.authorid=a.authorid
where a_year='2000'

--4)find the book got an award
select bookname from book b
inner join Award a on a.bookid=b.bookid

--5)find out the author wise book count
select authorname ,count(bookid) from author a
inner join book b on b.authorid=a.authorid
group by authorname

--6)find the authorname who got only one award
select authorname from author a
inner join award a1 on a1.authorid=a.authorid
group by authorname
having count(a1.awardid)=1

--7)find the authorname who got booker award
select authorname from author a
inner join award a1 on a1.authorid=a.authorid
inner join award_master a2 on a2.award_type_id=a1.award_type_id
where a2.award_name='booker'

--8)find the author who got award price more than 50000
select authorname from author a1
inner join award a2 on a1.authorid=a2.authorid
inner join award_master a3 on a3.award_type_id=a2.award_type_id
where a3.award_price > 50000

--9)Find author who got maximum Awards
select top 1 a1.authorname ,count(*) from Author a1
join Award a2 on a2.authorid=a1.authorid
group by a1.authorname 
order by count(*) desc



















