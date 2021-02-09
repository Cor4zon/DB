-- RK 3 

CREATE DATABASE RK3;

CREATE TABLE Employees
(
	EmployeeID SERIAL PRIMARY KEY,
	FIO CHAR(50) NOT NULL,
	DateOfBirth DATE NOT NULL,
	Department CHARACTER(15) NOT NULL
);

CREATE TABLE Arival_Leaving_Control
(
	EmployeeID INTEGER NOT NULL,
	DateOfCheck DATE NOT NULL,
	DayOfWeek CHAR(10) NOT NULL,
	TimeCheck TIME NOT NULL,
	-- 1 пришел; 2 - вышел
	TypeOfCheck INTEGER CHECK(TypeOfCheck = 1 OR TypeOfCheck = 2),

	FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- заполним 1 таблицу

INSERT INTO Employees VALUES
(1, 'Ivanov I.P.', '02-19-2000', 'Продажи'),
(2, 'Fedorova O.F.', '04-10-1998', 'Менеджер'),
(3, 'Kulikov P.G.', '03-10-1968', 'Бухгалтер'),
(4, 'Pavlov C.L.', '03-10-1995', 'Бухгалтер'),
(5, 'Gromova Q.A.', '05-12-1998', 'Логистика'),
(6, 'Yakuba I.P.', '07-11-1968', 'IT'),
(7, 'Borisov E.A.', '06-12-1978', 'IT'),
(8, 'Semenov E.P.', '03-10-1956', 'IT');

INSERT INTO Arival_Leaving_Control VALUES
(1, '10.10.2020', 'Monday', '8:30', 1),
(1, '10.10.2020', 'Monday', '18:30', 2),
(1, '11.10.2020', 'Tuesday', '8:39', 1),
(1, '11.10.2020', 'Tuesday', '18:30', 2),
(2, '10.10.2020', 'Monday', '8:38', 1),
(2, '10.10.2020', 'Monday', '18:39', 2),
(2, '11.10.2020', 'Tuesday', '8:00', 1),
(2, '11.10.2020', 'Tuesday', '19:30', 2),
(3, '10.10.2020', 'Monday', '9:30', 1),
(3, '10.10.2020', 'Monday', '18:30', 2),
(3, '11.10.2020', 'Tuesday', '9:34', 1),
(3, '11.10.2020', 'Tuesday', '20:30', 2),
(4, '10.10.2020', 'Monday', '8:30', 1),
(4, '10.10.2020', 'Monday', '18:30', 2),
(4, '11.10.2020', 'Tuesday', '8:39', 1),
(4, '11.10.2020', 'Tuesday', '18:30', 2),
(5, '10.10.2020', 'Monday', '8:38', 1),
(5, '10.10.2020', 'Monday', '18:39', 2),
(5, '11.10.2020', 'Tuesday', '8:00', 1),
(5, '11.10.2020', 'Tuesday', '19:30', 2),
(6, '10.10.2020', 'Monday', '9:30', 1),
(6, '10.10.2020', 'Monday', '18:30', 2),
(6, '11.10.2020', 'Tuesday', '9:34', 1),
(6, '11.10.2020', 'Tuesday', '20:30', 2)












