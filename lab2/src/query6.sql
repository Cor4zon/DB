-- Инструкция SELECT, использующая предикат сравнения с квантором.
SELECT *
FROM CONTRACTS
WHERE DateOut > ALL
	(
		SELECT DateOut
		FROM CONTRACTS
		WHERE DateOut < '2000-01-01'
	)
ORDER BY DateOut asc;