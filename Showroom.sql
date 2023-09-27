create table Model (model_id int primary key ,model_name varchar(30),cost int)

create table Customer(cust_id int primary key,first_name varchar(20),last_name varchar(20),mobileno varchar(15),
gender varchar(3),email varchar(30) unique)

create table Payement_mode(payement_id int primary key,payement_type varchar(15))

create table feedback_Rating(rating_id int primary key,rating varchar(20))

create table Purchase(purchase_id int primary key,cust_id int,model_id int,booking_amount int,
payement_id int,purchase_date date,rating_id int,
constraint fa1key foreign key(cust_id) references customer(cust_id),
constraint fa2key foreign key(model_id) references Model(model_id),
constraint fa3key foreign key(payement_id) references Payement_mode(payement_id),
constraint fa4key foreign key(rating_id) references feedback_Rating(rating_id))

select * from model
select * from Customer
select * from Purchase
select * from feedback_Rating
select * from Payement_mode

insert into model values(1,




