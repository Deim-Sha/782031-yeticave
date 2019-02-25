INSERT INTO categories (name)
VALUES
  ('Доски и лыжи'),
  ('Крепления'),
  ('Ботинки'),
  ('Одежда'),
  ('Инструменты'),
  ('Разное');

INSERT INTO users (email, name, password, contacts)
VALUES
  ('user01@testmail.ru', 'Иван', 'superpass01', 'Телефон: +7 (999) 001-02-03'),
  ('user02@testmail.ru', 'Константин', 'superpass02', 'Телефон: +7 (000) 003-02-01');

INSERT INTO lots (name, description, img, price, end_time, step, creator_id, winner_id, category_id)
VALUES
  ('2014 Rossignol District Snowboard', 'Хороший сноуборд, почти новый', 'img/lot-1.jpg', 10999, '2019-03-10 00:00:00', 200, 1, NULL, 1),
  ('DC Ply Mens 2016/2017 Snowboard', 'Лучший сноуборд', 'img/lot-2.jpg', 159999, '2019-03-11 00:00:00', 1000, 1, NULL, 1),
  ('Крепления Union Contact Pro 2015 года размер L/XL', 'Отличные крепления для сноуборда', 'img/lot-3.jpg', 8000, '2019-03-12 00:00:00', 100, 1, NULL, 2),
  ('Ботинки для сноуборда DC Mutiny Charocal', 'Ботинки в хорошем состоянии', 'img/lot-4.jpg', 10999, '2019-03-12 00:00:00', 200, 2, NULL, 3),
  ('Куртка для сноуборда DC Mutiny Charocal', 'Очень теплая куртка', 'img/lot-5.jpg', 7500, '2019-03-12 00:00:00', 100, 2, NULL, 4),
  ('Маска Oakley Canopy', 'Удобная маска', 'img/lot-6.jpg', 5400, '2019-03-12 00:00:00', 50, 2, NULL, 6);

INSERT INTO rates (price, user_id, lot_id)
VALUES
  (11199, 2, 1),
  (11399, 2, 1);

-- получает все категории
SELECT *
FROM categories;

-- получает самые новые открытые лоты. Каждый лот включает название, стартовую цену, ссылку на изображение, цену, название категории
SELECT l.id, l.name AS lot, l.price AS start_price, img, r.price AS price, c.name AS category
FROM lots l
  JOIN rates r
  ON l.id = r.lot_id
  JOIN categories c
  ON l.category_id = c.id
WHERE l.winner_id IS NULL
GROUP BY l.id
ORDER BY l.create_time DESC;

-- показывает лот по его id и название категории, к которой принадлежит лот
SELECT l.id, l.name AS lot, c.name AS category
FROM lots l
  JOIN categories c
  ON l.category_id = c.id
WHERE l.id = 2;

-- обновляет название лота по его идентификатору
UPDATE lots
SET name = 'Крепления Union Contact Pro'
WHERE id = 3;

-- получает список самых свежих ставок для лота по его идентификатору
SELECT r.price AS rate, r.create_time, l.name AS lot
FROM rates r
  JOIN lots l
  ON r.lot_id = l.id
WHERE l.id = 1
ORDER BY r.price DESC;
