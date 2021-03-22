DROP DATABASE soccer_league;
CREATE DATABASE soccer_league;

\c soccer_league;

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    city TEXT NOT NULL
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE seasons (
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    team_id INTEGER REFERENCES teams ON DELETE SET NULL
);

CREATE TABLE games (
    id SERIAL PRIMARY KEY,
    team1_id INTEGER REFERENCES teams,
    team2_id INTEGER REFERENCES teams,
    winning_id INTEGER REFERENCES teams,
    losing_id INTEGER REFERENCES teams,
    ref_id INTEGER REFERENCES referees,
    season_id INTEGER REFERENCES seasons DEFAULT 1
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    game_id INTEGER REFERENCES games,
    player_id INTEGER REFERENCES players
);

INSERT INTO teams (name, city) VALUES ('Tigers', 'Chicago'), ('Lions','Atlanta'),('Bears','Detroit');

INSERT INTO referees (first_name, last_name) VALUES ('ref','peters'),('ref','jefferson'),('dick','williams');

INSERT INTO seasons (start_date,end_date) VALUES ('March 1, 2020', 'August 30, 2020');

INSERT INTO players (first_name, last_name, team_id)
VALUES ('Nick', 'Winters', 1), ('Jenna','Loda', 2), ('John','Candy', 3);

INSERT INTO games (team1_id, team2_id, winning_id, losing_id, ref_id)
VALUES (1,2,1,2,1),(2,3,3,2,1),(3,1,1,3,2);

INSERT INTO goals (game_id, player_id)
VALUES (1,1), (1,3), (2,2), (2,3);
