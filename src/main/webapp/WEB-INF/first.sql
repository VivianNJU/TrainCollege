create table student
(
	id int not null
		primary key,
	email varchar(255) not null,
	name varchar(25) not null,
	password varchar(20) not null,
	phone varchar(20) default '' null,
	expr int default '0' not null,
	state SMALLINT default '0' not null,
	constraint student_email_uindex
		unique (email)
)
engine=InnoDB
;
-- 状态0：未验证，状态1：已验证，状态2：已取消
INSERT INTO student (id, email, name, password) VALUES (1,222@www,lalala,343343);


-- #################################################################################
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
	location varchar(255) not null
)
engine=InnoDB
;

