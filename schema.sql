CREATE DATABASE yeticave
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;

USE yeticave;

CREATE TABLE categories (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(64) NOT NULL UNIQUE
);

CREATE TABLE lots (
  id INT AUTO_INCREMENT PRIMARY KEY,
  time_add TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  name VARCHAR(128) NOT NULL,
  description TEXT NOT NULL,
  img VARCHAR(64) NOT NULL,
  price INT NOT NULL,
  time_end TIMESTAMP NOT NULL,
  step INT NOT NULL,
  creator_id INT NOT NULL,
  winner_id INT,
  category_id INT NOT NULL
);
CREATE INDEX time_add_idx ON lots(time_add);
CREATE INDEX name_idx ON lots(name);
CREATE INDEX creator_id_idx ON lots(creator_id);
CREATE INDEX winner_id_idx ON lots(winner_id);
CREATE INDEX category_id_idx ON lots(category_id);

CREATE TABLE rates (
  id INT AUTO_INCREMENT PRIMARY KEY,
  time_add TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  price INT NOT NULL,
  user_id INT NOT NULL,
  lot_id INT NOT NULL
);
CREATE INDEX time_add_idx ON rates(time_add);
CREATE INDEX user_id_idx ON rates(user_id);
CREATE INDEX lot_id_idx ON rates(lot_id);

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  time_reg TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  email VARCHAR(254) NOT NULL UNIQUE,
  name VARCHAR(64) NOT NULL,
  password VARCHAR(16) NOT NULL,
  avatar VARCHAR(64),
  contacts VARCHAR(256) NOT NULL
);
