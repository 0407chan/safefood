DROP TABLE IF EXISTS FOOD;

CREATE TABLE FOOD(
 CODE INT(4) PRIMARY KEY,
 NAME VARCHAR(20),
 SUPPORTPEREAT DOUBLE(6,2),
 CALORY DOUBLE(6,2),
 CARBO DOUBLE(6,2),
 PROTEIN DOUBLE(6,2),
 FAT DOUBLE(6,2),
 SUGAR DOUBLE(6,2),
 NATRIUM DOUBLE(6,2),
 CHOLE DOUBLE(6,2),
 FATTYACID DOUBLE(6,2),
 TRANSFAT DOUBLE(6,2),
 MAKER VARCHAR(20),
 MATERIAL VARCHAR(500),
 IMG VARCHAR(50),
 ALLERGY VARCHAR(500),
 count int(10),
 atecount int(10)
);

select * from food;

select name, count from food order by count desc;

select * from food 
	where 
	material like concat('%','비타','%')
    or name like concat('%','비타','%') 
	or maker like concat('%','비타','%')
    order by name like concat('%','비타','%') desc
    
    
