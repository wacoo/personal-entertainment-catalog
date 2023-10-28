CREATE TABLE movies (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    published_date DATE NOT NULL,
    silent BOOLEAN NOT NULL,
    source_id INTEGER,
    FOREIGN KEY(source_id) REFERENCES sources(id)
);

CREATE TABLE sources (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE author (
    id INTEGER PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE TABLE game (
    id INTEGER PRIMARY KEY,
    publish_date DATE,
    multiplayer BOOLEAN,
    last_played_at DATE
    label_id INTEGER,
    genre_id INTEGER
);