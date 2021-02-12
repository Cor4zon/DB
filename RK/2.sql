-- 2 var

-- 1. Найти все отделы, в которых нет сотрудников моложе 25 лет
SELECT DISTINCT Department
FROM Employees 
WHERE 2020 - EXTRACT(YEAR FROM DateOfBirth) > 25;

-- 2. Найти сотрудника, который пришел сегодня на работу раньше всех
SELECT emp.EmployeeID, FIO 
FROM Employees AS emp 
JOIN Arival_Leaving_Control AS alc
ON emp.EmployeeID = alc.EmployeeID
WHERE alc.TypeOfCheck = 1 AND alc.DateOfCheck = '10-10-2020'
	AND alc.TimeCheck = (SELECT MIN(TimeCheck) FROM Arival_Leaving_Control WHERE DateOfCheck = '10-10-2020')


-- ответ: 1 и 4
select * from arival_leaving_control
where dateofcheck = '10-10-2020'

-- 3. Найти сотрудников, опоздавших не менее 5-ти раз
SELECT emp.EmployeeID, FIO 
FROM Employees AS emp 
JOIN Arival_Leaving_Control AS alc
ON emp.EmployeeID = alc.EmployeeID
GROUP BY emp.EmployeeID, FIO
HAVING 