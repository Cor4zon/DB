-- Написать табличную функцию, возвращающую статистику на сколько 
-- и кто опоздал в определенную дату. Дату вводить с клавиатуры. 

CREATE OR REPLACE FUNCTION getCountOfLateEmployees(dateOfLateness DATE, startTimeOfWorkingDay TIME)
	RETURNS TABLE (
		lateness interval,
		numberOfemployees bigint
	)
AS $$
	SELECT TimeCheck - startTimeOfWorkingDay, COUNT(*)
	FROM Arival_Leaving_Control
	WHERE TypeOfCheck = 1 AND DateOfCheck = dateOfLateness
	GROUP BY TimeCheck - startTimeOfWorkingDay
	HAVING TimeCheck - startTimeOfWorkingDay > '0:0'
$$ LANGUAGE SQL;


select * from getCountOfLateEmployees('10-10-2020', '9:00'); -- 2
select * from getCountOfLateEmployees('11-10-2020', '8:30'); -- 2 + 2



