create database if not exists altir;
use altir;

drop table if exists AdminUser;
drop table if exists booking_customer;
drop table if exists Booking;
drop table if exists Rooms;
drop table if exists Customer;
drop table if exists Address;

create table Adminuser
(adminId varchar(20) primary key, firstname varchar(20), 
lastname varchar(20), phonenumber varchar(20));

create table Address
(addressid varchar(20) primary key,city varchar(10),
state varchar(20), locality varchar(20)
);

create table Customer
(customerId varchar(20) primary key, firstname varchar(20), 
lastname varchar(20), phonenumber varchar(20), age int check(age>=0),
addressid varchar(20),
foreign key(addressid) references Address(addressid)
);

create table Rooms
( roomNumber int primary key, roomType varchar(10),
  roomDescription varchar(60), 
  roomPrice decimal(10,2),
  roomStatus varchar(10) check(roomStatus in ('Available','NA','Booked')),
  bookingId varchar(20)
);

create table Booking
(
bookingid varchar(20) primary key, 
Amount decimal(5,2),
bookingDate date,
customer varchar(20),
foreign key(customer) references Customer(customerid)
);

insert into Rooms values
( 100, "AC","Delux double bed, lake view", 1000.50,"Available",null
);
insert into Rooms values
( 101, "AC","Delux double bed, mountain view",995.75,"Available",null
);
insert into Rooms values
( 102, "NonAC","Delux double bed",875.45, "Available", null);

insert into Adminuser values
("Admin_001","Admin","Admin","9874563214");

select * from Rooms;
select * from Booking;
show tables;
