create table student
(
	id int not null
		primary key,
	email varchar(255) not null,
	username varchar(25) not null,
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
INSERT INTO student (id, email, username, password) VALUES (1,222@www,lalala,343343);