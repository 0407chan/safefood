drop table if exists user_info;
create table user_info(
	user_id varchar(20) primary key,
    name varchar(20) not null,
    password varchar(20) not null
);

drop table if exists book;
create table book(
	isbn varchar(20) primary key,
    title varchar(50) not null,
    author varchar(20) not null,
    publisher varchar(50) not null,
    description varchar(200)
);
insert into user_info values('hong', '홍길동', '1234');
insert into book values('1234', '제목','홍길동','출판사','좋은책');
commit;

select * from user_info;
delete from user_info where user_id='lim';
commit;
