CREATE DATABASE yeticave
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;

USE yeticave;

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  email VARCHAR(254) NOT NULL UNIQUE,
  name VARCHAR(64) NOT NULL,
  password VARCHAR(16) NOT NULL,
  avatar VARCHAR(64),
  contacts VARCHAR(256) NOT NULL
);

CREATE TABLE categories (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(64) NOT NULL UNIQUE
);

CREATE TABLE lots (
  id INT AUTO_INCREMENT PRIMARY KEY,
  create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  name VARCHAR(128) NOT NULL,
  description TEXT NOT NULL,
  img VARCHAR(128) NOT NULL,
  price INT NOT NULL,
  end_time TIMESTAMP NOT NULL,
  step INT NOT NULL,
  creator_id INT NOT NULL,
  winner_id INT,
  category_id INT NOT NULL
);
CREATE INDEX create_time_idx ON lots(create_time);
CREATE INDEX name_idx ON lots(name);
ALTER TABLE lots ADD FOREIGN KEY creator_id REFERENCES users(id) ON DELETE CASCADE;
ALTER TABLE lots ADD FOREIGN KEY winner_id REFERENCES users(id) ON DELETE CASCADE;
ALTER TABLE lots ADD FOREIGN KEY category_id REFERENCES categories(id) ON DELETE CASCADE;

CREATE TABLE rates (
  id INT AUTO_INCREMENT PRIMARY KEY,
  create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  price INT NOT NULL,
  user_id INT NOT NULL,
  lot_id INT NOT NULL
);
CREATE INDEX create_time_idx ON rates(create_time);
ALTER TABLE rates ADD FOREIGN KEY user_id REFERENCES users(id) ON DELETE CASCADE;
ALTER TABLE rates ADD FOREIGN KEY lot_id REFERENCES lots(id) ON DELETE CASCADE;
