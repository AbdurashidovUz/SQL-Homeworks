SELECT letter
FROM letters
ORDER BY CASE WHEN letter = 'b' THEN 0 ELSE 1 END, letter;

SELECT letter
FROM letters
ORDER BY CASE WHEN letter = 'b' THEN 1 ELSE 0 END, letter;
