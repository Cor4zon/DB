-- WITH CTE(MuseumID, MuseumName, Row_N)
-- 	AS
-- 	(
-- 		SELECT Exhibitions.Museum, Museums.Name, 
-- 			ROW_NUMBER() OVER(PARTITION BY Exhibitions.Museum) AS Row_N
-- 		FROM Exhibitions JOIN Museums ON Exhibitions.Museum = Museums.MuseumID
-- 	)
-- DELETE MuseumID, MuseumName
-- FROM CTE
-- WHERE Row_N = 1;


SELECT Exhibitions.Museum, Museums.Name, 
	ROW_NUMBER() OVER(PARTITION BY Exhibitions.Museum) AS Row_N
INTO UniqueExhibitions
FROM Exhibitions JOIN Museums ON Exhibitions.Museum = Museums.MuseumID

DELETE FROM UniqueExhibitions
WHERE Row_N > 1;