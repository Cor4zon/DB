-- Инструкция SELECT, использующая вложенные коррелированные подзапросы в качестве производных таблиц в предложении FROM.
select Museums.name, MusueumObjects.name, MusueumObjects.Author
FROM Museums JOIN (
		SELECT ArtObjects.Name, ArtObjects.Museum, ArtObjects.Author FROM ArtObjects
		WHERE ArtObjects.Author LIKE 'Linda%' OR
			  ArtObjects.Author LIKE 'Paul%' OR
			  ArtObjects.Author LIKE 'Rachel%' OR
			  ArtObjects.Author LIKE 'Jessica%' OR
			  ArtObjects.Author LIKE 'Monica%'
	) AS MusueumObjects ON Museums.MuseumID = MusueumObjects.Museum;