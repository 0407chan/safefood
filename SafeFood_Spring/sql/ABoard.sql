drop table if exists aboard; 

create table aboard(
	idx int(4) primary key,
    content varchar(4000) not null,
    userid varchar(30) not null,
    date VARCHAR(10)
);

insert into aboard values(1,'소고기 덮밥입니다.?','ssafy','2019-05-09');
insert into aboard (idx,content,userid,date) values(6,'호명이가 제일 아름답습니다.','light','2019-05-10');

SELECT * FROM aboard;