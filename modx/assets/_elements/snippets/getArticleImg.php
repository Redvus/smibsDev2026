<?php
$migx_json = $modx->resource->getTVValue('articleImgList'); // Имя вашего ТВ
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

// Задаем параметры phpthumb в зависимости от количества колонок
// Размеры и пропорции будут идеально адаптироваться под сетку
if ($grid_cols === 3) {
    // Для 3 колонок: исходный формат w=210&h=300 (вертикальные карточки)
    $thumb_options = 'h=300%&zc=1&q=85';
} elseif ($grid_cols === 2) {
    // Для 2 колонок: пропорционально увеличиваем ширину и высоту
    $thumb_options = 'h=300&zc=1&q=85';
} else {
    // Для 1 колонки: делаем изображение крупным (например, горизонтальным или квадратным по вкусу)
    // Если вам нужно сохранить пропорции оригинала для одной картинки, замените на 'w=900&q=85'
    $thumb_options = 'h=400&zc=1&q=85';
}

$grid_class = 'section-page__image-grid section-page__image-grid--' . $grid_cols;
$output = '';

foreach ($ids as $single_id) {
    $index = (int)$single_id - 1;

    if (isset($gallery[$index])) {
        $item = $gallery[$index];
        $raw_image = $item['articleImg'];

        // Вызываем phpthumb аналогично модификатору в Fenom/Chunk
        $compressed_image = $modx->runSnippet('phpthumbof', [
            'input' => $raw_image,
            'options' => $thumb_options
        ]);

        // Если phpthumb не отработал, берем оригинальный путь к картинке
        $final_image = !empty($compressed_image) ? $compressed_image : $raw_image;

        $output .= '<picture class="section-page__image-item">';
        // loading="lazy" заставит браузер загружать картинки только при скролле (отлично для SEO)
        $output .= '<img src="' . $final_image . '" alt="' . htmlspecialchars($item['articleImgAlt'] ?? '') . '" class="section-page__img" loading="lazy">';
        $output .= '</picture>';
    }
}

if (!empty($output)) {
    return '<div class="' . $grid_class . '">' . $output . '</div>';
}

return '';