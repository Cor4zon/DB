-- Инструкция SELECT, использующая простое обобщенное табличное выражение
/*
INSERT INTO TESTTABLE VALUES
(1, 'Диркетор', NULL),
(2,'Главный бухгалтер', 2),
(3,'Бухгалтер', 2),
(4,'Начальник отдела продаж', 1),
(5,'Старший менеджер по продажам', 4),
(6,'Мэнеджер по продажам', 5),
(7,'начальчик отдела ИТ', 1),
(8,'старший программист', 7),
(9,'программист', 8),
(10, 'Системный админ', 7)
*/

WITH CTE (UserID, Post, ManagerID)
	AS
	(
		SELECT UserID, Post, ManagerID FROM TestTable
	)
SELECT * FROM CTE;

-- Названия столбцов можно не перечислять, так как они уникальны.
/* 
WITH CTE
	AS
	(
		SELECT UserID, Post, ManagerID FROM TestTable
	)
SELECT * FROM CTE;
*/

WITH MuseumsCTE
	AS 
	(
		SELECT * FROM Museums
	)
SELECT * FROM MuseumsCTE;