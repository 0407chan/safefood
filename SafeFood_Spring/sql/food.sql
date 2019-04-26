-- 테이블을 생성 하세요  --
create table or replace member(
id char(15) primary key,
pw varchar(20) not null,
name varchar(10) not null,
allergy varchar(20) not null
);

