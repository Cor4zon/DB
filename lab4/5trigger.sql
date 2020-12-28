-- 5. Триггер

CREATE OR REPLACE FUNCTION backupDeletedArtists() RETURNS TRIGGER
AS $$
plan = plpy.prepare("INSERT INTO artistsBackup(artistid, name, surname, city) VALUES ($1, $2, $3, $4);", ["INTEGER", "VARCHAR", "VARCHAR", "VARCHAR"])
pi = TD['old']
rv = plpy.execute(plan, [pi["artistid"], pi["name"], pi["surname"], pi["city"]])

return TD['new']
$$ LANGUAGE plpython3u;

DROP TRIGGER BackupDeletedArtists ON Artists;

CREATE TRIGGER BackupDeletedArtists
BEFORE DELETE ON Artists FOR EACH ROW
EXECUTE PROCEDURE backupDeletedArtists();

create table artistsbackup
(
	artistid SERIAL PRIMARY KEY,
	NAME VARCHAR,
	SURNAME VARCHAR,
	CITY VARCHAR
);

CREATE TABLE ContractsBackup
(
	contractid SERIAL PRIMARY KEY,
	MuseumOwner INTEGER NOT NULL,
	MuseumClient INTEGER NOT NULL,
	Exhibition INTEGER NOT NULL,
	DateIN DATE,
	DateOUT DATE,
	ArtObject INTEGER
);

CREATE OR REPLACE FUNCTION backupDeletedContracts() RETURNS TRIGGER
AS $$
	plan = plpy.prepare("INSERT INTO contractsBackup(contractid, MuseumOwner, MuseumClient, Exhibition, DateIN, DateOUT, ArtObject) VALUES ($1, $2, $3, $4, $5, $6, $7);", ["INTEGER", "INTEGER", "INTEGER", "INTEGER", "DATE", "DATE", "INTEGER"])
	pi = TD['old']
	rv = plpy.execute(plan, [pi["contractid"], pi["MuseumOwner"], pi["MuseumClient"], pi["Exhibition"], pi["DateIN"], pi["DateOUT"], pi["ArtObject"]])
	return TD['new']
$$ LANGUAGE plpython3u;

DROP TRIGGER BackupDeletedContracts ON Contracts;

CREATE TRIGGER BackupDeletedContracts 
BEFORE DELETE ON Contracts 
FOR EACH ROW EXECUTE PROCEDURE backupDeletedContracts();

select * from contractsbackup;

