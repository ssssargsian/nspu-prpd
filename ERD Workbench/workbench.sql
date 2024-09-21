Table students {
  student_id integer [primary key, note: "Primary key, unique student identifier"]
  name varchar [note: "Name of the student"]
  university varchar [note: "University the student belongs to"]
}

Table teams {
  team_id integer [primary key, note: "Primary key, unique team identifier"]
  team_name varchar [note: "Name of the team"]
  rating integer [note: "Team rating, default is 0"]
}

Table games {
  game_id integer [primary key, note: "Primary key, unique game identifier"]
  title varchar [note: "Title of the game"]
  genre varchar [note: "Genre of the game"]
}

Table tournaments {
  tournament_id integer [primary key, note: "Primary key, unique tournament identifier"]
  name varchar [note: "Tournament name"]
  prize decimal(10, 2) [note: "Prize pool for the tournament"]
  date date [note: "Date of the tournament"]
  game_id integer [note: "ID of the game played in the tournament"]
}

Table organizers {
  organizer_id integer [primary key, note: "Primary key, unique organizer identifier"]
  name varchar [note: "Name of the organizer"]
  contact_info varchar [note: "Contact information of the organizer"]
}

Table matches {
  match_id integer [primary key, note: "Primary key, unique match identifier"]
  tournament_id integer [note: "ID of the tournament"]
  team_1_id integer [note: "ID of the first team"]
  team_2_id integer [note: "ID of the second team"]
  result varchar [note: "Result of the match"]
  match_date date [note: "Date of the match"]
}

Table tournament_registrations {
  registration_id integer [primary key, note: "Primary key, unique registration identifier"]
  student_id integer [note: "ID of the student registering for the tournament"]
  tournament_id integer [note: "ID of the tournament"]
  team_id integer [note: "ID of the team the student is registering with"]
  registration_date date [note: "Date of the registration"]
}

Table tournament_organizers {
  tournament_id integer [note: "ID of the tournament"]
  organizer_id integer [note: "ID of the organizer"]
}

Ref: tournaments.game_id > games.game_id // many-to-one, a tournament features one game

Ref: matches.tournament_id > tournaments.tournament_id // many-to-one, a match is part of a tournament

Ref: matches.team_1_id > teams.team_id // many-to-one, team 1 in the match

Ref: matches.team_2_id > teams.team_id // many-to-one, team 2 in the match

Ref: tournament_registrations.student_id > students.student_id // many-to-one, student registering for a tournament

Ref: tournament_registrations.tournament_id > tournaments.tournament_id // many-to-one, registration for a tournament

Ref: tournament_registrations.team_id > teams.team_id // many-to-one, student registers with a team

Ref: tournament_organizers.tournament_id > tournaments.tournament_id // many-to-many, tournament organized by multiple organizers

Ref: tournament_organizers.organizer_id > organizers.organizer_id // many-to-many, organizer managing multiple tournaments