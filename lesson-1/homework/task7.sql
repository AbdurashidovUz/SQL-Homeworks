CREATE TABLE invoice (
    invoice_id INT IDENTITY(1,1) PRIMARY KEY,
    amount DECIMAL(10, 2)
);

INSERT INTO invoice (amount) VALUES (100.00);
INSERT INTO invoice (amount) VALUES (150.00);
INSERT INTO invoice (amount) VALUES (200.00);
INSERT INTO invoice (amount) VALUES (250.00);
INSERT INTO invoice (amount) VALUES (300.00);

SET IDENTITY_INSERT invoice ON;

INSERT INTO invoice (invoice_id, amount) VALUES (100, 500.00);

SET IDENTITY_INSERT invoice OFF;
