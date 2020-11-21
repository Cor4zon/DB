--  Хранимая процедура с курсором


CREATE FUNCTION ExhibitionsUpdateCursor(museumId integer, NewNumberOfExibit integer) RETURNS VOID AS
$$
	DECLARE Row RECORD;
	DECLARE Cur CURSOR FOR
	SELECT * FROM Exhibitions
	WHERE Museum = museumId;
	
	begin
		OPEN Cur;
		LOOP
			FETCH Cur INTO Row;
			EXIT WHEN NOT FOUND;
			UPDATE Exhibitions P
			SET NumberOfExibit = NewNumberOfExibit
			WHERE P.Museum = Row.Museum;
			END LOOP;
		
		CLOSE Cur;
	end;
$$ LANGUAGE PLPGSQL;


-- tests
select * from ExhibitionsUpdateCursor(107, 100);
select * from ExhibitionsUpdateCursor(119, 100);
select * from ExhibitionsUpdateCursor(778, 100);