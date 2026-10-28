<?php
$migx_json = $modx->resource->getTVValue('articleImg'); // Имя вашего ТВ
$gallery = $modx->fromJSON($migx_json);

if (empty($gallery) || empty($id)) return '';

// Разбиваем строку по запятым, убираем случайные пробелы
$ids = array_filter(array_map('trim', explode(',', $id)));
// Сниппет САМ считает количество переданных ID
$cols = count($ids);

// Защита: если картинок больше 3, ограничим сетку тремя колонками, чтобы верстка не поехала
if ($cols > 3) {
    $grid_cols = 3;
} else {
    $grid_cols = $cols;
}

$grid_class = 'article-image-grid grid-cols-' . $grid_cols;
$output = '';

foreach ($ids as $single_id) {
    $index = (int)$single_id - 1;

    if (isset($gallery[$index])) {
        $item = $gallery[$index];

        $output .= '<div class="article-image-item">';
        $output .= '<img src="' . $item['image'] . '" alt="' . htmlspecialchars($item['title'] ?? '') . '" class="article-inline-img">';
        if (!empty($item['title'])) {
            $output .= '<span class="image-caption">' . htmlspecialchars($item['title']) . '</span>';
        }
        $output .= '</div>';
    }
}

if (!empty($output)) {
    return '<div class="' . $grid_class . '">' . $output . '</div>';
}

return '';