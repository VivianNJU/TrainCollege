create table student
(
	id int not null
		primary key,
	email varchar(255) not null,
	username varchar(25) not null,
	password varchar(20) not null,
	phone varchar(20) default '' null,
	expr int default '0' null,
	constraint student_id_uindex
		unique (id),
	constraint student_email_uindex
		unique (email)
)
engine=InnoDB
;

INSERT INTO student (id, email, username, password) VALUES (1,222@www,lalala,343343);