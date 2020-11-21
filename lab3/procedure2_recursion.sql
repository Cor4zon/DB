--  Рекурсивную хранимую процедуру или хранимую процедур с рекурсивным ОТВ
SELECT * 
INTO exhbitionscopy
FROM exhibitions;

CREATE PROCEDURE updateNumberOfExhibit(newExhibitsNumber integer, id_cur integer, id_max integer) AS 
$$
begin
	if (id_cur <= id_max) then
		UPDATE ExhbitionsCopy
		SET NumberOfExibit = newExhibitsNumber
		WHERE Museum = id_cur;
		CALL updateNumberOfExhibit(newExhibitsNumber, id_cur + 1, id_max);
	end if;
end;
$$ LANGUAGE plpgsql;


CALL updateNumberOfExhibit(0, 1, 10);

-- select * from exhbitionscopy
-- where museum < 10;