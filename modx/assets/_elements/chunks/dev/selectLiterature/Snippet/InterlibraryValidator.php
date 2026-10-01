<?php
$hook = $modx->event->params['hook'];
$values = $hook->getValues();

// Проверяем, что это форма межбиблиотечного абонемента
if (isset($values['form_type']) && $values['form_type'] == 'interlibrary') {
    $errors = [];

    // Проверяем каждое поле
    $requiredFields = ['name', 'age', 'phone', 'author', 'title', 'numberLibrary', 'email'];
    foreach ($requiredFields as $field) {
        if (empty($values[$field])) {
            $errors[$field] = 'Поле обязательно для заполнения';
        }
    }

    // Если есть ошибки - возвращаем false
    if (!empty($errors)) {
        foreach ($errors as $field => $message) {
            $hook->addError($field, $message);
        }
        return false;
    }
}

return true;