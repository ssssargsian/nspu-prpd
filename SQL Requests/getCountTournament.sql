SELECT
  o.name AS organizer_name,
  COUNT(t_o.tournament_id) AS tournament_count
FROM organizers o
JOIN tournament_organizers t_o ON o.organizer_id = t_o.organizer_id
GROUP BY o.name;