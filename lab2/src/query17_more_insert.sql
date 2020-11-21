-- Однострочная инструкция INSERT, выполняющая вставку в таблицу одной строки значений.
CREATE TABLE NewContracts
(
	Exhibition SERIAL PRIMARY KEY,
	ClientMuseum INTEGER,
	OwnerMuseum INTEGER
);

INSERT INTO NewContracts(Exhibition, ClientMuseum, OwnerMuseum)
SELECT ExhibitionS.Exhibitionid, Museums.MuseumID, Museums.MuseumID
FROM Exhibitions 
JOIN Museums ON Museums.MuseumID = Exhibitions.Museum
