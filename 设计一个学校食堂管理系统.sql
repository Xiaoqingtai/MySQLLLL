drop database if exists school_system;
create database school_system;
show databases;
use school_system；
create table dining_hall(
id int not null primary key,
name varchar(20) not null
);
create table window(
dining_hall_id int,
id int not null primary key,
name varchar(20),
foreign key (dining_hall_id) references dining_hall(id)
);
create table charges(
id int not null primary key,
price int,
charges_date timestamp,
window_id int,
foreign key (window_id) references window(id)
);
