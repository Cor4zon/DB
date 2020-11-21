-- РЕКУРСИВНЫЙ ОТВ
WITH RECURSIVE TestCTE(UserID, Post, ManagerID, LevelUser)
   AS
   (    
        SELECT UserID, Post, ManagerID, 0 AS LevelUser 
        FROM TestTable 
        WHERE ManagerID IS NULL
        UNION ALL

	    SELECT t1.UserID, t1.Post, t1.ManagerID, t2.LevelUser + 1 
        FROM TestTable AS t1 
        JOIN TestCTE AS t2 ON t1.ManagerID=t2.UserID
   )
SELECT * FROM TestCTE;
