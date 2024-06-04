SELECT f.film_id, f.rating, COUNT(*) AS rental_count
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
GROUP BY f.film_id, f.rating
ORDER BY rental_count DESC
LIMIT 5;