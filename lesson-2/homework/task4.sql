CREATE TABLE student (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    classes INT,
    tuition_per_class DECIMAL(10, 2),
    total_tuition AS (classes * tuition_per_class)  
);

INSERT INTO student (id, name, classes, tuition_per_class)
VALUES 
(1, 'Alice', 4, 200.00),
(2, 'Bob', 3, 180.50),
(3, 'Charlie', 5, 150.75);

SELECT * FROM student;