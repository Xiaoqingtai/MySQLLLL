drop database if exists domitory_system;
create database domitory_system;
show databases;
use domitory_system；
create table domitory_information(
id int not null primary key,
num varchar(20)
);
create table student(
id int not null primary key,
name varchar(20),
domitory_information_id int,
foreign key (domitory_information_id) references student(id)
);
create table `record`(
id int not null primary key,
domitory_information_id int,
content varchar(50),
record_date timestamp,
foreign key (domitory_information_id) references `record`(id)
);

