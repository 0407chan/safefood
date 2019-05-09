drop table if exists qboard; 

create table qboard(
	idx int(4) primary key,
    content varchar(4000) not null,
    userid varchar(30) not null,
    date VARCHAR(10),
    state boolean
);

insert into qboard values(1,'오늘 점심은 무엇인가요?','ssafy','2019-05-08',true);
insert into qboard (idx,content,userid,date,state) values(2,'박규빈은 어떤 음식을 제일 좋아하나요?','admin','2019-05-07',false);
insert into qboard (idx,content,userid,date,state) values(3,'뷰는 왜 이렇게 어려운가요?','admin','2019-05-06',false);

SELECT * FROM qboard;