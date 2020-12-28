-- 1. скалярная функция 
create or replace function get_city_by_MuseumID(id_ int) 
	RETURNS varchar
AS $$
ppl = plpy.execute("select * from Museums")
for museum in ppl:
	if museum['museumid'] == id_:
		return museum['city']
return 'None'
$$ LANGUAGE plpython3u;

SELECT * FROM get_city_by_MuseumID(353);
SELECT * FROM get_city_by_MuseumID(1);
SELECT * FROM get_city_by_MuseumID(995);
