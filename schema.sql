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

CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    published_date DATE NOT NULL,
    publisher VARCHAR(255) NOT NULL,
    cover_state VARCHAR(255) NOT NULL,
    genre_id INTEGER,
    label_id INTEGER,
    source_id INTEGER,
    author_id INTEGER,
    CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES genres (id),
    CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES authors (id),
    CONSTRAINT fk_label FOREIGN KEY (label_id) REFERENCES labels (id)
    CONSTRAINT fk_source FOREIGN KEY (source_id) REFERENCES sources (id)

);

CREATE TABLE labels (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);