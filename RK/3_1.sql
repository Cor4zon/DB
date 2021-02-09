-- Написать скалярную функцию, возвращающую минимальный возраст 
-- сотрудника,  опоздавшего более чем на 10 минут.
SELECT emp.EmployeeID, emp.FIO, emp.DateOfBirth, alc.TimeCheck, alc.dateOfCheck FROM Employees AS emp
JOIN Arival_Leaving_Control AS alc
ON emp.EmployeeID = alc.EmployeeID
WHERE alc.TypeOfCheck = 1 AND TimeCheck - '9:00' > '0:0'




WITH latenessEmployees AS
(
	SELECT emp.DateOfBirth FROM Employees AS emp
	JOIN Arival_Leaving_Control AS alc
	ON emp.EmployeeID = alc.EmployeeID
	WHERE alc.TypeOfCheck = 1 AND TimeCheck - '9:00' > '0:0'
) 
SELECT 2020 - MAX(EXTRACT(YEAR FROM DateOfBirth)) FROM latenessEmployees;


CREATE OR REPLACE FUNCTION getTheYoungestLatenessEmployeeAge()
	RETURNS DOUBLE PRECISION
AS $$
	WITH latenessEmployees AS
	(
		SELECT emp.DateOfBirth FROM Employees AS emp
		JOIN Arival_Leaving_Control AS alc
		ON emp.EmployeeID = alc.EmployeeID
		WHERE alc.TypeOfCheck = 1 AND TimeCheck - '9:00' > '0:0'
	) 
	SELECT 2020 - MAX(EXTRACT(YEAR FROM DateOfBirth)) FROM latenessEmployees;
$$ LANGUAGE SQL;



SELECT * FROM getTheYoungestLatenessEmployeeAge();