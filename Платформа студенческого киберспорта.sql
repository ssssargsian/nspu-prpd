CREATE TABLE "students" (
  "student_id" integer PRIMARY KEY,
  "name" varchar,
  "university" varchar
);

CREATE TABLE "users" (
  "user_id" integer PRIMARY KEY,
  "username" varchar,
  "email" varchar,
  "role" varchar,
  "created_at" timestamp
);

CREATE TABLE "teams" (
  "team_id" integer PRIMARY KEY,
  "team_name" varchar,
  "rating" integer
);

CREATE TABLE "games" (
  "game_id" integer PRIMARY KEY,
  "title" varchar,
  "genre" varchar
);

CREATE TABLE "tournaments" (
  "tournament_id" integer PRIMARY KEY,
  "name" varchar,
  "prize" decimal(10,2),
  "date" date,
  "game_id" integer
);

CREATE TABLE "organizers" (
  "organizer_id" integer PRIMARY KEY,
  "name" varchar,
  "contact_info" varchar
);

CREATE TABLE "matches" (
  "match_id" integer PRIMARY KEY,
  "tournament_id" integer,
  "team_1_id" integer,
  "team_2_id" integer,
  "result" varchar,
  "match_date" date,
  "admin_user_id" integer DEFAULT null
);

CREATE TABLE "tournament_registrations" (
  "registration_id" integer PRIMARY KEY,
  "student_id" integer,
  "tournament_id" integer,
  "team_id" integer,
  "registration_date" date
);

CREATE TABLE "tournament_organizers" (
  "tournament_id" integer,
  "organizer_id" integer
);

COMMENT ON COLUMN "students"."student_id" IS 'Primary key, unique student identifier';

COMMENT ON COLUMN "students"."name" IS 'Name of the student';

COMMENT ON COLUMN "students"."university" IS 'University the student belongs to';

COMMENT ON COLUMN "users"."user_id" IS 'Primary key, unique user identifier';

COMMENT ON COLUMN "users"."username" IS 'Username of the user';

COMMENT ON COLUMN "users"."email" IS 'Email of the user';

COMMENT ON COLUMN "users"."role" IS 'Role of the user (admin, player, organizer)';

COMMENT ON COLUMN "users"."created_at" IS 'Timestamp of user creation';

COMMENT ON COLUMN "teams"."team_id" IS 'Primary key, unique team identifier';

COMMENT ON COLUMN "teams"."team_name" IS 'Name of the team';

COMMENT ON COLUMN "teams"."rating" IS 'Team rating, default is 0';

COMMENT ON COLUMN "games"."game_id" IS 'Primary key, unique game identifier';

COMMENT ON COLUMN "games"."title" IS 'Title of the game';

COMMENT ON COLUMN "games"."genre" IS 'Genre of the game';

COMMENT ON COLUMN "tournaments"."tournament_id" IS 'Primary key, unique tournament identifier';

COMMENT ON COLUMN "tournaments"."name" IS 'Tournament name';

COMMENT ON COLUMN "tournaments"."prize" IS 'Prize pool for the tournament';

COMMENT ON COLUMN "tournaments"."date" IS 'Date of the tournament';

COMMENT ON COLUMN "tournaments"."game_id" IS 'ID of the game played in the tournament';

COMMENT ON COLUMN "organizers"."organizer_id" IS 'Primary key, unique organizer identifier';

COMMENT ON COLUMN "organizers"."name" IS 'Name of the organizer';

COMMENT ON COLUMN "organizers"."contact_info" IS 'Contact information of the organizer';

COMMENT ON COLUMN "matches"."match_id" IS 'Primary key, unique match identifier';

COMMENT ON COLUMN "matches"."tournament_id" IS 'ID of the tournament';

COMMENT ON COLUMN "matches"."team_1_id" IS 'ID of the first team';

COMMENT ON COLUMN "matches"."team_2_id" IS 'ID of the second team';

COMMENT ON COLUMN "matches"."result" IS 'Result of the match';

COMMENT ON COLUMN "matches"."match_date" IS 'Date of the match';

COMMENT ON COLUMN "matches"."admin_user_id" IS 'ID of the user administering the match';

COMMENT ON COLUMN "tournament_registrations"."registration_id" IS 'Primary key, unique registration identifier';

COMMENT ON COLUMN "tournament_registrations"."student_id" IS 'ID of the student registering for the tournament';

COMMENT ON COLUMN "tournament_registrations"."tournament_id" IS 'ID of the tournament';

COMMENT ON COLUMN "tournament_registrations"."team_id" IS 'ID of the team the student is registering with';

COMMENT ON COLUMN "tournament_registrations"."registration_date" IS 'Date of the registration';

COMMENT ON COLUMN "tournament_organizers"."tournament_id" IS 'ID of the tournament';

COMMENT ON COLUMN "tournament_organizers"."organizer_id" IS 'ID of the organizer';

ALTER TABLE "tournaments" ADD FOREIGN KEY ("game_id") REFERENCES "games" ("game_id");

ALTER TABLE "matches" ADD FOREIGN KEY ("tournament_id") REFERENCES "tournaments" ("tournament_id");

ALTER TABLE "matches" ADD FOREIGN KEY ("team_1_id") REFERENCES "teams" ("team_id");

ALTER TABLE "matches" ADD FOREIGN KEY ("team_2_id") REFERENCES "teams" ("team_id");

ALTER TABLE "matches" ADD FOREIGN KEY ("admin_user_id") REFERENCES "users" ("user_id") ON DELETE SET NULL;

ALTER TABLE "tournament_registrations" ADD FOREIGN KEY ("student_id") REFERENCES "students" ("student_id");

ALTER TABLE "tournament_registrations" ADD FOREIGN KEY ("tournament_id") REFERENCES "tournaments" ("tournament_id");

ALTER TABLE "tournament_registrations" ADD FOREIGN KEY ("team_id") REFERENCES "teams" ("team_id");

ALTER TABLE "tournament_organizers" ADD FOREIGN KEY ("tournament_id") REFERENCES "tournaments" ("tournament_id");

ALTER TABLE "tournament_organizers" ADD FOREIGN KEY ("organizer_id") REFERENCES "organizers" ("organizer_id");
