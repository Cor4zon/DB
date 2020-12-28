-- Получение имени человека по id
create or replace function get_name_by_id(student_id int) returns varchar
as $$
ppl = plpy.execute("select * from testtable")
for person in ppl:
	if person['student_id'] == student_id:
		return person['name']
return 'None'
$$ language plpython3u;

select * from get_name_by_id(1003);
select * from get_name_by_id(1001);
select * from get_name_by_id(1);

CREATE FUNCTION pymax (a integer, b integer) RETURNS integer
AS $$
	if a > b:
		return a
	return b
$$ LANGUAGE plpython3u;

select * from pymax(3, 5);
select * from pymax(0, -1);
select * from pymax(-10, -30);

-- возврат массива
CREATE FUNCTION return_arr()
  RETURNS int[]
AS $$

return (1, 2, 54, 0, -3)

$$ LANGUAGE plpython3u;

SELECT return_arr();


-- возврат строки
CREATE FUNCTION return_str_arr()
	RETURNS varchar[]
AS $$

return 'hello, world!'

$$ LANGUAGE plpython3u;

SELECT return_str_arr();


-- аргументы составного типа
CREATE TABLE employee
(
	NAME text,
	salary integer,
	age integer
);


CREATE FUNCTION overpaid(e employee)
	RETURNS boolean
AS $$

	if e["sallary"] > 2000:
		return true
	if e['age'] < 30 and e["sallary"] > 10000:
		return True
	return false

$$ LANGUAGE plpython3u;


CREATE TYPE myType AS
(
	name text,
	value integer
);

CREATE FUNCTION make_pair (name text, value integer)
	RETURNS myType
AS $$
	return [ name, value ]
	# return ( name, value )
$$ LANGUAGE plpython3u;