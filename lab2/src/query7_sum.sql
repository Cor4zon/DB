-- Инструкция SELECT, использующая агрегатные функции в выражениях столбцов
-- Считаем количество экспонатов, принадлежащих музею #916
SELECT SUM(NumberOfExibit) AS AllExhibis
FROM Exhibitions
WHERE Museum = 916