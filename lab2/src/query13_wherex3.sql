-- Инструкция SELECT, использующая вложенные подзапросы с уровнем вложенности 3.
SELECT * FROM Museums
WHERE MuseumID IN (
				 	SELECT Museum FROM Exhibitions
					WHERE NumberOfExibit = (
												SELECT MAX(NumberOFExibit) FROM Exhibitions
												JOIN Musuems ON Museums.MuseumID = Exhibitions.Museum
												WHERE Museum IN (
																	SELECT Museum FROM Museums
																	WHERE Country LIKE 'Hungry%'
																)
										   )
				 )