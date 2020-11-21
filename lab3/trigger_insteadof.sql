-- trigger instead of
DISABLE TRIGGER InsertTrigger ON Sales;

ENABLE TRIGGER InsertTrigger ON Sales;

ALTER TABLE Exhibitions ADD COLUMN IsFinished BOOLEAN;

CREATE VIEW ExhibitionsView AS
SELECT *
FROM Exhibitions;

CREATE OR REPLACE FUNCTION deleteRow() RETURNS TRIGGER AS
$$
	begin
		RAISE NOTICE 'You can not delete data from this table';
		RETURN NEW;
	end;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER deleteProtection
INSTEAD OF DELETE ON ExhibitionsView
FOR EACH ROW EXECUTE PROCEDURE deleteRow();

DELETE FROM  EXHIBITIONSVIEW
WHERE NumberofExibit > 400;