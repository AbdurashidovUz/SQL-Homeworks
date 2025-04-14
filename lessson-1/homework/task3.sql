
CREATE TABLE orders (
    order_id INT,
    customer_name VARCHAR(255),
    order_date DATE,
    CONSTRAINT PK_orders PRIMARY KEY (order_id)
);

ALTER TABLE orders DROP CONSTRAINT PK_orders;

ALTER TABLE orders ADD CONSTRAINT PK_orders PRIMARY KEY (order_id);
