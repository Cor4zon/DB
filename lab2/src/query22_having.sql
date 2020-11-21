-- Инструкция SELECT, консолидирующая данные с помощью предложения GROUP BY и предложения HAVING.
SELECT ContractID, MAX(DateIn) 
FROM CONTRACTS
GROUP BY ContractID
HAVING ContractID < 100;

/*
create table students
(
	StudentID SERIAL PRIMARY KEY,
	Name CHARACTER(30),
	City CHARACTER(30),
	AVGMark INTEGER
);

insert into students (Name, City, AVGMark) values
('Bill', 'Moscow', 5),
('Nik', 'Moscow', 4),
('Bill', 'Rostov', 5),
('Nik', 'Minsk', 4),
('Paul', 'Rostov', 5),
('Nik', 'Minsk', 3),
('Zhena', 'Moscow', 5),
('Masha', 'Novosib', 4),
('Oleg', 'Novosib', 2),
('Lena', 'Nobosib', 2);

SELECT City, AVG(AVGMark)
FROM Students
GROUP BY City
HAVING City <> 'Nobosib';
*/

/*
SELECT Country, COUNT(*) 
FROM Museums
GROUP BY Country
Having Count(*) > 3;
*/