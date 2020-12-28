-- 3. табличная функция
CREATE OR REPLACE FUNCTION getAllArtistBornOnLake() 
	RETURNS TABLE (
		artistID INT,
		Name VARCHAR,
		Surname VARCHAR,
		City VARCHAR
	)
AS $$

ppl = plpy.execute("SELECT * FROM Artists;")
artistsBornOnLake = []
for p in ppl:
	if p['city'].find("Lake") != -1:
		artistsBornOnLake.append(p)

return artistsBornOnLake
$$ LANGUAGE plpython3u;

select * from getAllArtistBornOnLake();