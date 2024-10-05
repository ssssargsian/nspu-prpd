SELECT
  s.name AS student_name,
  s.university,
  t.name AS tournament_name,
  r.registration_date
FROM tournament_registrations r
JOIN students s ON r.student_id = s.student_id
JOIN tournaments t ON r.tournament_id = t.tournament_id;