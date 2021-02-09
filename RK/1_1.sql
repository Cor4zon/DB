-- Написать скалярную функцию, возвращающую количество сотрудников 
-- в возрасте от 18 до 40, выходивших более 3х раз.

-- для теста 1 скалярной функции
INSERT INTO Arival_Leaving_Control VALUES
(1, '12.10.2020', 'Wednesday', '8:30', 1),
(6, '12.10.2020', 'Wednesday', '8:30', 1)


WITH cte_employees AS (
	SELECT emp.EmployeeID, emp.FIO, count(*)
	FROM Employees AS emp 
	JOIN Arival_Leaving_Control as alc
	ON emp.EmployeeID = alc.EmployeeID
	GROUP BY emp.EmployeeID, alc.TypeOfCheck
	HAVING emp.DateOfBirth < '06.01.2003' AND 
	emp.DateOfBirth > '06.01.1981' AND alc.TypeOfCheck = 1
	AND count(*) >= 3
)
SELECT COUNT(*) FROM cte_employees;

-- select * from employees;
-- select * from Arival_Leaving_Control;

-- скалярная функция, выдающая сотрудников старше 18, но младше 40
-- и при этом входили в офис 3 и более раз
CREATE OR REPLACE FUNCTION getEmployeesWhoArriversMoreThan2Times()
RETURNS BIGINT
AS 
$$
WITH cte_employees AS (
	SELECT emp.EmployeeID, emp.FIO, count(*)
	FROM Employees AS emp 
	JOIN Arival_Leaving_Control as alc
	ON emp.EmployeeID = alc.EmployeeID
	GROUP BY emp.EmployeeID, alc.TypeOfCheck
	HAVING emp.DateOfBirth < '6-01-2003' AND 
	emp.DateOfBirth > '6-01-1981' AND alc.TypeOfCheck = 1
	AND count(*) >= 3
)
SELECT COUNT(*) FROM cte_employees;
$$ LANGUAGE SQL;


SELECT * FROM getEmployeesWhoArriversMoreThan2Times();





























