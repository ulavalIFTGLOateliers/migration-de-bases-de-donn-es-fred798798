ALTER TABLE album DROP FOREIGN KEY  album_ibfk_2 ;

ALTER TABLE musician drop COLUMN role;
ALTER TABLE musician drop COLUMN bandName;
DROP TABLE band;



ALTER TABLE musician RENAME TO singer;
ALTER TABLE singer DROP PRIMARY KEY;

ALTER TABLE singer ADD COLUMN singerName VARCHAR(50) FIRST;
UPDATE singer SET singerName = musicianName;
ALTER TABLE singer DROP COLUMN musicianName;
ALTER TABLE singer ADD INDEX idx_singerName (singerName);
ALTER TABLE album ADD FOREIGN KEY (singerName) REFERENCES singer(singerName);
ALTER TABLE singer ADD PRIMARY KEY (singerName);

