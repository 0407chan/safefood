drop table if exists board; 

create table board(
	idx int(2) primary key auto_increment,
	title varchar(100) not null,
    content varchar(4000) not null,
    create_id varchar(30) not null
);

SELECT * FROM board;

insert into board values(1,'test1','미쳤습니까','ssafy');
insert into board(title,content,create_id) values('test2','휴우먼','admin');
insert into board(title,content,create_id) values('test3','test content','admin');