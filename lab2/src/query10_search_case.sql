-- Инструкция SELECT, использующая поисковое выражение CASE.
SELECT *,
	CASE 
		WHEN NumberOfExibit < 300 THEN 'Not rich museum'
		WHEN NumberOfExibit < 500 THEN 'RICH museum'
		ELSE 'LUVR'
	END AS TypeOfMuseum
FROM Exhibitions;

/*
SELECT *, 
	CASE 
		WHEN Museum < 100 THEN 'WOW'
		WHEN Museum < 300 THEN 'OH'
		ELSE 'GOOD'
	END AS AddictionalInfo
FROM ARTobjects;
*/