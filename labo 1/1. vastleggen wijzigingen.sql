BEGIN;

CREATE TABLE auto (
	id SERIAL PRIMARY KEY,
	kleur varchar(64),
	merk varchar(64),
	model varchar(64),
	trekhaak bool
);

COMMIT;

SELECT * FROM auto

