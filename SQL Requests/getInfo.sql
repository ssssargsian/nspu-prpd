SELECT
  m.match_id,
  t.name AS tournament_name,
  team1.team_name AS team_1,
  team2.team_name AS team_2,
  m.result,
  m.match_date
FROM matches m
JOIN tournaments t ON m.tournament_id = t.tournament_id
JOIN teams team1 ON m.team_1_id = team1.team_id
JOIN teams team2 ON m.team_2_id = team2.team_id;