-- ТРИГГЕР


CREATE TABLE Products
(
    Id serial PRIMARY KEY,
    ProductName CHARACTER(30) NOT NULL,
    Manufacturer CHARACTER(20) NOT NULL,
    ProductCount integer DEFAULT 0,
    Price MONEY NOT NULL
);

CREATE TRIGGER Product_INSERT_UPDATE
ON Products
AFTER INSERT, UPDATE 
AS
UPDATE Products
SET Price = Price + Price * 0.15
WHERE Id = (SELECT Id FROM inserted)


--
--

-- INSERT INTO Sales VALUES 
-- (7, 4, 157, 424, 'Boris Britva', 12305, 100000)


CREATE OR REPLACE FUNCTION insertSale() RETURNS TRIGGER AS $$
	begin
		UPDATE Sales
		SET Price = Price + Price * 0.3
		WHERE SaleID = new.SaleID;
		return NEW;
	end;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER SalesInsertTrigger
AFTER INSERT ON Sales
	FOR EACH ROW EXECUTE PROCEDURE insertSale();


-- test
 INSERT INTO Sales VALUES 
 (7, 4, 157, 424, 'Boris Britva', 12305, 100000)
