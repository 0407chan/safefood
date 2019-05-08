drop table if exists aboard; 

create table aboard(
	idx int(4) primary key,
    content varchar(4000) not null,
    userid varchar(30) not null,
    date VARCHAR(10),

);

insert into aboard values(1,'소고기 덮밥입니다.?','ssafy','2019-05-09',false);
insert into aboard (idx,content,userid,date) values(3,'뷰가 사실 제일 쉬운 겁니다.','admin','2019-05-10',false);

SELECT * FROM aboard;