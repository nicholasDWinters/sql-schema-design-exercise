DROP DATABASE craigslist_db;
CREATE DATABASE craigslist_db;
\c craigslist_db;


CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    cat_name VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    location VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(20) UNIQUE NOT NULL,
    pref_region INTEGER REFERENCES regions ON DELETE SET NULL DEFAULT 1
);


CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title VARCHAR(30) NOT NULL,
    content TEXT NOT NULL,
    user_id INTEGER REFERENCES users ON DELETE CASCADE,
    region_id INTEGER REFERENCES regions ON DELETE SET NULL DEFAULT 1,
    category_id INTEGER REFERENCES categories ON DELETE SET NULL DEFAULT 1
);

INSERT INTO categories (cat_name)
VALUES
('default'),
('soccer'),
('motorcycles');

INSERT INTO regions (location)
VALUES
('default'),
('Seattle'),
('Denver'),
('Los Angeles');

INSERT INTO users (username, pref_region)
VALUES
('nick', 2),
('chickenguy', 3),
('jenna', 2),
('user3000', 4);

INSERT INTO posts (title, content, user_id, region_id, category_id)
VALUES
('firstPost', 'blah blah content', 2, 3, 2),
('secondPost', 'blah blah more content', 3, 2, 3);

INSERT INTO posts(title, content, user_id)
VALUES
('anotherPost', 'have some content', 4),
('anotherBlankPost', 'have some more content', 2);