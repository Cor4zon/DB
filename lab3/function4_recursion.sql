-- рекурсивная функция
CREATE FUNCTION getSum(number integer) RETURNS integer AS '
	WITH RECURSIVE t(n) AS (
			VALUES (1)
		UNION ALL
			SELECT n+1 FROM t WHERE n < number
	)
	SELECT sum(n) FROM t
' LANGUAGE SQL;

select * from getSum(5);



CREATE FUNCTION deleteWithRecursion(AuctionID integer, SaleId_beg integer, SaleId_end integer) RETURNS 
TABLE (AuctionIdentificator integer, SaleId_1 integer, SaleId_2 integer) AS
$$
	begin
		if (SaleId_beg <= SaleId_end) then
			delete from Sales
			WHERE Auction = AuctionID;
			return query
				select * from deleteWithRecursion(AuctionID, SaleId_beg+1, SaleId_end);
		END IF;
	end;
$$ LANGUAGE plpgsql;

select * from sales;
select * from deleteWithRecursion(1, 0, 10);