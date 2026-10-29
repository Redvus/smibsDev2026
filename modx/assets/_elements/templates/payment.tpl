{* Страница оплаты (ID 123) *}
<div class="payment-page">
    <h2>Оплата заявки</h2>

    {* Здесь будет форма оплаты *}
    {* Например, через платежную систему *}

    <div class="payment-summary">
        <h3>Детали заказа</h3>
        <p><strong>Тип работы:</strong> {$_modx->getPlaceholder('fi.work_type')}</p>
        <p><strong>Количество источников:</strong> {$_modx->getPlaceholder('fi.need_refs')}</p>
        <p><strong>Стоимость:</strong> <span id="paymentAmount">{$_modx->getPlaceholder('fi.price')} ₽</span></p>
    </div>

    {* Кнопка оплаты *}
    <button id="payButton" class="btn btn-primary">
        Оплатить {$_modx->getPlaceholder('fi.price')} ₽
    </button>
</div>