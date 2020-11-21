CREATE TABLE Sales
(
	SaleID SERIAL PRIMARY KEY,
	Auction INTEGER NOT NULL,
	Museum INTEGER NOT NULL,
	ArtObject INTEGER NOT NULL,
	CustumerName CHARACTER(30) NOT NULL,
	CustumerID INTEGER NOT NULL,
	
	FOREIGN KEY (Auction) REFERENCES Auction(AuctionID),
	FOREIGN KEY (Museum) REFERENCES Museums(MuseumID),
	FOREIGN KEY (ArtObject) REFERENCES ArtObjects(ObjectID)
)

-- Цена лота
ALTER TABLE Sales ADD Column Price INTEGER;

INSERT INTO Sales VALUES 
(1, 2, 103, 624, 'mr. Franklin', 59305, 1000),
(2, 2, 663, 244, 'Dr. Zhivago', 59785, 214000),
(3, 1, 643, 44, 'Muaddib', 59475, 52300),
(4, 1, 123, 464, 'baron Vladimir Harrakonen', 53405, 5423400),
(5, 4, 14, 345, 'J. Brown', 64305, 100000),
(6, 3, 233, 534, 'Nina Simon', 63305, 250000)