drop table if exists board; 

create table board(
	idx int(2) primary key auto_increment,
	title varchar(100) not null,
    content varchar(4000) not null,
    create_id varchar(30) not null
);


insert into board values(1,'공지사항','첫번째 공지사항입니다.','admin');
insert into board(title,content,create_id) values('이 달의 식품 ','JMT','admin');
insert into board(title,content,create_id) values('4월 3주차 식단','JMT','admin');
insert into board(title,content,create_id) values('4월 4주차 공지','JMT JMT','admin');
insert into board(title,content,create_id) values('5월 1주차 공지','하하하','admin');
insert into board(title,content,create_id) values('5월 2주차 공지','JMT','admin');
insert into board(title,content,create_id) values('이 달의 식품 ','JMT','admin');
insert into board(title,content,create_id) values('5월 3주차 공지','JMT','admin');
insert into board(title,content,create_id) values('5월 17일 공지사항','발표 후 수료식입니다','admin');
insert into board(title,content,create_id) values('5월 4주차 공지','휴우가 네지입니다','admin');
insert into board(title,content,create_id) values('6월의 공지','JMT','admin');
insert into board(title,content,create_id) values('이 달의 식품 ','JMT','admin');
