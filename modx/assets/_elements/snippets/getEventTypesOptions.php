<?php
$tvName      = $modx->getOption('tv', $scriptProperties, 'calendarEventsTermsList');
$placeholder = $modx->getOption('placeholder', $scriptProperties, 'Выберите поле');

$tv = $modx->getObject('modTemplateVar', ['name' => $tvName]);
if (!$tv) return '';

$value = $tv->get('elements');
if (empty($value)) return '';

$items = explode('||', $value);

$out = '';
if ($placeholder !== '') {
    $out .= '<option value="">' . htmlspecialchars($placeholder) . '</option>';
}

foreach ($items as $item) {
    $item = trim($item);
    if ($item === '') continue;

    $parts = explode('==', $item);
    $text = trim($parts[0]);
    $val  = isset($parts[1]) ? trim($parts[1]) : $text;

    $out .= '<option value="' . htmlspecialchars($val) . '">'
        . htmlspecialchars($text) . '</option>';
}
return $out;