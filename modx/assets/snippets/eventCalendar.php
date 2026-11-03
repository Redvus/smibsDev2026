<?php
/**
 * eventCalendar — генератор календаря по событиям
 * Параметры:
 *  parents — id раздела
 *  depth — глубина
 *  monthsCount — сколько месяцев вперёд (по умолчанию 3)
 */
$parents     = (int) $modx->getOption('parents', $scriptProperties, 18);
$depth       = (int) $modx->getOption('depth', $scriptProperties, 3);
$monthsCount = (int) $modx->getOption('monthsCount', $scriptProperties, 3);

// Получаем все события с датой
$q = $modx->newQuery('modResource');
$q->where([
    'parent:IN' => $modx->getChildIds($parents, $depth),
    'template:!=' => 8,
    'published' => 1,
    'deleted' => 0,
]);
$q->select('id,pagetitle,eventDate,publishedon');
$q->prepare();
$q->stmt->execute();
$events = $q->stmt->fetchAll(PDO::FETCH_ASSOC);

// Группируем по дате (Y-m-d)
$byDate = [];
foreach ($events as $e) {
    $date = !empty($e['eventDate']) ? $e['eventDate'] : $e['publishedon'];
    if (!$date) continue;
    $d = date('Y-m-d', is_numeric($date) ? (int)$date : strtotime($date));
    $byDate[$d][] = $e['id'];
}

// РФ праздники (можно расширять)
$holidays = [
    '01-01','01-02','01-03','01-04','01-05','01-06','01-07','01-08',
    '02-23','03-08','05-01','05-09','06-12','11-04',
    // 2025
    '2025-05-02','2025-05-08','2025-06-13','2025-11-03','2025-12-31',
    // 2026
    '2026-01-09','2026-02-23','2026-03-09','2026-05-01','2026-05-11',
];

// Месяцы, где есть события (текущий + вперёд)
$start = new DateTime('first day of this month');
$months = [];
for ($i = 0; $i < $monthsCount; $i++) {
    $m = clone $start;
    $m->modify("+$i month");
    $key = $m->format('Y-m');
    // показываем месяц, если в нём есть события ИЛИ это текущий
    $hasEvents = false;
    foreach ($byDate as $d => $ids) {
        if (strpos($d, $key) === 0) { $hasEvents = true; break; }
    }
    if ($hasEvents || $i === 0) {
        $months[] = $m;
    }
}

$ruMonths = ['','Январь','Февраль','Март','Апрель','Май','Июнь',
    'Июль','Август','Сентябрь','Октябрь','Ноябрь','Декабрь'];
$ruDaysShort = ['вс','пн','вт','ср','чт','пт','сб'];

$output = '';

// Вкладки месяцев
$output .= '<ul class="section-events__calendar_year">';
foreach ($months as $idx => $m) {
    $active = $idx === 0 ? ' active' : '';
    $output .= '<li class="section-events__calendar_month' . $active . '" 
                    data-month="' . $m->format('Y-m') . '">'
        . $ruMonths[(int)$m->format('n')] . '</li>';
}
$output .= '</ul>';

// Дни по каждому месяцу
foreach ($months as $idx => $m) {
    $display = $idx === 0 ? '' : ' style="display:none"';
    $output .= '<ul class="section-events__calendar_days" 
                    data-month="' . $m->format('Y-m') . '"' . $display . '>';

    $daysInMonth = (int) $m->format('t');
    $firstWeekday = (int) $m->format('N'); // 1=пн ... 7=вс

    for ($day = 1; $day <= $daysInMonth; $day++) {
        $dateObj = new DateTime($m->format('Y-m') . '-' . str_pad($day, 2, '0', STR_PAD_LEFT));
        $dateStr = $dateObj->format('Y-m-d');
        $weekday = (int) $dateObj->format('N');
        $md = $dateObj->format('m-d');

        $classes = [];
        // выходные (сб/вс)
        if ($weekday >= 6) $classes[] = 'section-events__calendar_days--weekend';
        // праздники
        if (in_array($md, $holidays) || in_array($dateStr, $holidays)) {
            $classes[] = 'section-events__calendar_days--holiday';
        }
        // есть события
        $hasEvents = isset($byDate[$dateStr]);
        if ($hasEvents) $classes[] = 'section-events__calendar_days--active';

        $cls = $classes ? ' class="' . implode(' ', $classes) . '"' : '';
        $dataEv = $hasEvents ? ' data-events="' . implode(',', $byDate[$dateStr]) . '"' : '';

        $output .= "<li{$cls} data-date=\"{$dateStr}\"{$dataEv}>"
            . str_pad($day, 2, '0', STR_PAD_LEFT)
            . '<span>' . $ruDaysShort[$weekday % 7] . '</span></li>';
    }
    $output .= '</ul>';
}

return $output;