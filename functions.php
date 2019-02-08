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

function formatPrice($price)
{
    $price_int = ceil($price);
    if ($price_int <= 1000) {
        return $price_int . " &#8381";
    }
    return number_format($price_int, 0, null, ' ') . " &#8381";
}

function createTimer()
{
    date_default_timezone_set("Europe/Moscow");
    $time_now = date_create("now");
    $time_end = date_create("tomorrow");
    $time_diff = date_diff($time_end, $time_now);

    return date_interval_format($time_diff, "%H:%I");
}
