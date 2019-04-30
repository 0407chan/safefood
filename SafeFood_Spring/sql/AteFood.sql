drop table if exists ate;
CREATE TABLE ATE(
 CODE INT(4),
 count int(10),
 ID VARCHAR(20),
 eatDate date,
 foreign key (CODE) REFERENCES FOOD(CODE),
 foreign key (ID) REFERENCES member(ID)
);

select * from ate;

