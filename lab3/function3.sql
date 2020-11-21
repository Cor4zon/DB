-- 3 многооператорная табличная функция
CREATE OR REPLACE FUNCTION getExhbitionsWithNExhibit() 
RETURNS VOID AS 
$$
	DECLARE MaxExhibit INTEGER;
	begin
	MaxExhibit = getMaxExhbitNumber();	
	ASSERT(MaxExhibit > 0);
	
	IF MaxExhibit > 100 THEN
		RAISE 'More then 100';
	ELSE
	   RAISE 'Less then 100';
	END IF;
	end;
$$ LANGUAGE PLPGSQL;