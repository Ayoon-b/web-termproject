use JSPBookDB
CREATE TABLE account(
	id int NOT NULL AUTO_INCREMENT,
	name VARCHAR(100) not null,
	passwd VARCHAR(50) not null,
	PRIMARY KEY(id)
);

CREATE TABLE members(
	id VARCHAR(20) NOT NULL,
	passwd VARCHAR(20) NOT NULL,
	name VARCHAR(30) NOT NULL,
	email VARCHAR(30) NOT NULL,
	PRIMARY KEY(id)
)ENGINE=MyISAM DEFAULT CHARSET="utf8";


CREATE TABLE gesipan(
	num INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	writer VARCHAR(20) not null,
	subject VARCHAR(50) not null,
	content VARCHAR(1000) not null,
	reg_date DATE,
	hits INT not null default(0)
);


���̺� ����
DROP TABLE members;
DROP TABLE gesipan;

���̺� ����
DESC gesipan;
DESC members
���̺� �ʵ� ����
SELECT * FROM gesipan;
SELECT * FROM members;


alter table test_board auto_increment=1;

