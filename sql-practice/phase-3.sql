-- Find the name of the cats co-owned by both George Beatty and Melynda Abshire
-- Your code here
SELECT cats.name FROM cats
WHERE cats.id IN (
    SELECT cat_id FROM cat_owners
    WHERE owner_id IN (
        SELECT id
        FROM owners
        WHERE (first_name = "George" AND last_name = "Beatty")
        OR (first_name = "Melynda" AND last_name = "Abshire")
    )
    GROUP BY cat_id
    HAVING COUNT(DISTINCT owner_id) = 2
);
