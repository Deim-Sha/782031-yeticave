<?php
date_default_timezone_set("Europe/Moscow");

require_once 'functions.php';
require_once 'config.php';

$is_auth = rand(0, 1);
$user_name = 'Екатерина';

$link = setDbConnection($db);
$categories = getCategories($link);
$lots = getLots($link);

$content = include_template('index.php', [
    'categories' => $categories,
    'lots' => $lots
]);

$layout = include_template('layout.php', [
    'title' => 'Главная',
    'is_auth' => $is_auth,
    'user_name' => $user_name,
    'content' => $content,
    'categories' => $categories
]);

print($layout);
