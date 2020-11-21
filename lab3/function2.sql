-- подставляемая табличная функция
CREATE FUNCTION getArtObject(IN integer) RETURNS ArtObjects AS '
	SELECT * FROM ArtObjects
	WHERE ObjectID = $1
' LANGUAGE SQL;

