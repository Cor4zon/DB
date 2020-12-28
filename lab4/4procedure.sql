-- 4. хранимая процедура
CREATE OR REPLACE PROCEDURE addArtist(id integer, name VARCHAR, surname VARCHAR, city VARCHAR)
AS $$

plan = plpy.prepare("INSERT INTO Artists(artistID, name, surname, city) VALUES ($1, $2, $3, $4);", 
					["INTEGER", "VARCHAR", "VARCHAR", "VARCHAR"])
plpy.execute(plan, [id, name, surname, city])

$$ LANGUAGE plpython3u

call addArtist(1002, 'Helen', 'Baton', 'California');
call addArtist(1003, 'Ann', 'Sanchez', 'Texas');

select * from artists
order by artistID DESC;
