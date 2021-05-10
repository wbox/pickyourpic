DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS collections CASCADE;
DROP TABLE IF EXISTS images CASCADE;
DROP TABLE IF EXISTS image_collections CASCADE;
DROP TABLE IF EXISTS image_tags CASCADE;
DROP TABLE IF EXISTS tags CASCADE;


CREATE TABLE tags (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE images (
  id SERIAL PRIMARY KEY NOT NULL,
  name varchar(255) NOT NULL,
  description varchar(255) NOT NULL,
  url varchar(255) NOT NULL,
  publish_date date NOT NULL,
);

CREATE TABLE image_tags (
  id SERIAL PRIMARY KEY NOT NULL,
  image_id INTEGER REFERENCES images(id) ON DELETE CASCADE,
  tag_id INTEGER UNIQUE REFERENCES tags(id) ON DELETE CASCADE
);

CREATE TABLE collections (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  user_id INTEGER UNIQUE REFERENCES users(id) ON DELETE CASCADE
)

CREATE TABLE image_collections (
  id SERIAL PRIMARY KEY NOT NULL,
  collection_id INTEGER UNIQUE REFERENCES collections(id) ON DELETE CASCADE,
  image_id INTEGER UNIQUE REFERENCES images(id) ON DELETE CASCADE,
)

CREATE TABLE users (
  id SERIAL PRIMARY KEY NOT NULL,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  nickname VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  avaTAR VARCHAR(255) NOT NULL
)
