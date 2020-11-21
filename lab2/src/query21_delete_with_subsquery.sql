-- Инструкция DELETE с вложенным коррелированным подзапросом в предложении WHERE.
-- Удалим все выстваки начавшиеся в прошлов веке
delete from exhibitionsUpdate
where DateIn IN (
			    	SELECT DateIn
				  	FROM exhibitionsUpdate
					WHERE DateIn < '2000-01-01'
			  );
SELECT * FROM exhibitionsUpdate;