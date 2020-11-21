-- Инструкция SELECT, использующая предикат IN с вложенным подзапросом.
SELECT Name, Country, Address
FROM Museums
WHERE Country IN
	(
		SELECT Country
		FROM Museums 
		WHERE Country LIKE '%rus%'
	) AND Address LIKE 'US%';


/*
SELECT AO.Author, AO.Name AS ObjectName, M.Name AS MuseumName 
INTO WhereToLookingFor
FROM ArtObjects AS AO
JOIN Museums AS M
ON M.MuseumID = AO.Museum
WHERE Author IN ('Anthony Ward                                      ',
				  'Monica Rivera                                     ',
				  'Lisa Hancock                                      ',
				  'Claire Olson                                      ',
				  'Sherri Cabrera                                    ');
*/