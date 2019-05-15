drop table if exists exp;
CREATE TABLE exp(
	expkey int(4) primary key auto_increment,
	code int(4),
	num int(10),
	id VARCHAR(20)

);

insert into exp values(0,3,4,'ssafy');
insert into exp values(0,2,3,'ssafy');

select * from exp;
