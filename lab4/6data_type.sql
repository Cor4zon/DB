-- 6. определяемый пользователем тип данных
CREATE TYPE Poster 
AS (
	Name VARCHAR(50),
	City VARCHAR(50)
);

CREATE OR REPLACE FUNCTION getPosters() 
RETURNS SETOF Poster
AS $$
	SELECT Name, City FROM Exhibitions
$$ LANGUAGE SQL;

SELECT * FROM getPostersByID();
SELECT * FROM Exhibitions;