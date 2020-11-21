-- Инструкция SELECT, использующая предикат EXISTS с вложенным подзапросом.
SELECT ObjectID, Author
FROM ArtObjects
WHERE EXISTS (
				SELECT ArtObjects.Author
				FROM ArtObjects
				WHERE Author LIKE 'Jacob%'
			);

/*
SELECT * 
FROM WhereToLookingFor
WHERE EXISTS (
				SELECT ObjectName AS Title
				From ArtObjects 
				WHERE ObjectName LIKE 'rise'
			  )
*/