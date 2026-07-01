// Сниппет: SaveFormForPayment
<?php
/**
 * Сохраняет данные формы в сессию перед редиректом на оплату
 */
$hook = $modx->event->params['hook'];
$values = $hook->getValues();

// Сохраняем в сессию
$_SESSION['form_payment_data'] = [
    'work_type' => $values['work_type'],
    'need_refs' => $values['need_refs'],
    'price' => $values['price'],
    'email' => $values['email'],
    'name' => $values['name'],
    'description' => $values['description']
];

return true;