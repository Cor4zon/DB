-- вывести все страны кроме Испании. 

SELECT Country
FROM Museums
WHERE Country <> 'Spain'
ORDER BY Country
LIMIT 20;

/*
SELECT Country
FROM Museums
WHERE Country <> 'Afghanistan                                                                                         ' AND
		Country <> 'Algeria                                                                                             ' AND
		  Country <> 'Angola                                                                                              '
ORDER BY Country
LIMIT 20;
*/