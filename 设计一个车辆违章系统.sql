drop database if exists traffic_system;
create database traffic_system;
show databases;
use traffic_system；
create table `user`(
id int not null primary key,
name varchar(20) not null
);
create table cars(
id int not null primary key,
name varchar(20),
user_id int,
foreign key (user_id) references user(id)
);
create table informations(
id int not null primary key,
user_id int,
cars_id int,
foreign key (user_id) references user(id),
foreign key (cars_id) references cars(id)
);