-- Инструкция SELECT, использующая скалярные подзапросы в выражениях столбцов.
SELECT Name AS NameOfExhibition,
		Museum AS MuseumID,
		(
			SELECT MAX(NumberofExibit)
			FROM Exhibitions
		) AS MaxNumberOfExhibit,
		(
			SELECT SUM(NumberOfExibit)
			FROM Exhibitions
			WHERE Museum = 916
		) AS SumNumber916
FROM Exhibitions;

/*
SELECT ContractId,
	   (
	   	   SELECT MAX(DateIN) FROM Contracts
	   ) AS MaxDateIN,
	   (
	   	   SELECT MIN(DateIN) FROM Contracts
	   ) AS MinDateIN
FROM Contracts;
*/