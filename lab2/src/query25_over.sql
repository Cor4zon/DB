-- Оконные функции. Использование конструкций MIN/MAX/AVG OVER()


SELECT DISTINCT Country,
	ROW_NUMBER() OVER(ORDER BY Country) AS Row_N
	FROM (
		 	SELECT DISTINCT Country
			FROM Museums
	     ) AS UniqueCountries
ORDER BY Country;


-- Оконные функции. Использование конструкций MIN/MAX/AVG OVER()

SELECT MUSEUM, Name, NumberOfexibit,
	MIN(NumberOfexibit) OVER (PARTITION BY Museum),
	MAX(NumberOfexibit) OVER (PARTITION BY Museum),
	AVG(NumberOfexibit) OVER (PARTITION BY Museum)
FROM EXHIBITIONS;