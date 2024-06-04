SELECT s.store_id, s.staff_id, SUM(p.amount) AS total_revenue
FROM staff s
JOIN payment p ON s.staff_id = p.staff_id
WHERE EXTRACT(YEAR FROM p.payment_date) = 2017
GROUP BY s.store_id, s.staff_id
HAVING SUM(p.amount) = (
    SELECT MAX(total_revenue)
    FROM (
        SELECT s.store_id, s.staff_id, SUM(p.amount) AS total_revenue
        FROM staff s
        JOIN payment p ON s.staff_id = p.staff_id
        WHERE EXTRACT(YEAR FROM p.payment_date) = 2017
        GROUP BY s.store_id, s.staff_id
    ) AS subquery
    WHERE subquery.store_id = s.store_id
)