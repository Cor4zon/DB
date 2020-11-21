-- Хранимую процедуру без параметров или с параметрами
CREATE PROCEDURE deleteOldContract(currentDate date) AS '
	DELETE FROM Contracts
	WHERE DateOut <= currentDate;
' LANGUAGE SQL;

CALL deleteOldContract('2020-01-01');