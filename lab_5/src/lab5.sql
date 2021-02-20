-- 1. Из таблиц базы данных, созданной в первой лабораторной работе, 
-- 		извлечь данные в JSON(Oracle, Postgres).

SELECT ROW_TO_JSON(Museums) FROM Museums;

-- psql
\copy
(                                                                               
	SELECT ROW_TO_JSON(Museums) FROM Museums
) TO '/Users/vpfedorov/Documents/db/lab_5/src/museums.json';

-- 2. Выполнить загрузку и сохранение JSON файла в таблицу.
--    Созданная таблица после всех манипуляций должна соответствовать
--    таблице базы данных, созданной в первой лабораторной работе.

-- COPY — копировать данные между файлом и таблицей
CREATE TABLE IF NOT EXISTS Museums_copy
(
	MuseumID SERIAL PRIMARY KEY,
	Name VARCHAR(50) NOT NULL,
	City VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS museums_json(
	info JSON
);

\COPY museums_json FROM '/Users/vpfedorov/Documents/db/lab_5/src/museums.json';


INSERT INTO Museums_copy(MuseumID, Name, City)
SELECT (info->>'museumid')::INT, info->>'name', info->>'city' FROM museums_json;


-- 3. Создать таблицу, в которой будет атрибут(-ы) с типом JSON,
-- или добавить атрибут с типом JSON к уже существующей таблице.
-- Заполнить атрибут правдоподобными данными с помощью команд INSERT или UPDATE.

CREATE TABLE IF NOT EXISTS ArtObjectPricelist
(
	Info JSON
);

INSERT INTO ArtObjectPricelist
SELECT * FROM json_object('{ObjectID, Title, Price}', '{1, "Black square", 100000}');

INSERT INTO ArtObjectPricelist
SELECT * FROM json_object('{ObjectID, Title, Price}', '{2, "Madonna with Jesus", 500000}');

INSERT INTO ArtObjectPricelist
SELECT * FROM json_object('{ObjectID, Title, Price}', '{3, "Composition №7", 300000}');

INSERT INTO ArtObjectPricelist
VALUES (json_object('{ObjectID, Title, Price}', '{4, "Great red dragon", 35000}'));

SELECT * FROM ArtObjectPricelist;

-- Задание 4

CREATE TABLE IF NOT EXISTS ExhibitionsAttendance
(
	Data JSONB
);



INSERT INTO ExhibitionsAttendance VALUES
('{"exhibitionID": 1, "title": "I am Andy Warhal", "attendance": {"august": 1000,"september": 500,"october": 7000,"november": 5050,"december": 7000}}'),
('{"exhibitionID": 2,"title": "Dali & Piccasso","attendance": {"august": 13040,"september": 44500,"october": 237000,"november": 54050,"december": 73000}}'),
('{"exhibitionID": 3,"title": "Bosch","attendance": {"august": 900,"september": 54500,"october": 2000,"november": 550,"december": 3000}}')

select * from ExhibitionsAttendance;
-- 1) Извлечь JSON фрагмент из JSON документа
SELECT Data->'title' AS title FROM ExhibitionsAttendance;

-- 2) Извлечь значение конкретного узла или атрибута JSON документа
SELECT Data->'attendance'->'october' AS attendanceOnOctober
FROM ExhibitionsAttendance


-- 3) Выполнить проверку существования узла или атрибута 
CREATE OR REPLACE FUNCTION checkKeyExist(json_to_check JSON, key TEXT)
	RETURNS BOOLEAN
AS
$$
BEGIN
	RETURN (json_to_check->key) IS NOT NULL;
END
$$ LANGUAGE PLPGSQL;

SELECT * FROM checkKeyExist(('{"exhibitionID": 1, "title": "I am Andy Warhal", "attendance":
 {"august": 1000,"september": 500,"october": 7000,"november": 5050,"december": 7000}}'), 'title')


-- 4) Изменить JSON документ
UPDATE ExhibitionsAttendance
SET data = data || '{"status": "Close"}'::JSONB
WHERE (data->'attendance'->>'december')::INT < 5000

-- 5) Разделить JSON документ на несколько строк по узлам 

CREATE TABLE ExhibitionsData
(
	wholeData JSON
);

INSERT INTO ExhibitionsData VALUES
('[{"exhibitionID": 1, "title": "I am Andy Warhal", "attendance": {"august": 1000,"september": 500,"october": 7000,"november": 5050,"december": 7000}},
	{"exhibitionID": 2,"title": "Dali & Piccasso","attendance": {"august": 13040,"september": 44500,"october": 237000,"november": 54050,"december": 73000}},
	{"exhibitionID": 3,"title": "Bosch","attendance": {"august": 900,"september": 54500,"october": 2000,"november": 550,"december": 3000}}]'
)

SELECT * FROM ExhibitionsData;
SELECT jsonb_array_elements(wholeData::jsonb) FROM ExhibitionsData;








