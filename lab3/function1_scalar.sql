-- Скалярная функция 
--select * from exhibitions;

CREATE FUNCTION getMaxExhibitNumber() RETURNS integer AS '
	SELECT MAX(NumberOFExhibit) FROM exhibitions;
' LANGUAGE SQL;


select * from getMaxExhibitNumber();
