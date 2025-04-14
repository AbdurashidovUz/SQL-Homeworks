CREATE TABLE product (
    product_id INT UNIQUE,
    product_name VARCHAR(100),
    price DECIMAL(10, 2)
);

SELECT name 
FROM sys.key_constraints 
WHERE type = 'U' AND parent_object_id = OBJECT_ID('product');

ALTER TABLE product
DROP CONSTRAINT UQ__product__product_id;  

ALTER TABLE product
ADD CONSTRAINT uq_product_id_name UNIQUE (product_id, product_name);
