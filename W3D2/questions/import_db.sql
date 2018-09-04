DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_likes;

PRAGMA foreign_keys = ON;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  parent_id INTEGER,
  body TEXT NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_id) REFERENCES replies(id)

);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ('AJ', 'Gosling'),
  ('Danny', 'Xu');

INSERT INTO
  questions (title, body, user_id)
VALUES
  ('Has Anyone Really Been Far Even as Decided to Use Even Go Want to do Look More Like?', 'Thoughts?',
    (SELECT id FROM users WHERE fname = 'AJ' AND lname = 'Gosling')),
  ('How can mirrors be real if our eyes aren''t real?', 'A wise man once said',
    (SELECT id FROM users WHERE fname = 'Danny' AND lname = 'Xu'));

INSERT INTO
  question_follows (user_id, question_id)
VALUES
  (1,2),
  (2,1);

INSERT INTO
  replies (question_id, user_id, parent_id, body)
VALUES
  (2, 1, NULL, 'This seems a little off topic'),
  (2, 2, 1, 'You are right');

INSERT INTO
  question_likes (user_id, question_id)
VALUES
  (1,2);
