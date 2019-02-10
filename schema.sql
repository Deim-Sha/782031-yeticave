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
  creator_id INT,
  winner_id INT,
  category_id INT
);

CREATE TABLE rates (
  id INT AUTO_INCREMENT PRIMARY KEY,
  time_add TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  price INT NOT NULL,
  user_id INT,
  lot_id INT
);

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  time_reg TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  email VARCHAR(254) NOT NULL UNIQUE,
  name VARCHAR(64) NOT NULL,
  password VARCHAR(16) NOT NULL,
  avatar VARCHAR(64),
  contacts VARCHAR(256) NOT NULL,
  lot_id INT,
  rate_id INT
);