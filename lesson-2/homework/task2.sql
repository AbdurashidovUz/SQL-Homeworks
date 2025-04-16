CREATE TABLE data_types_demo (
    id INT,                           
    name VARCHAR(50),                 
    age TINYINT,                      
    salary DECIMAL(10, 2),           
    is_active BIT,                   
    joined_date DATE,                
    last_login DATETIME,             
    notes TEXT,                       
    profile_picture VARBINARY(MAX)   
);
INSERT INTO data_types_demo (
    id, name, age, salary, is_active, joined_date, last_login, notes, profile_picture
)
VALUES (
    1,
    'Alice',
    25,
    55000.75,
    1,
    '2023-01-15',
    '2024-04-16 14:30:00',
    'Top performer in Q1',
    CONVERT(VARBINARY(MAX), 'FakeImageBytes')
);

SELECT * FROM data_types_demo;