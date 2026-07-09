{*
    selectLitForm - Форма подбора литературы
    Использует встроенный AJAX FormIt (без jQuery)
*}

<div class="form-payment__container form-payment__ru">
    <h2 class="form-payment__title simple-title">Заявка на составление<br>библиографического списка литературы</h2>

    <form class="form form-payment--loading"
        action="[[~[[*id]]]]"
        method="post"
        data-formit-ajax-token="{$_modx->getPlaceholder('fi.ajaxToken')}"
        data-formit-ajax-redirect="{$fi.redirectTo}">

        {* Скрытое поле для идентификации формы *}
        <input type="hidden" name="active_form_id" value="form_4">
        <input type="hidden" name="form_type" value="default">

        {* Общие сообщения *}
        <div data-formit-validation-error-message class="alert alert-danger" style="display:none;">
            {$_modx->getPlaceholder('fi.validation_error_message')}
        </div>
        <div data-formit-success-message class="alert alert-success" style="display:none;">
            {$_modx->getPlaceholder('fi.successMessage')}
        </div>

        <div class="form-payment__container_body">

            {* 1. Тема работы *}
            {set $field = 'name'}
            <div class="field">
                <label class="field__label" for="{$field}">Тема работы</label>
                <input class="field__input {$_modx->getPlaceholder("fi.error.{$field}" ) ? 'is-invalid' : '' }"
                    name="{$field}" type="text" id="{$field}" placeholder="Введите тему работы" autocomplete="off"
                    autocorrect="off" spellcheck="false" value="{$_modx->getPlaceholder("fi.{$field}" )}">
                <span data-formit-error="{$field}" class="field__error">
                    {$_modx->getPlaceholder("fi.error.{$field}")}
                </span>
            </div>

            {* 2. Аспекты темы *}
            {set $field = 'description'}
            <div class="field">
                <label class="field__label" for="{$field}">Аспекты, раскрывающие и конкретизирующие тему</label>
                <textarea class="field__textarea {$_modx->getPlaceholder("fi.error.{$field}" ) ? 'is-invalid' : '' }"
                    name="{$field}" id="{$field}" placeholder="Опишите, какие аспекты нужно раскрыть" autocomplete="off"
                    autocorrect="off" spellcheck="false">{$_modx->getPlaceholder("fi.{$field}")}</textarea>
                <span data-formit-error="{$field}" class="field__error">
                    {$_modx->getPlaceholder("fi.error.{$field}")}
                </span>
            </div>

            {* 3. Ключевые слова *}
            {set $field = 'keywords'}
            <div class="field">
                <label class="field__label" for="{$field}">Ключевые слова, область знаний или специальность</label>
                <input class="field__input {$_modx->getPlaceholder("fi.error.{$field}" ) ? 'is-invalid' : '' }"
                    name="{$field}" type="text" id="{$field}"
                    placeholder="Например: искусственный интеллект, машинное обучение" autocomplete="off"
                    autocorrect="off" spellcheck="false" value="{$_modx->getPlaceholder("fi.{$field}" )}">
                <span data-formit-error="{$field}" class="field__error">
                    {$_modx->getPlaceholder("fi.error.{$field}")}
                </span>
            </div>

            {* 6. Возраст источника (выпадающий список) *}
            {set $refs_max_age = $_modx->getPlaceholder('fi.refs_max_age') ?: 0}
            <div class="field">
                <label class="field__label" for="refs_max_age">Возраст источника</label>
                <select class="field__select {$_modx->getPlaceholder('fi.error.refs_max_age') ? 'is-invalid' : ''}"
                    name="refs_max_age" id="refs_max_age">
                    <option value="0" {$refs_max_age == 0 ? 'selected' : ''}>Не важно</option>
                    <option value="365" {$refs_max_age == 365 ? 'selected' : ''}>1 год</option>
                    <option value="730" {$refs_max_age == 730 ? 'selected' : ''}>2 года</option>
                    <option value="1095" {$refs_max_age == 1095 ? 'selected' : ''}>3 года</option>
                    <option value="1825" {$refs_max_age == 1825 ? 'selected' : ''}>5 лет</option>
                    <option value="3650" {$refs_max_age == 3650 ? 'selected' : ''}>10 лет</option>
                </select>
                <span data-formit-error="refs_max_age" class="field__error">
                    {$_modx->getPlaceholder('fi.error.refs_max_age')}
                </span>
            </div>

            {* 11. Email *}
            {set $field = 'email'}
            <div class="field">
                <label class="field__label" for="{$field}">Ваш Email для связи</label>
                <input class="field__input {$_modx->getPlaceholder("fi.error.{$field}" ) ? 'is-invalid' : '' }"
                    name="{$field}" type="email" id="{$field}" placeholder="example@mail.ru" autocomplete="email"
                    autocorrect="off" spellcheck="false" value="{$_modx->getPlaceholder("fi.{$field}" )}">
                <span data-formit-error="{$field}" class="field__error">
                    {$_modx->getPlaceholder("fi.error.{$field}")}
                </span>
            </div>

            {* 12. reCAPTCHA (если нужна) *}
            <div class="field recaptcha__field">
                {* Здесь код reCAPTCHA, если используется *}
            </div>

        </div>

        {* Футер с оплатой *}
        <div class="form-payment__container_footer">
            <div class="payment">
                <div class="price">
                    <span class="price-label">Стоимость:</span>
                    <span>
                        <span class="price-value" id="priceValue">
                            500&nbsp;₽
                        </span>

                        {* <a href="/price" class="price-helper">?</a> *}
                        <span class="price-helper-wrapper">
                            <span class="price-helper" role="button" aria-label="Информация о стоимости">?</span>
                            <div class="price-helper-tooltip">
                                <div class="tooltip-content">
                                    {* <div class="tooltip-row">
                                        <span>Тип работы:</span>
                                        <span id="tooltipWorkType">Библиографический списка литературы</span>
                                    </div> *}
                                    <div class="tooltip">
                                        <span class="tooltip__label">Количество источников:</span>
                                        <span id="tooltipRefs" class="tooltip__value">Цена не&nbsp;зависит от&nbsp;количества</span>
                                    </div>
                                    {* <div class="tooltip-row">
                                        <span>Цена за источник:</span>
                                        <span id="tooltipPricePerSource">500&nbsp;₽</span>
                                    </div> *}
                                    {* <div class="tooltip-row">
                                    <span>Базовая стоимость:</span>
                                    <span>100 ₽</span>
                                </div> *}
                                    {* <div class="tooltip-row tooltip-row--total">
                                    <span>Итого:</span>
                                    <span id="tooltipTotal">{($work_types[$work_type].price * $need_refs) + 100} ₽</span>
                                </div> *}
                                </div>
                            </div>
                        </span>
                    </span>
                </div>
                <div class="btn-container">
                    <button type="submit" class="btn btn--base">
                        Отправить заявку
                    </button>
                </div>
            </div>
        </div>
    </form>
</div>