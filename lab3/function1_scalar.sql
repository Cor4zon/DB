-- Скалярная функция 
--select * from exhibitions;

CREATE FUNCTION getMaxExhbitNumber() RETURNS integer AS '
	SELECT MAX(NumberOFExibit) FROM exhibitions;
' LANGUAGE SQL;


select * from getMaxExhbitNumber();
