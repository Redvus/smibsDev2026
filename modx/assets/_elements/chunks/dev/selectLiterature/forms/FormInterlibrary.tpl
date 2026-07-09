{*
    FormInterlibrary - Форма межбиблиотечного абонемента
    Использует встроенный AJAX FormIt (без jQuery)
*}

<div class="form-payment__container form-payment__ru">
    <h2 class="form-payment__title simple-title">Заявка на межбиблиотечный абонемент</h2>

    <form class="form form-payment--loading"
        action="[[~[[*id]]]]"
        method="post"
        data-formit-ajax-token="{$_modx->getPlaceholder('fi.ajaxToken')}"
        data-formit-ajax-redirect="{$fi.redirectTo}">

        {* Скрытое поле для идентификации формы *}
        <input type="hidden" name="active_form_id" value="form_3">
        <input type="hidden" name="form_type" value="interlibrary">

        {* Общие сообщения *}
        <div data-formit-validation-error-message class="alert alert-danger" style="display:none;">
            {$_modx->getPlaceholder('fi.validation_error_message')}
        </div>
        <div data-formit-success-message class="alert alert-success" style="display:none;">
            {$_modx->getPlaceholder('fi.successMessage')}
        </div>

        <div class="form-payment__container_body">

            {* 1. Фамилия Имя Отчество *}
            {set $field = 'name'}
            <div class="field">
                <label class="field__label" for="{$field}">Фамилия Имя Отчество *</label>
                <input class="field__input {$_modx->getPlaceholder("fi.error.{$field}" ) ? 'is-invalid' : '' }"
                    name="{$field}" type="text" id="{$field}" placeholder="Фамилия Имя Отчество" autocomplete="off"
                    autocorrect="off" spellcheck="false" value="{$_modx->getPlaceholder("fi.{$field}" )}">
                <span data-formit-error="{$field}" class="field__error">
                    {$_modx->getPlaceholder("fi.error.{$field}")}
                </span>
            </div>

            {* 2. Возраст *}
            {set $field = 'age'}
            <div class="field">
                <label class="field__label" for="{$field}">Возраст *</label>
                <input class="field__input {$_modx->getPlaceholder("fi.error.{$field}" ) ? 'is-invalid' : '' }"
                    name="{$field}" type="text" id="{$field}" placeholder="Возраст" autocomplete="off"
                    autocorrect="off" spellcheck="false" value="{$_modx->getPlaceholder("fi.{$field}" )}">
                <span data-formit-error="{$field}" class="field__error">
                    {$_modx->getPlaceholder("fi.error.{$field}")}
                </span>
            </div>

            {* 3. Телефон *}
            {set $field = 'phone'}
            <div class="field">
                <label class="field__label" for="{$field}">Телефон *</label>
                <input class="field__input {$_modx->getPlaceholder("fi.error.{$field}" ) ? 'is-invalid' : '' }"
                    name="{$field}" type="text" id="{$field}" placeholder="Телефон" autocomplete="off"
                    autocorrect="off" spellcheck="false" value="{$_modx->getPlaceholder("fi.{$field}" )}">
                <span data-formit-error="{$field}" class="field__error">
                    {$_modx->getPlaceholder("fi.error.{$field}")}
                </span>
            </div>

            {* 4. Автор *}
            {set $field = 'author'}
            <div class="field">
                <label class="field__label" for="{$field}">Автор *</label>
                <input class="field__input {$_modx->getPlaceholder("fi.error.{$field}" ) ? 'is-invalid' : '' }"
                    name="{$field}" type="text" id="{$field}" placeholder="Автор" autocomplete="off"
                    autocorrect="off" spellcheck="false" value="{$_modx->getPlaceholder("fi.{$field}" )}">
                <span data-formit-error="{$field}" class="field__error">
                    {$_modx->getPlaceholder("fi.error.{$field}")}
                </span>
            </div>

            {* 5. Заглавие *}
            {set $field = 'title'}
            <div class="field">
                <label class="field__label" for="{$field}">Заглавие *</label>
                <input class="field__input {$_modx->getPlaceholder("fi.error.{$field}" ) ? 'is-invalid' : '' }"
                    name="{$field}" type="text" id="{$field}" placeholder="Заглавие" autocomplete="off"
                    autocorrect="off" spellcheck="false" value="{$_modx->getPlaceholder("fi.{$field}" )}">
                <span data-formit-error="{$field}" class="field__error">
                    {$_modx->getPlaceholder("fi.error.{$field}")}
                </span>
            </div>

            {* 6. Год издания *}
            {set $field = 'yearPublish'}
            <div class="field">
                <label class="field__label" for="{$field}">Год издания</label>
                <input class="field__input {$_modx->getPlaceholder("fi.error.{$field}" ) ? 'is-invalid' : '' }"
                    name="{$field}" type="text" id="{$field}" placeholder="Год издания" autocomplete="off"
                    autocorrect="off" spellcheck="false" value="{$_modx->getPlaceholder("fi.{$field}" )}">
                <span data-formit-error="{$field}" class="field__error">
                    {$_modx->getPlaceholder("fi.error.{$field}")}
                </span>
            </div>

            {* 7. Место издания *}
            {set $field = 'placePublish'}
            <div class="field">
                <label class="field__label" for="{$field}">Место издания</label>
                <input class="field__input {$_modx->getPlaceholder("fi.error.{$field}" ) ? 'is-invalid' : '' }"
                    name="{$field}" type="text" id="{$field}" placeholder="Место издания" autocomplete="off"
                    autocorrect="off" spellcheck="false" value="{$_modx->getPlaceholder("fi.{$field}" )}">
                <span data-formit-error="{$field}" class="field__error">
                    {$_modx->getPlaceholder("fi.error.{$field}")}
                </span>
            </div>

            {* 8. Том (для многотомных изданий) *}
            {set $field = 'numberBook'}
            <div class="field">
                <label class="field__label" for="{$field}">Том (для многотомных изданий)</label>
                <input class="field__input {$_modx->getPlaceholder("fi.error.{$field}" ) ? 'is-invalid' : '' }"
                    name="{$field}" type="text" id="{$field}" placeholder="Том (для многотомных изданий)" autocomplete="off"
                    autocorrect="off" spellcheck="false" value="{$_modx->getPlaceholder("fi.{$field}" )}">
                <span data-formit-error="{$field}" class="field__error">
                    {$_modx->getPlaceholder("fi.error.{$field}")}
                </span>
            </div>

            {* Филиал для доставки *}
            {set $field = 'numberLibrary'}
            {set $libraries = [
                '0' => 'ЦГБ',
                '1' => 'Библиотека №1',
                '2' => 'Библиотека №2',
                '3' => 'Библиотека №3',
                '4' => 'Библиотека №4',
                '5' => 'Библиотека №5',
                '6' => 'Библиотека №6',
                '7' => 'Библиотека №7',
                '8' => 'Библиотека №8',
                '9' => 'Библиотека №9',
                '10' => 'Библиотека №10',
                '11' => 'Библиотека №11',
                '12' => 'Библиотека №12',
                '13' => 'Библиотека №13',
                '14' => 'Библиотека №14',
                '15' => 'Библиотека №15',
                '16' => 'Библиотека №16',
                '17' => 'Библиотека №17',
                '18' => 'Библиотека №18',
                '19' => 'Библиотека №19',
                '20' => 'Библиотека №20',
                '21' => 'Библиотека №21',
                '22' => 'Библиотека №22',
                '23' => 'Библиотека №23',
                '24' => 'Библиотека №24',
                '25' => 'Библиотека №25',
                '26' => 'Библиотека №26',
                '27' => 'Библиотека №27',
                '28' => 'Библиотека №28',
                '29' => 'Библиотека №29',
                '30' => 'Библиотека №30',
                '31' => 'Библиотека №31',
                '32' => 'Библиотека №32',
                '33' => 'Библиотека №33',
                '34' => 'Библиотека №34',
                '35' => 'Библиотека №35',
                '36' => 'test'
            ]}

            <div class="field">
                <label class="field__label" for="{$field}">Филиал для доставки *</label>
                <select class="field__select {$_modx->getPlaceholder("fi.error.{$field}") ? 'is-invalid' : ''}"
                        name="{$field}"
                        id="{$field}">
                    <option value="" disabled selected>Выберите филиал для доставки</option>
                    {foreach $libraries as $value => $label}
                        <option value="{$value}" {$_modx->getPlaceholder("fi.{$field}") == $value ? 'selected' : ''}>
                            {$label}
                        </option>
                    {/foreach}
                </select>
                <span data-formit-error="{$field}" class="field__error">
                    {$_modx->getPlaceholder("fi.error.{$field}")}
                </span>
            </div>

            {* 4. Количество источников (слайдер) *}
            {set $minCount = 1}
            {set $maxCount = 10}
            {set $priceCount = 50}
            {set $need_refs = $_modx->getPlaceholder('fi.need_refs') ?: $minCount}

            <div class="field">
                <label class="field__label" for="7f3hxdzaic">Количество источников</label>
                <div class="slider__container field__count">
                    <div class="slider">
                        <span class="slider__min">{$minCount}</span>
                        <label class="slider__input-container">
                            <input name="need_refs" type="range" min="{$minCount}" max="{$maxCount}" step="1"
                                class="slider__input" value="{$need_refs}">
                            <span class="slider__input-track"></span>
                            <span class="slider__input-progress"
                                style="width: {($need_refs - $minCount) / ($maxCount - $minCount) * 100}%;"></span>
                        </label>
                        <span class="slider__max">{$maxCount}</span>
                    </div>
                    <input id="7f3hxdzaic" name="need_refs_display" type="text" class="slider__current"
                        value="{$need_refs}">
                </div>
            </div>

            {* Email *}
            {set $field = 'email'}
            <div class="field">
                <label class="field__label" for="{$field}">Ваш Email для связи *</label>
                <input class="field__input {$_modx->getPlaceholder("fi.error.{$field}" ) ? 'is-invalid' : '' }"
                    name="{$field}" type="email" id="{$field}" placeholder="example@mail.ru" autocomplete="email"
                    autocorrect="off" spellcheck="false" value="{$_modx->getPlaceholder("fi.{$field}" )}">
                <span data-formit-error="{$field}" class="field__error">
                    {$_modx->getPlaceholder("fi.error.{$field}")}
                </span>
            </div>

            {* reCAPTCHA *}
            <div class="field recaptcha__field">
                {* Здесь код reCAPTCHA, если используется *}
            </div>

        </div>

        {* Футер *}
        <div class="form-payment__container_footer">
            <div class="payment">
                <div class="price">
                    <span class="price-label">Стоимость:</span>
                    <span>
                        <span class="price-value" id="priceValue">
                            {$priceCount * $need_refs}&nbsp;₽
                        </span>
                        <span class="price-helper-wrapper">
                            <span class="price-helper" role="button" aria-label="Информация о стоимости">?</span>
                            <div class="price-helper-tooltip">
                                <div class="tooltip-content">
                                    <div class="tooltip">
                                        <span class="tooltip__label">Количество источников:</span>
                                        <span id="tooltipRefs" class="tooltip__value">{$need_refs}</span>
                                    </div>
                                    <div class="tooltip">
                                        <span class="tooltip__label">Цена за источник:</span>
                                        <span id="tooltipPricePerSource" class="tooltip__value">{$priceCount} ₽</span>
                                    </div>
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