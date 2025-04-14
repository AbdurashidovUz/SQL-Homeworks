CREATE TABLE account (
    account_id INT PRIMARY KEY,
    balance DECIMAL(10, 2) CHECK (balance >= 0),
    account_type VARCHAR(50) CHECK (account_type IN ('Saving', 'Checking'))
);

ALTER TABLE account
DROP CONSTRAINT CK__account__balance__...;

ALTER TABLE account
DROP CONSTRAINT CK__account__account_type__...;

ALTER TABLE account
ADD CONSTRAINT chk_balance CHECK (balance >= 0);

ALTER TABLE account
ADD CONSTRAINT chk_account_type CHECK (account_type IN ('Saving', 'Checking'));
