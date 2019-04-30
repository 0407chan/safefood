drop table if exists ate;
CREATE TABLE ATE(
 code int(4),
 num int(10),
 id VARCHAR(20),
 date VARCHAR(10)
);

select * from ate order by date desc;
select * from ate where date = curdate() and id = 'ssafy';
select * from ate where month(date) = 4 and id = 'ssafy';

select code, sum(num), id, date
from ate 
where month(date) = 4 
and id = 'ssafy' 
group by code;


select * from ate where day(date) = 30 and id = 'ssafy';

select food.img, food.name, ate.num, ate.date from ate, food where ate.code = food.code;
insert into ate values(3,4,'ssafy','2019-06-29');
insert into ate values(2,3,'ssafy','2018-06-29');

drop table if exists aaa;
create table aaa(
	num int(5) primary key,
    date date
);

insert into aaa values(3,curdate());
select * from aaa;