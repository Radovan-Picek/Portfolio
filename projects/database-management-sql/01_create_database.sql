ATTACH 'data/database.duckdb' AS mydb;

CREATE TABLE mydb.ekpo AS
SELECT * FROM 'data/EKPO[37][58][39].csv';

CREATE TABLE mydb.ekko AS
SELECT * FROM 'data/EKKO[18][89][2].csv';

CREATE TABLE mydb.cdpos AS
SELECT * FROM 'data/CDPOS[40][36][21].csv';

CREATE TABLE mydb.cdhdr AS
SELECT * FROM 'data/CDHDR[70][42][3].csv';