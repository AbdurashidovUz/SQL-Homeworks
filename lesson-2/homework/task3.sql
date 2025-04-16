CREATE TABLE photos (
    id INT PRIMARY KEY,
    image_data VARBINARY(MAX)
);

INSERT INTO photos (id, image_data)
SELECT 1, *
FROM OPENROWSET(BULK 'C:\Users\abdur\Downloads\download.jpeg', SINGLE_BLOB) AS image;

SELECT * from photos