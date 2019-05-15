drop table if exists exp;
CREATE TABLE exp(
	expkey int(4) primary key auto_increment,
	code int(4),
	num int(10),
	id VARCHAR(20)

);

    
insert into exp values(0,3,4,'ssafy');
insert into exp values(0,2,3,'ssafy');

select sum(food.CODE) code, 
		food.NAME,
		sum(food.SUPPORTPEREAT *exp.num) supportpereat, 
		sum(food.CALORY * exp.num) calory,  
		sum(food.CARBO * exp.num) carbo, 
		sum(food.PROTEIN * exp.num) protein, 
        sum(food.fat * exp.num) fat, 
        sum(food.sugar * exp.num) sugar, 
        sum(food.NATRUIM * exp.num) natrium, 
        sum(food.chole * exp.num) chole,
        sum(food.FATTYACID * exp.num) fattyacid, 
        sum(food.TRANSFAT * exp.num) transfat,
        food.MAKER,
        food.MATERIAL,
        food.IMG,
        food.ALLERGY,
        food.count
    from food, exp
	where food.code = exp.code
    and ate.id = 'ssafy';



select * from exp;
