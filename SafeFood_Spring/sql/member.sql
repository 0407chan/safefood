-- 테이블을 생성 하세요  --
drop table if exists member;
create table member(
id char(15) primary key,
pw varchar(20) not null,
name varchar(10) not null,
allergy varchar(200)
);

select * from member;

insert into member values('ssafy','1234','이찬호',null);
insert into member values('admin','1234','박규빈','대두');