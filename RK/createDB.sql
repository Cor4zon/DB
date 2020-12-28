

CREATE TABLE Employees
(
	EmployeeID SERIAL PRIMARY KEY,
	Name CHAR(30) NOT NULL,
	DateOfBirth DATE NOT NULL,
	GroupType CHAR(30) NOT NULL
);

CREATE TABLE CheckEmployeesArivalLeaving
(
	EmployeeID INTEGER NOT NULL,
	EventDate DATE NOT NULL,
	DateOfWeek CHAR(10) NOT NULL,
	EventTime TIME NOT NULL,
	EventType INTEGER CHECK(EventType = 1 OR EventType = 2),

	FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

INSERT INTO Employees VALUES
(1, 'Иванов Иван Иваныч', '1990-09-25', 'IT'),
(2, 'Петров Петр Петрович', '12-11-1987', 'Бухгалтерия'),
(3, 'Семенов Семен Семеныч', '11-05-1992', 'Продажи'),
(4, 'Васильев Василий Василич', '13-10-1999', 'IT'),
(5, 'Ольхова Ольга Ивановна', '15-03-1958', 'IT'),
(6, 'Смиронова Мария Ивановна', '02-01-1987', 'Продажи')


INSERT INTO CheckEmployeesArivalLeaving VALUES 
(1, '12-12-2020', 'Monday', '19:00', 2),
(2, '10-12-2020', 'Friday', '19:10', 2),
(2, '21-12-2020', 'Tuseday', '19:20', 2),
(2, '22-12-2020', 'Wednesday', '19:30', 1),
(2, '23-12-2020', 'Thursday', '20:00', 2),
(3, '24-12-2020', 'Tuesday', '19:00', 2),
(4, '26-12-2020', 'Sunday', '9:40', 1),
(5, '31-12-2020', 'Saturday', '9:21', 1),
(1, '30-12-2020', 'Monday', '8:00', 1)


SELECT * FROM Employees;
SELECT * FROM CheckEmployeesArivalLeaving;


