ROLLBACK; 

-- tabel staat er nog
SELECT * FROM auto;

BEGIN;

CREATE TABLE camion (
	id SERIAL PRIMARY KEY,
	kleur varchar(64),
	merk varchar(64),
	model varchar(64),
	trekhaak bool
);

ROLLBACK;

-- toont geen tabel
SELECT * FROM camion


