<?php
function include_template($name, $data) {
    $name = 'templates/' . $name;
    $result = '';

    if (!is_readable($name)) {
        return $result;
    }

    ob_start();
    extract($data);
    require $name;

    $result = ob_get_clean();

    return $result;
}

function setDbConnection($db_config)
{
    $link = mysqli_connect($db_config['host'], $db_config['user'], $db_config['password'], $db_config['name']);

    if (!$link) {
        die("Ошибка: Невозможно подключиться к MySQL " . mysqli_connect_error());
    }
    mysqli_set_charset($link, 'utf8');
    return $link;
}

function getCategories($link)
{
    $sql = 'SELECT * FROM categories';
    $result = mysqli_query($link, $sql);
    $categories = mysqli_fetch_all($result, MYSQLI_ASSOC);
    return $categories;
}

function getLots($link)
{
    $sql = 'SELECT l.name, price, img, c.name AS category, end_time
    FROM lots l
      JOIN categories c
      ON l.category_id = c.id
    WHERE l.winner_id IS NULL
    GROUP BY l.id
    ORDER BY l.create_time DESC';
    $result = mysqli_query($link, $sql);
    $lots = mysqli_fetch_all($result, MYSQLI_ASSOC);
    return $lots;
}

function formatPrice($price)
{
    $price_int = ceil($price);
    if ($price_int <= 1000) {
        return $price_int . " &#8381";
    }
    return number_format($price_int, 0, null, ' ') . " &#8381";
}

function createTimer($end_time)
{
    $time_now = date_create("now");
    $time_end = date_create($end_time);
    $time_diff = date_diff($time_end, $time_now);

    return date_interval_format($time_diff, "%Dд %H:%I");
}
