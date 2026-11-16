<?php
$input = $modx->getOption('input', $scriptProperties, $modx->getOption('date', $scriptProperties, ''));
if (empty($input)) return '';

$time = strtotime($input);
if (!$time) return '';

$months = [
    '01' => 'Января',  '02' => 'Февраля', '03' => 'Марта',
    '04' => 'Апреля',  '05' => 'Мая',     '06' => 'Июня',
    '07' => 'Июля',    '08' => 'Августа', '09' => 'Сентября',
    '10' => 'Октября', '11' => 'Ноября',  '12' => 'Декабря',
];

$month = date('m', $time);
$day   = (int)date('j', $time);
$year  = date('Y', $time);

return "$day {$months[$month]} $year";