-- 테이블을 생성 하세요  --
create table book(
  isbn char(12) primary key,
  title varchar(30) not null,
  author varchar(20) not null,
  price int(6)
);
INSERT INTO book VALUES('1233-111-111','Spring완성','사무국',3000);
INSERT INTO book VALUES('1233-111-123','Java와 함께','기획국',4000);
commit;
