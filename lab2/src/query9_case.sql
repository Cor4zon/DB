-- Инструкция SELECT, использующая простое выражение CASE

SELECT Name AS MuseumName,
		Country,
	CASE Country
		WHEN 'Czech Republic                                                                                      ' THEN 'Europe'
		ELSE 'Other'
	END AS Geography
FROM Museums 
WHERE Country LIKE '%Republic%';


/*
SELECT CASE Author
WHEN 'Amy' THEN 'WOMAN'
WHEN 'Jessica%' THEN 'WOW'
WHEN 'Amy%' THEN 'WINEHOUSE'
ELSE 'NO'
END AS GirlOrNot,
Name
FROM ArtObjects;
*/
