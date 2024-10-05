-- schema.sql

-- Creating the "students" table
CREATE TABLE students (
  student_id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  university VARCHAR(255)
);

-- Creating the "users" table
CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  email VARCHAR(255),
  role VARCHAR(50),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Creating the "teams" table
CREATE TABLE teams (
  team_id SERIAL PRIMARY KEY,
  team_name VARCHAR(255),
  rating INTEGER DEFAULT 0
);

-- Creating the "games" table
CREATE TABLE games (
  game_id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  genre VARCHAR(50)
);

-- Creating the "tournaments" table
CREATE TABLE tournaments (
  tournament_id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  prize DECIMAL(10, 2),
  date DATE,
  game_id INTEGER,
  FOREIGN KEY (game_id) REFERENCES games(game_id)
);

-- Creating the "organizers" table
CREATE TABLE organizers (
  organizer_id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  contact_info VARCHAR(255)
);

-- Creating the "matches" table
CREATE TABLE matches (
  match_id SERIAL PRIMARY KEY,
  tournament_id INTEGER,
  team_1_id INTEGER,
  team_2_id INTEGER,
  result VARCHAR(255),
  match_date DATE,
  admin_user_id INTEGER,
  FOREIGN KEY (tournament_id) REFERENCES tournaments(tournament_id),
  FOREIGN KEY (team_1_id) REFERENCES teams(team_id),
  FOREIGN KEY (team_2_id) REFERENCES teams(team_id),
  FOREIGN KEY (admin_user_id) REFERENCES users(user_id) ON DELETE SET NULL
);

-- Creating the "tournament_registrations" table
CREATE TABLE tournament_registrations (
  registration_id SERIAL PRIMARY KEY,
  student_id INTEGER,
  tournament_id INTEGER,
  team_id INTEGER,
  registration_date DATE,
  FOREIGN KEY (student_id) REFERENCES students(student_id),
  FOREIGN KEY (tournament_id) REFERENCES tournaments(tournament_id),
  FOREIGN KEY (team_id) REFERENCES teams(team_id)
);

-- Creating the "tournament_organizers" table
CREATE TABLE tournament_organizers (
  tournament_id INTEGER,
  organizer_id INTEGER,
  FOREIGN KEY (tournament_id) REFERENCES tournaments(tournament_id),
  FOREIGN KEY (organizer_id) REFERENCES organizers(organizer_id)
);