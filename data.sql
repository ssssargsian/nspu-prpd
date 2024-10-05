-- data.sql

-- Insert students
INSERT INTO students (name, university) VALUES
('John Doe', 'Harvard University'),
('Jane Smith', 'MIT'),
('Mike Johnson', 'Stanford University');

-- Insert users (admins, players, etc.)
INSERT INTO users (username, email, role, created_at) VALUES
('admin1', 'admin1@uniplay.com', 'admin', NOW()),
('player1', 'player1@uniplay.com', 'player', NOW()),
('player2', 'player2@uniplay.com', 'player', NOW());

-- Insert teams
INSERT INTO teams (team_name, rating) VALUES
('Team Alpha', 1200),
('Team Beta', 1100),
('Team Gamma', 1150);

-- Insert games
INSERT INTO games (title, genre) VALUES
('League of Legends', 'MOBA'),
('Counter-Strike: GO', 'FPS'),
('Dota 2', 'MOBA');

-- Insert tournaments
INSERT INTO tournaments (name, prize, date, game_id) VALUES
('LoL Championship', 5000.00, '2024-11-01', 1),
('CS:GO Invitational', 3000.00, '2024-10-20', 2),
('Dota 2 Cup', 4500.00, '2024-12-05', 3);

-- Insert organizers
INSERT INTO organizers (name, contact_info) VALUES
('UniPlay Org', 'contact@uniplay.com'),
('Pro Gaming Org', 'contact@progaming.com');

-- Insert matches
INSERT INTO matches (tournament_id, team_1_id, team_2_id, result, match_date, admin_user_id) VALUES
(1, 1, 2, '2-0', '2024-11-01', 1),
(2, 2, 3, '1-2', '2024-10-21', 1),
(3, 1, 3, '2-1', '2024-12-06', 1);

-- Insert tournament registrations
INSERT INTO tournament_registrations (student_id, tournament_id, team_id, registration_date) VALUES
(1, 1, 1, '2024-10-15'),
(2, 2, 2, '2024-10-10'),
(3, 3, 3, '2024-11-20');

-- Insert tournament organizers
INSERT INTO tournament_organizers (tournament_id, organizer_id) VALUES
(1, 1),
(2, 2),
(3, 1);