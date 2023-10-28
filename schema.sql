CREATE TABLE item (
    id SERIAL PRIMARY KEY,
    genre_id INT,
    source_id INT,
    author_id INT,
    label_id INT,
    publish_date DATE NOT NULL,
    archived BOOLEAN DEFAULT false,

    FOREIGN KEY (label_id) REFERENCES labels (id),  
    FOREIGN KEY (genre_id) REFERENCES genres (id),
    FOREIGN KEY (author_id) REFERENCES author (id),
    FOREIGN KEY (source_id) REFERENCES sources (id)

)
CREATE TABLE movies (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    published_date DATE NOT NULL,
    silent BOOLEAN DEFAULT false,,
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
    multiplayer BOOLEAN DEFAULT false,,
    last_played_at DATE
    label_id INTEGER,
    genre_id INTEGER
    FOREIGN KEY (genre_id) REFERENCES genres (id),
    FOREIGN KEY (label_id) REFERENCES labels (id)
);

CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    published_date DATE NOT NULL,
    publisher VARCHAR(255) NOT NULL,
    cover_state VARCHAR(255) NOT NULL,
    genre_id INTEGER,
    label_id INTEGER,
    author_id INTEGER,
    FOREIGN KEY (genre_id) REFERENCES genres (id),
    FOREIGN KEY (author_id) REFERENCES authors (id),
    FOREIGN KEY (label_id) REFERENCES labels (id)
);

CREATE TABLE music_album (
    id SERIAL PRIMARY KEY,
    published_date DATE NOT NULL,
    on_spotify BOOLEAN DEFAULT false,
    genre_id INTEGER,
    label_id INTEGER,
    FOREIGN KEY (genre_id) REFERENCES genres (id),
    FOREIGN KEY (label_id) REFERENCES labels (id)

);

CREATE TABLE labels (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE genres (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);