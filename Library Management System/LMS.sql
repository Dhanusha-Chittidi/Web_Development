create database library_1;

show databases;

use library_1;

create table readers(
 reader_id VARCHAR(6),
 fname VARCHAR(30),
 mname VARCHAR(30),
 lname VARCHAR(30),
 city VARCHAR(15),
 mobileno VARCHAR(10),
 occupation VARCHAR(10),
 dob DATE,
 constraint readers_pk primary key(reader_id)
);

INSERT INTO readers VALUES ('0001','Dhanusha','lakshmi Durga','chittidi','Rajahmundry','7013852678','Student','2004-07-02');
INSERT INTO readers VALUES ('0002','Vidya','Sri','Garapati','Rajahmundry','5382467945','Student','2004-11-11');
INSERT INTO readers VALUES ('0003','Rishitha','sai','chittidi','Rajahmundry','7287473678','Student','2006-05-11');
INSERT INTO readers VALUES ('0004','sri','Harini','Gunda','Guntur','7347025035','Student','2003-11-07');
INSERT INTO readers VALUES ('0005','Bindu','Priya','Alli','Kakinada','2983108472','Student','2002-12-15');
INSERT INTO readers VALUES ('0006','Jahnavi','','Bandaru','Amalapuram','5237948302','Student','2004-07-16');
INSERT INTO readers VALUES ('0007','Bindu','Madhavi','Bagavalli','JangareddyGudem','7263045690','Student','2004-12-25');
INSERT INTO readers VALUES ('0008','pallavi','l','reddy','vizag','8360369478','Student','2004-07-05');
INSERT INTO readers VALUES ('0009','sravanthi','mutyala','ambati','Rajahmundry','3668907858','Student','2004-11-05');
INSERT INTO readers VALUES ('0010','Hema','Latha','Alapati','Rajahmundry','7461839478','Student','2004-04-11');

select * from readers;

create table book(
 bid varchar(6),
 bname varchar(40),
 bdomain varchar(30),
 constraint  book_bid_pk primary key(bid)
);

insert into book  values('B00001','The Cat in the Hat','Story');
insert into book  values('B00002','Charlie and chocolate Factory','Story');
insert into book  values('B00003','The Very Hungry Caterpillar','Story');

create table active_readers(
account_id varchar(6),
reader_id varchar(6),
bid varchar(6),
atype  varchar(10),
astatus varchar(10),
constraint activereaders_acnumber_pk primary key(account_id),
constraint account_readerid_fk foreign key (reader_id) references readers(reader_id),
constraint  account_bid_fk  foreign key (bid) references book(bid)
);

insert into active_readers values('A00001','0001','B00001','Premium','Active');
insert into active_readers values('A00002','0002','B00002','Regular','Active');
insert into active_readers values('A00003','0003','B00002','Premium','Active');
insert into active_readers values('A00004','0004','B00003','Premium','Active');
insert into active_readers values('A00005','0005','B00002','Premium','Active');
insert into active_readers values('A00006','0006','B00001','Regular','Suspended');
insert into active_readers values('A00007','0007','B00001','Premium','Active');
insert into active_readers values('A00008','0008','B00003','Premium','Terminated');
insert into active_readers values('A00009','0009','B00002','Regular','Terminated');
insert into active_readers values('A00010','0010','B00002','Premium','Active');

select * from active_readers;

create table bookissue_details(
issuenumber varchar(6),
account_id varchar(6),
bid varchar(20),
bookname varchar(50),
numbers_of_book_issued INT(7),
constraint trandetails_tnumber_pk primary key (issuenumber),
constraint trandetails_acnumber_fk foreign key (account_id) references active_readers(account_id)
);

insert into bookissue_details values('T00001','A00001','B00001', 'The cat in the Hat','7');
insert into bookissue_details values('T00002','A00001','B00002', 'Charlie and the Chocolate Factory','5');
insert into bookissue_details values('T00003','A00002','B00001', 'The cat in the Hat','8');
insert into bookissue_details values('T00004','A00002','B00003', 'The Very Hungry Caterpillar','9');

 select * from  active_readers;
 select * from  active_readers where astatus="Terminated";
 select * from active_readers where astatus="Active";
 
 select count(account_id) from active_readers where atype="Premium";
