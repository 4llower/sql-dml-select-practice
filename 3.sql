SELECT a.first_name, a.last_name
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
LEFT JOIN film f ON fa.film_id = f.film_id
GROUP BY a.actor_id
HAVING MAX(f.release_year) < (SELECT MAX(release_year) FROM film)

-- I thought that I should sort actors by release_year of film that they played last. Who has smallest release_year of film that played last time -> will be at the start