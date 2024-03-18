CREATE TABLE band(bandName VARCHAR(50), creation YEAR, genre VARCHAR(50), PRIMARY KEY (bandName));
INSERT INTO band (bandName, creation, genre)
VALUES
    ('Crazy Duo', 2015, 'rock'),
    ('Luna', 2009, 'classical'),
    ('Mysterio', 2019, 'pop');

ALTER TABLE singer RENAME TO musician;
ALTER TABLE musician ADD COLUMN musicianName VARCHAR(50) FIRST;
UPDATE musician SET musicianName = singerName;
ALTER TABLE album DROP FOREIGN KEY FK_A_singerName;
ALTER TABLE musician DROP COLUMN singerName;
ALTER TABLE musician ADD INDEX idx_musicianName (musicianName);
ALTER TABLE album ADD FOREIGN KEY (singerName) REFERENCES musician(musicianName);
ALTER TABLE musician ADD PRIMARY KEY (musicianName);




ALTER Table musician add column role varchar(50);
ALTER Table musician add column bandName varchar(50);

UPDATE musician
SET
    role = CASE musicianName
                WHEN 'Alina' THEN 'vocals'
                WHEN 'Luna' THEN 'piano'
                WHEN 'Mysterio' THEN 'guitar'
                WHEN 'Rainbow' THEN 'percussion'
           END,
    bandName = CASE musicianName
                WHEN 'Alina' THEN 'Crazy Duo'
                WHEN 'Luna' THEN 'Luna'
                WHEN 'Mysterio' THEN 'Mysterio'
                WHEN 'Rainbow' THEN 'Crazy Duo'
           END;
