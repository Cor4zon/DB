-- Создание новой временной локальной таблицы из результирующего набора данных инструкции SELECT. 
SELECT Ex.Name AS Exhibition, M.Name AS Museum, AO.Name AS ArtObject , AO.Author
INTO ListOfExhibits
from Exhibitions AS Ex
JOIN Museums AS M 
ON Ex.Museum = M.MuseumID
JOIN ArtObjects AS AO 
ON M.MuseumID = AO.Museum;