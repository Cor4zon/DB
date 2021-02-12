
-- 1. Найти все отделы, в которых работает более 10 сотрудников
SELECT Department, COUNT(*) 
FROM Employees
GROUP BY Department
HAVING COUNT(*) >= 10;

-- 2. Найти сотрудников, которые не выходят с рабочего места в течение всего рабочего дня
SELECT DISTINCT emp.EmployeeID, emp.FIO 
FROM Employees AS emp 
JOIN Arival_Leaving_Control AS alc 
ON emp.EmployeeID = alc.EmployeeID
WHERE alc.EmployeeID NOT IN (
								SELECT EmployeeID FROM Arival_Leaving_Control
								WHERE TypeOfCheck = 2 AND TimeCheck - '18:00' < '0:0'
							)


INSERT INTO Arival_Leaving_Control VALUES
(1, '10-17-2020', 'Monday', '8:30', 1),
(1, '10-17-2020', 'Monday', '15:30', 2),
(1, '10-17-2020', 'Monday', '16:30', 1),
(1, '10-17-2020', 'Monday', '18:30', 2)


-- 3. Найти все отделы, в которых есть сотрудники, опоздавшие в определенную дату. Дату передавать с клавиатуры
SELECT DISTINCT emp.Department 
FROM Employees AS emp 
JOIN Arival_Leaving_Control AS alc 
ON emp.EmployeeID = alc.EmployeeID
WHERE alc.DateOfCheck = '10.10.2020' AND
 	  alc.TimeCheck - '9:00' > '0:0' AND 
 	  alc.TypeOfCheck = 2