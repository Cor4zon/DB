-- Инструкция UPDATE со скалярным подзапросом в предложении SET.
UPDATE EXHIBITIONS
SET NumberOfExibit = (
						SELECT AVG(NumberOfExibit)
						FROM EXHIBITIONS
					)