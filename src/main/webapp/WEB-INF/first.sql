create table attendance
(
	id int auto_increment
		primary key,
	lessonProId int not null,
	uid varchar(25) null,
	type int default '0' not null,
	grade int not null,
	lessonDate datetime not null
)
engine=InnoDB
;

create table bank_card
(
	cardNo varchar(255) not null
		primary key,
	password varchar(255) not null,
	balance double default '0' not null
)
engine=InnoDB
;

create table classes
(
	id int auto_increment
		primary key,
	lid int not null,
	size int not null,
	num int not null,
	name varchar(25) not null,
	teacher varchar(255) not null,
	price double not null
)
engine=InnoDB
;

create table college
(
	id int auto_increment
		primary key,
	name varchar(255) not null,
	password varchar(255) not null,
	phone varchar(25) not null,
	teacher text not null,
	other text null,
	state smallint(6) default '0' null,
	location varchar(255) not null,
	cardNo varchar(255) null
)
engine=InnoDB
;

create table lesson
(
	id int auto_increment
		primary key,
	cid int not null,
	startDay date not null,
	endDay date not null,
	name varchar(25) not null,
	type varchar(255) not null,
	intro varchar(255) not null,
	timePerWeek int not null,
	weekNum int not null,
	state int default '0' not null
)
engine=InnoDB
;

create table lesson_progress
(
	id int auto_increment
		primary key,
	uid varchar(25) not null,
	oid int not null,
	cid int not null,
	classId int not null,
	classNo int default '0' not null,
	payment int not null,
	state int default '0' not null
)
engine=InnoDB
;

create table manager
(
	id int auto_increment
		primary key,
	name varchar(25) not null,
	password varchar(255) not null,
	constraint admin_name_uindex
		unique (name)
)
engine=InnoDB
;

create table normal_student
(
	id int auto_increment
		primary key,
	username varchar(25) not null,
	phone varchar(25) not null
)
engine=InnoDB
;

create table orders
(
	id int auto_increment
		primary key,
	uid int not null,
	cid int not null,
	lid int not null,
	orderTime datetime not null,
	totalPay int default '0' not null,
	state int default '0' not null
)
engine=InnoDB
;

create table pay_record
(
	id int auto_increment
		primary key,
	email varchar(255) not null,
	uid int not null,
	collegeName varchar(255) not null,
	cid int not null,
	bankCardID varchar(25) null,
	oid int not null,
	payment double not null,
	type int default '0' not null,
	paytime datetime null
)
engine=InnoDB
;

create table student
(
	id int auto_increment
		primary key,
	email varchar(255) not null,
	username varchar(25) not null,
	password varchar(20) not null,
	phone varchar(20) default '' null,
	expr int default '0' null,
	state smallint(6) default '0' not null,
	constraint student_email_uindex
		unique (email)
)
engine=InnoDB
;

INSERT INTO student (email, username, password, phone, expr, state) VALUES
  ("test@qq.com","test","test","1234567890",0,1);

INSERT INTO manager (name, password) VALUES ("admin","test");

INSERT INTO college (name, password, phone, teacher, other, state, location, cardNo) VALUES
  ("新南方","test","1234567890","好多人","没什么好说的",1,"南方","");

INSERT INTO college (name, password, phone, teacher, other, state, location, cardNo) VALUES
  ("新北方","test","1234567890","好几个人","没什么好说的",1,"北方","");

INSERT INTO college (name, password, phone, teacher, other, state, location, cardNo) VALUES
  ("新西方","test","1234567890","个人","什么好说的",1,"西方","");

INSERT INTO college (name, password, phone, teacher, other, state, location, cardNo) VALUES
  ("新东方","test","1234567890","权威的老师","其他都是冒牌货",1,"东方","");


