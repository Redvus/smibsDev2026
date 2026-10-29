<?php
// assets/snippets/FormRouter.php
$hook = $modx->event->params['hook'];
$values = $hook->getValues();

// Логируем для отладки
$modx->log(modX::LOG_LEVEL_ERROR, '=== FormRouter START ===');
$modx->log(modX::LOG_LEVEL_ERROR, 'Values: ' . print_r($values, true));

// Определяем тип формы по скрытому полю
$formType = isset($values['form_type']) ? $values['form_type'] : '';
$activeFormId = isset($values['active_form_id']) ? $values['active_form_id'] : '';

$modx->log(modX::LOG_LEVEL_ERROR, 'form_type: ' . $formType);
$modx->log(modX::LOG_LEVEL_ERROR, 'active_form_id: ' . $activeFormId);

// Если это форма 3 (межбиблиотечный абонемент)
if ($formType == 'interlibrary' || $activeFormId == 'form_3') {
    $modx->log(modX::LOG_LEVEL_ERROR, '✅ Это форма 3! Применяем параметры...');

    // Дополнительная валидация для формы 3
    $requiredFields = ['age', 'phone', 'author', 'title', 'numberLibrary'];
    $errors = [];

    foreach ($requiredFields as $field) {
        if (empty($values[$field])) {
            $errors[$field] = 'Поле обязательно для заполнения';
        }
    }

    // Если есть ошибки - возвращаем false с сообщениями
    if (!empty($errors)) {
        foreach ($errors as $field => $message) {
            $hook->addError($field, $message);
        }
        return false;
    }

    // Меняем параметры для формы 3
    $hook->setValue('emailTpl', 'interlibraryEmailTpl');
    $hook->setValue('emailSubject', 'СМИБС. Заказ книг онлайн');
    $hook->setValue('emailFrom', $modx->getOption('emailsender'));
    $hook->setValue('emailFromName', $modx->getOption('site_name'));

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

    $selectedLibrary = isset($values['numberLibrary']) ? $values['numberLibrary'] : '0';
    $emailTo = isset($emails[$selectedLibrary]) ? $emails[$selectedLibrary] : 'osamlib@mail.ru';

    $hook->setValue('emailTo', $emailTo);
    $hook->setValue('redirectTo', 456);
    $hook->setValue('successMessage', 'Спасибо! Ваша заявка отправлена. В ближайшее время мы с Вами свяжемся!');

    $modx->log(modX::LOG_LEVEL_ERROR, '✅ Email для отправки: ' . $emailTo);
} else {
    $modx->log(modX::LOG_LEVEL_ERROR, '📌 Это форма 1, 2 или 4');

    // Для остальных форм
    $hook->setValue('emailTpl', 'selectLitFormEmailTpl');
    $hook->setValue('emailSubject', 'Новая заявка на подбор литературы');
    $hook->setValue('emailTo', $modx->getOption('bibliographer_email'));
    $hook->setValue('redirectTo', 123);
    $hook->setValue('successMessage', 'Ваша заявка отправлена! Вы будете перенаправлены на страницу оплаты.');
}

return true;