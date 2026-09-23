<?php
/**
 * DynamicFormHandler - обрабатывает разные типы форм
 *
 * @var modX $modx
 * @var fiHooks $hook
 */

$hook = $modx->event->params['hook'];
$values = $hook->getValues();

// Получаем тип формы из скрытого поля
$formType = isset($values['form_type']) ? $values['form_type'] : '';

// Если это форма межбиблиотечного абонемента
if ($formType == 'interlibrary') {
    // Валидация уже выполнена, просто настраиваем email

    // Массив email-адресов для филиалов
    $emails = [
        '0' => 'osamlib@mail.ru',
        '1' => 'smibs1@yandex.ru',
        '2' => 'smibs2@yandex.ru',
        '3' => 'smibs3@yandex.ru',
        '4' => 'smibs.4@yandex.ru',
        '5' => 'smibs5@yandex.ru',
        '6' => 'smibs6@yandex.ru',
        '7' => 'smibs7@yandex.ru',
        '8' => 'smibs8@yandex.ru',
        '9' => 'smibs9@yandex.ru',
        '10' => 'smibs10@yandex.ru',
        '11' => 'smibs11@yandex.ru',
        '12' => 'smibs12@yandex.ru',
        '13' => 'smibs13@yandex.ru',
        '14' => 'smibs14@yandex.ru',
        '15' => 'smibs15@yandex.ru',
        '16' => 'smibs16@yandex.ru',
        '17' => 'smibs17@yandex.ru',
        '18' => 'smibs18@yandex.ru',
        '19' => 'smibs.19@yandex.ru',
        '20' => 'smibs20@yandex.ru',
        '21' => 'smibs21@yandex.ru',
        '22' => 'smibs22@yandex.ru',
        '23' => 'smibs23@yandex.ru',
        '24' => 'smibs24@yandex.ru',
        '25' => 'smibs25@yandex.ru',
        '26' => 'smibs26@yandex.ru',
        '27' => 'smibs27@yandex.ru',
        '28' => 'smibs28@yandex.ru',
        '29' => 'smibs-29@yandex.ru',
        '30' => 'smibs30@yandex.ru',
        '31' => 'smibs31@yandex.ru',
        '32' => 'smibs32@yandex.ru',
        '33' => 'smibs33@yandex.ru',
        '34' => 'smibs34@yandex.ru',
        '35' => 'smibs35@yandex.ru',
        '36' => 'a.suvorof@gmail.com'
    ];

    // Определяем email для отправки
    $selectedLibrary = isset($values['numberLibrary']) ? $values['numberLibrary'] : '0';
    $emailTo = isset($emails[$selectedLibrary]) ? $emails[$selectedLibrary] : 'osamlib@mail.ru';

    // Устанавливаем параметры для отправки
    $hook->setValue('emailTpl', 'interlibraryEmailTpl');
    $hook->setValue('emailSubject', 'СМИБС. Заказ книг онлайн');
    $hook->setValue('emailFrom', $modx->getOption('emailsender'));
    $hook->setValue('emailFromName', $modx->getOption('site_name'));
    $hook->setValue('emailTo', $emailTo);
    $hook->setValue('redirectTo', 456);
    $hook->setValue('successMessage', 'Спасибо! Ваша заявка отправлена. В ближайшее время мы с Вами свяжемся!');
}

return true;