CREATE TABLE test_identity (
	id INT IDENTITY(1,1),
	name VARCHAR(50)
);
INSERT INTO test_identity (name) 
VALUES ('Alice'), ('Bob'), ('Charlie'), ('David'), ('Eve');

SELECT * FROM test_identity;

