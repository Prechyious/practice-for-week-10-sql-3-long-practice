-- Give "Red" the cat one of every toy the other cats have
-- Your code here
INSERT INTO toys (name, cat_id)
SELECT DISTINCT toys.name, (SELECT id FROM cats WHERE name = "Red")
FROM toys
JOIN cats ON toys.cat_id = cats.id
WHERE cats.name != "Red";

-- Query spoiled cats reporting the most spoiled first
-- Your code here
SELECT cats.name, COUNT(toys.cat_id) AS toy_count
FROM cats
JOIN toys ON cats.id = toys.cat_id
GROUP BY cats.name
HAVING COUNT(toys.cat_id) >= 2
ORDER BY toy_count DESC;
