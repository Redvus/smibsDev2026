{*
    selectLitForm - Форма подбора литературы
    Использует встроенный AJAX FormIt (без jQuery)
*}

<form class="form form-payment--loading"
      action="[[~[[*id]]]]"
      method="post"
      data-formit-ajax-token="{$_modx->getPlaceholder('fi.ajaxToken')}"
      data-formit-ajax-redirect="{$fi.redirectTo}">

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
            <input class="field__input {$_modx->getPlaceholder("fi.error.{$field}") ? 'is-invalid' : ''}"
                   name="{$field}"
                   type="text"
                   id="{$field}"
                   placeholder="Введите тему работы"
                   autocomplete="off"
                   autocorrect="off"
                   spellcheck="false"
                   value="{$_modx->getPlaceholder("fi.{$field}")}">
            <span data-formit-error="{$field}" class="field__error">
                {$_modx->getPlaceholder("fi.error.{$field}")}
            </span>
        </div>

        {* 2. Аспекты темы *}
        {set $field = 'description'}
        <div class="field">
            <label class="field__label" for="{$field}">Аспекты, раскрывающие и конкретизирующие тему</label>
            <textarea class="field__textarea {$_modx->getPlaceholder("fi.error.{$field}") ? 'is-invalid' : ''}"
                      name="{$field}"
                      id="{$field}"
                      placeholder="Опишите, какие аспекты нужно раскрыть"
                      autocomplete="off"
                      autocorrect="off"
                      spellcheck="false">{$_modx->getPlaceholder("fi.{$field}")}</textarea>
            <span data-formit-error="{$field}" class="field__error">
                {$_modx->getPlaceholder("fi.error.{$field}")}
            </span>
        </div>

        {* 3. Ключевые слова *}
        {set $field = 'keywords'}
        <div class="field">
            <label class="field__label" for="{$field}">Ключевые слова, область знаний или специальность</label>
            <input class="field__input {$_modx->getPlaceholder("fi.error.{$field}") ? 'is-invalid' : ''}"
                   name="{$field}"
                   type="text"
                   id="{$field}"
                   placeholder="Например: искусственный интеллект, машинное обучение"
                   autocomplete="off"
                   autocorrect="off"
                   spellcheck="false"
                   value="{$_modx->getPlaceholder("fi.{$field}")}">
            <span data-formit-error="{$field}" class="field__error">
                {$_modx->getPlaceholder("fi.error.{$field}")}
            </span>
        </div>

        {* 4. Количество источников (слайдер) *}
        {set $minCount = 1}
        {set $maxCount = 50}
        {set $priceCount = 30}
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
                        <span class="slider__input-progress" style="width: {($need_refs - $minCount) / ($maxCount - $minCount) * 100}%;"></span>
                    </label>
                    <span class="slider__max">{$maxCount}</span>
                </div>
                <input id="7f3hxdzaic" name="need_refs_display" type="text"
                    class="slider__current" value="{$need_refs}">
            </div>
        </div>

        {* 5. Тип работы (радиокнопки) *}
        {set $work_type = $_modx->getPlaceholder('fi.work_type') ?: 'referat'}
        <div class="field">
            <div class="work-variants">
                {set $work_types = [
                    'referat' => ['label' => 'Урок (семинар)', 'price' => 30],
                    'kursovaya' => ['label' => 'Курсовая', 'price' => 40],
                    'paper' => ['label' => 'Краеведение', 'price' => 50],
                    'diplom' => ['label' => 'Юбилейная дата', 'price' => 100]
                ]}
                {foreach $work_types as $value => $data}
                    <div class="variant-container">
                        <label class="variant">
                            <input type="radio" class="variant__radio work-type-radio"
                                   name="work_type"
                                   value="{$value}"
                                   data-price="{$data.price}"
                                   {$work_type == $value ? 'checked' : ''}>
                            <span class="variant__name">{$data.label}</span>
                        </label>
                    </div>
                {/foreach}
            </div>
        </div>

        {* 6. Возраст источника (выпадающий список) *}
        {set $refs_max_age = $_modx->getPlaceholder('fi.refs_max_age') ?: 0}
        <div class="field">
            <label class="field__label" for="refs_max_age">Возраст источника</label>
            <select class="field__select {$_modx->getPlaceholder('fi.error.refs_max_age') ? 'is-invalid' : ''}"
                    name="refs_max_age"
                    id="refs_max_age">
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

        {* 7. Язык источника (чекбоксы) *}
        <div class="checkbox-group field">
            <span class="field__label">Язык источника</span>

            <div class="checkbox-group__row">
                <div class="checkbox">
                    <label class="checkbox__label">
                        Русский
                        <input type="checkbox" class="checkbox__input" name="lang_ru" value="1"
                            {$_modx->getPlaceholder('fi.lang_ru') ? 'checked' : ''}>
                        <span class="checkbox__checkmark"></span>
                    </label>
                </div>
                <div class="checkbox">
                    <label class="checkbox__label">
                        Английский
                        <input type="checkbox" class="checkbox__input" name="lang_en" value="1"
                            {$_modx->getPlaceholder('fi.lang_en') ? 'checked' : ''}>
                        <span class="checkbox__checkmark"></span>
                    </label>
                </div>
            </div>
        </div>

        {* 8. Срочность *}
        <div class="checkbox-group field">
            <span class="field__label">Срочность</span>
            <div class="checkbox">
                <label class="checkbox__label">
                    Библиография нужна завтра
                    <input type="checkbox" class="checkbox__input" name="urgent" value="1"
                           {$_modx->getPlaceholder('fi.urgent') ? 'checked' : ''}>
                    <span class="checkbox__checkmark"></span>
                </label>
            </div>
        </div>

        {* 9. Патенты *}
        <div class="checkbox-group field">
            <span class="field__label">Патенты</span>
            <div class="checkbox">
                <label class="checkbox__label">
                    Включить патенты в список литературы
                    <input type="checkbox" class="checkbox__input" name="search_patents" value="1"
                           {$_modx->getPlaceholder('fi.search_patents') ? 'checked' : ''}>
                    <span class="checkbox__checkmark"></span>
                </label>
            </div>
        </div>

        {* 10. Открытый доступ *}
        <div class="checkbox-group field">
            <span class="field__label">Открытый доступ</span>
            <div class="checkbox">
                <label class="checkbox__label">
                    Все источники доступны по ссылке для скачивания
                    <input type="checkbox" class="checkbox__input" name="open_access" value="1"
                           {$_modx->getPlaceholder('fi.open_access') ? 'checked' : ''}>
                    <span class="checkbox__checkmark"></span>
                </label>
            </div>
        </div>

        {* 11. Email *}
        {set $field = 'email'}
        <div class="field">
            <label class="field__label" for="{$field}">Ваш Email для связи</label>
            <input class="field__input {$_modx->getPlaceholder("fi.error.{$field}") ? 'is-invalid' : ''}"
                   name="{$field}"
                   type="email"
                   id="{$field}"
                   placeholder="example@mail.ru"
                   autocomplete="email"
                   autocorrect="off"
                   spellcheck="false"
                   value="{$_modx->getPlaceholder("fi.{$field}")}">
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
                        {($work_types[$work_type].price * $need_refs)}&nbsp;₽
                    </span>

                    {* <a href="/price" class="price-helper">?</a> *}
                    <span class="price-helper-wrapper">
                        <span class="price-helper" role="button" aria-label="Информация о стоимости">?</span>
                        <div class="price-helper-tooltip">
                            <div class="tooltip-content">
                                <div class="tooltip-row">
                                    <span>Тип работы:</span>
                                    <span id="tooltipWorkType">{$work_types[$work_type].label}
                                </div>
                                <div class="tooltip-row">
                                    <span>Количество источников:</span>
                                    <span id="tooltipRefs">{$need_refs}</span>
                                </div>
                                <div class="tooltip-row">
                                    <span>Цена за источник:</span>
                                    <span id="tooltipPricePerSource">{$work_types[$work_type].price} ₽</span>
                                </div>
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
                <button type="submit" class="btn">
                    ОПЛАТИТЬ
                </button>
            </div>
        </div>
    </div>
</form>