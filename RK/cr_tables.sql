-- 1


-- Информация о филиалах организации 
CREATE TABLE ORGANISATION_INFO
(
	BranchID SERIAL PRIMARY KEY,
	Name CHARACTER(50) NOT NULL,
	Adress CHARACTER(50) NOT NULL,
	Phone CHARACTER(50) NOT NULL
);


INSERT INTO ORGANISATION_INFO VALUES 
(1, 'Московсий филиал', 'Герцена 5', '456-89-11'),
(2, 'Новосиб фил.', 'Ленина 1', '456-44-11'),
(3, 'Саратовский фил.', 'Ленина 20', '456-29-11'),
(4, 'Томский фил.', 'Чистяковой 3', '456-84-11'),
(5, 'Воронежский офис', 'Баргицкого 4', '431-89-11'),
(6, 'Мытищинский офис', 'Шухова 12', '456-11-11')

-- Сотрудники организации с привязкой к филиалам 
CREATE TABLE Employees
(
	EmployeeID SERIAL PRIMARY KEY,
	FIO CHARACTER(50) NOT NULL,
	DateOfBirth DATE NOT NULL,
	Department CHARACTER(50) NOT NULL,
	BranchID INTEGER NOT NULL,

	FOREIGN KEY (BranchID) REFERENCES ORGANISATION_INFO(BranchID)	
);

INSERT INTO Employees VALUES 
(1, 'Fedorova O.', '10-10-1991', 'Бухгалтерия', 1),
(2, 'Bulgakov O.', '10-17-1981', 'Бухгалтерия', 3),
(3, 'Ivanov O.', '10-16-1989', 'Бухгалтерия', 2),
(4, 'Hellson O.', '12-12-1941', 'IT', 5),
(5, 'Jackson O.', '10-10-1961', 'IT', 4),
(6, 'Boszho O.', '10-10-1998', 'Логистика', 6),
(7, 'Maskov O.', '10-10-1999', 'Менеджмент', 4),
(8, 'Petrov O.', '10-10-1995', 'Продажи', 3)

-- 1. для каждой улицы вывести количество расположенных на ней филиалов 
SELECT Adress, COUNT(*)
FROM ORGANISATION_INFO
GROUP BY Adress;

-- для более точного решения ввдем дополнительный столбец в таблице ORGANISATION_INFO
ALTER TABLE ORGANISATION_INFO
ADD Street CHARATER(30) NULL;

-- запоним столбец улиц
UPDATE ORGANISATION_INFO
SET Street = 'Чистяковой'
where branchid = 4 -- и т.д.

SELECT Street, Count(*)
FROM ORGANISATION_INFO
GROUP BY Street;


-- 2. найти филиалы, в которых работат от 6 до 15 сотрудников в вострасте 26
INSERT INTO Employees VALUES 
(9, 'Markov O.', '10-10-1995', 'Бухгалтерия', 1),
(10, 'Markov O.', '10-17-1995', 'Бухгалтерия', 2),
(11, 'Markov O.', '10-16-1995', 'Бухгалтерия', 3),
(12, 'Markov O.', '12-12-1995', 'IT', 3),
(13, 'Markov O.', '10-10-1995', 'IT', 3),
(14, 'Markov O.', '10-10-1995', 'Логистика', 2)

WITH employees_cte AS
(
	SELECT emp.EmployeeID, FIO, DateOfBirth, oi.BranchID, oi.Name
	FROM Employees AS emp 
	JOIN ORGANISATION_INFO aS oi
	ON oi.BranchID = emp.BranchID
	WHERE 2021 - EXTRACT(YEAR FROM emp.DateOfBirth) = 26
)
SELECT BranchID, Name, COUNT(*)
FROM employees_cte
GROUP BY BranchID, Name 
HAVING COUNT(*) >= 6 AND COUNT(*) <= 15


-- 3. вывести всех сотрудников(с указанием названия филиала), в номере телефона
-- филиала которых не встречается цифра 7
SELECT emp.EmployeeID, emp.FIO, oi.Name, oi.Phone
FROM Employees AS emp 
JOIN ORGANISATION_INFO aS oi
ON oi.BranchID = emp.BranchID
WHERE oi.Phone NOT LIKE '%7%'





-- Задание 3. 
-- агрегатная функция выводящая филиал с минимальным количетсвом сотрудников
CREATE OR REPLACE FUNCTION getMinNumberOfEmployeesOrganisation()
	RETURNS TABLE(
					BranchID INT,
					BranchName CHARACTER(50)
				 ) 
AS 
$$
	WITH org_cte 
	AS
	(
	SELECT emp.BranchID, oi.Name, COUNT(*) AS cnt
	FROM Employees AS emp 
	JOIN ORGANISATION_INFO aS oi
	ON oi.BranchID = emp.BranchID
	GROUP BY emp.BranchID, oi.Name
	)
	SELECT BranchID, NAME
	FROM org_cte
	WHERE cnt = (SELECT MIN(cnt) FROM org_cte)

$$ LANGUAGE SQL;





















