create database CQA112;
use CQA112;

create table User_Info (UserId int, 
FirstName varchar(50), 
LastName varchar(50), 
Address varchar(225), 
PhoneNumber varchar(10),
primary key (UserId));
insert into User_Info values (1, 'Shamik', 'Serkel', '43-A Ranisayer Street', '9865432239'),
(2, 'Avinab', 'Brinda', 'KA Block 64, Chourasya Rd.', '2987453290'),
(3, 'Vaibhav', 'Salotaygi', 'I/20 Block-C, Antony Avenue', '9984364538'),
(4, 'Brinday', 'Vrishula', '2A C-TOWN DUMDAY FLAT', '3499876590'),
(5, 'Antony', 'Alluriou', '61-BackStreet C block-B, Remedy Street', '3234454323');

select * from User_Info;

desc User_Info;
drop table User_Info;
truncate table User_Info;
alter table User_Info add (Age int, City varchar(50));
update User_Info set Age = 24, City = 'Ranigang' where UserId = 1;
delete from User_Info where UserId = 3;


create table Playlist_Info ( User_Id int, 
PlaylistId int,
foreign key (User_Id) references User_Info (UserId),
foreign key (User_Id) references TrackList_Info (TrackId));
insert into Playlist_Info(User_Id, PlaylistId) values (1, 101),
(2, 103),
(3, 102),
(4, 104);
insert into Playlist_Info value (5, 106);
-- (6, 107),
-- (7, 105);

desc Playlist_Info;
drop table Playlist_Info;
select * from Playlist_Info;

create table TrackList_Info (TrackId int, TrackName varchar(50),
primary key (TrackId));
insert into TrackList_Info values (1, 'Cold Nights'),
(2, 'Sunny Rays'),(3, 'Half Good Music'),(4, 'Blackest Of Blacks');
desc TrackList_Info;

select * from TrackList_Info;
drop table TrackList_Info;

-- Left Join -- 
select * from User_Info left join Playlist_Info on User_Info.UserId = Playlist_Info.User_Id;
-- Right Join --
select * from Playlist_Info right join TrackList_Info on Playlist_Info.User_Id = TrackList_Info.TrackId;
-- Inner Join --
select * from TrackList_Info inner join User_Info on TrackList_Info.TrackId = User_Info.UserId;

-- Aggregate Functions --
create table employee (Name varchar(45) NOT NULL,
Occupation varchar(35) NOT NULL,
Working_Date date,
Working_Hours int,
Salary int);

insert into employee values ('Jolly Evans', 'HR', '2020-10-04', 9, 25000),
('Brayden Simmons', 'Engineer', '2020-10-04', 12, 65000),
('Rose Huges', 'Writer', '2020-10-04', 13, 35000),
('Laura Paul', 'Manager', '2020-11-04', 10, 45000),
('Diego Simmons', 'Teacher', '2020-11-04', 12, 30000),
('Antonio Bennet' , 'Writer', '2020-12-01', 13, 35000);
select * from employee;

select count(*) as total_employees from employee;
select sum(salary) as total_salary from employee;
select avg(salary) as Average_Salary from employee;
select min(salary) as minimun_salary from employee;
select max(salary) as maximum_salary from employee;

-- Order By --
select * from employee order by Name;
select * from employee order by Salary asc;
select * from employee order by Salary desc;

-- Clauses --
create table student_details (Roll_No int, Name varchar(30), Marks int);
insert into student_details values (1, 'Saurav', 40),(2, 'Rakesh', 83),
(3, 'Bimal', 55), (4, 'Riya', 72), (5, 'Gaurav', 90);
select * from student_details;

alter table student_details add (City varchar(30));
update student_details set City = 'Delhi' where Marks <= 60;
update student_details set City = 'Punjab' where Marks <= 85;
update student_details set City = 'Chandighar' where Marks >= 90;
truncate table student_details; 
drop table student_details;

select * from student_details where Roll_No = 3;
select distinct City from student_details;
select count(Roll_No), Gender from student_details group by Gender;


-- Unique -- 
create table Brands(Id int, BrandName varchar(30) unique,
size varchar(10));
insert into Brands values (1, 'Armani', 'L'),
(2, 'Gucci', 'XS'),(3, 'Channel', 'M'),(4, 'Puma', 'XL');

insert into Brands value (5, 'Armani', 'S');
drop table Brands;
desc Brands;
select * from Brands;

-- Check --
create table Persons (Id int not null,
LastName varchar(225),
FirstName varchar(225) not null,
Age int,
check (Age >= 18));
insert into Persons values (1, 'Kumar', 'Sanju', 26),
(2, 'Sundar', 'Gautam', 20), (3, 'Durand', 'Kobey', 18);
select * from Persons

insert into Persons value (5, 'Pahlok', 'Ameer', 16);
drop table Persons;

-- Auto increment --
create table Animals (AnimalId int not null auto_increment,
NameOfAnimals varchar(225), Age int, primary key (AnimalId));
insert into Animals(NameOfAnimals, Age) values ('Pitbull', 7),
('German Shephard', 3),
('Pug', 2);
drop table Animals;
select * from Animals;

-- Enum Constarains --
create table Student_grade(StudentId int primary key auto_increment,
Grade varchar(225) not null,
Priority enum ('Low', 'Medium', 'High') not null);
insert into Student_grade (Grade,Priority) values ('Good Grades', 'High'),
('Mediocre Grade', 'Medium');
select * from Student_grade;

insert into Student_grade(Grade,Priority) values ('Poor Grades', 1); 
insert into Student_grade(Grade,Priority) values ('Good Grades', 2);
insert into Student_grade(Grade,Priority) values ('Outstanding Grades', 3);
drop table Student_Grade;


