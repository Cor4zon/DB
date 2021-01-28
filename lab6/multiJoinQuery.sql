SELECT ao.Name AS ObjectName, m.Name AS MuseumName, ar.Name AS ArtistName
FROM ArtObjects AS ao JOIN Museums AS m
ON ao.Museum = m.MuseumID
JOIN Artists AS ar
ON ao.Artist = ar.ArtistID;

