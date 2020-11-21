-- Хранимая процедура доступа к метаданным
CREATE PROCEDURE tableSize() AS 
$$
	DECLARE Row RECORD;
	DECLARE Cur CURSOR FOR 
	SELECT table_name, size 
	FROM (
			 SELECT table_name,
			 pg_relation_size(cast(table_name AS VARCHAR)) AS size
			 FROM information_schema.tables
			 WHERE table_schema NOT IN ('information_schema', 'pg_catalog')
			 ORDER BY Size DESC
		 ) AS tmp

	begin
	OPEN Cur;
	LOOP
		FETCH Cur INTO Row;
		EXIT WHEN NOT FOUND;
		RAISE NOTICE '{Table: %} {size: %}', Row.table_name, Row.size;
	END LOOP;
	CLOSE Cur;
	end;
$$ LANGUAGE plpgsql;





