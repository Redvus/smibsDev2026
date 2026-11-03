{*
    FormInterlibrary - Форма межбиблиотечного абонемента
    Использует встроенный AJAX FormIt (без jQuery)
*}

<div class="form-payment__container form-payment__ru">
    <h2 class="form-payment__title simple-title">Заявка на межбиблиотечный абонемент</h2>

    <form class="form form-payment--loading"
        id="formInterlibrary"
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

            {* ============================================
                ТАБЛИЦА КНИГ
            ============================================ *}
            <div class="books-table">
                <div class="books-table__header">
                    <span class="books-table__col books-table__col--number">№</span>
                    <span class="books-table__col books-table__col--author">Автор *</span>
                    <span class="books-table__col books-table__col--title">Заглавие *</span>
                    <span class="books-table__col books-table__col--year">Год</span>
                    <span class="books-table__col books-table__col--place">Место</span>
                    <span class="books-table__col books-table__col--volume">Том</span>
                    <span class="books-table__col books-table__col--actions"></span>
                </div>

                <div class="books-table__body" id="booksTableBody">
                    {* Первая строка по умолчанию *}
                    <div class="books-table__row" data-row-index="0">
                        <span class="books-table__col books-table__col--number">1</span>
                        <div class="books-table__col books-table__col--author">
                            <input type="text" name="book_author[]" class="books-table__input" placeholder="Автор" data-error="book_author_0">
                            <span class="field__error" data-formit-error="book_author_0"></span>
                        </div>
                        <div class="books-table__col books-table__col--title">
                            <input type="text" name="book_title[]" class="books-table__input" placeholder="Заглавие" data-error="book_title_0">
                            <span class="field__error" data-formit-error="book_title_0"></span>
                        </div>
                        <div class="books-table__col books-table__col--year">
                            <input type="text" name="book_year[]" class="books-table__input" placeholder="Год">
                        </div>
                        <div class="books-table__col books-table__col--place">
                            <input type="text" name="book_place[]" class="books-table__input" placeholder="Место">
                        </div>
                        <div class="books-table__col books-table__col--volume">
                            <input type="text" name="book_volume[]" class="books-table__input" placeholder="Том">
                        </div>
                        <div class="books-table__col books-table__col--actions">
                            <button type="button" class="books-table__remove-btn" data-row-index="0" style="display:none;">
                                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <line x1="18" y1="6" x2="6" y2="18"/>
                                    <line x1="6" y1="6" x2="18" y2="18"/>
                                </svg>
                            </button>
                        </div>
                    </div>
                </div>

                <div class="books-table__footer">
                    <button type="button" class="btn btn--secondary books-table__add-btn" id="addBookBtn">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <line x1="12" y1="5" x2="12" y2="19"/>
                            <line x1="5" y1="12" x2="19" y2="12"/>
                        </svg>
                        Добавить книгу
                    </button>
                    <span class="books-table__max-warning" id="maxBooksWarning" style="display:none;">
                        ⚠️ Максимум 10 книг
                    </span>
                </div>
            </div>

            {* Скрытое поле для количества книг *}
            <input type="hidden" name="book_count" id="bookCount" value="1">

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
                            50 ₽
                        </span>
                        <span class="price-helper-wrapper">
                            <span class="price-helper" role="button" aria-label="Информация о стоимости">?</span>
                            <div class="price-helper-tooltip">
                                <div class="tooltip-content">
                                    <div class="tooltip">
                                        <span class="tooltip__label">Количество книг:</span>
                                        <span id="tooltipBooks" class="tooltip__value">1</span>
                                    </div>
                                    <div class="tooltip">
                                        <span class="tooltip__label">Цена за книгу:</span>
                                        <span id="tooltipPricePerBook" class="tooltip__value">50 ₽</span>
                                    </div>
                                    <div class="tooltip tooltip--total">
                                        <span class="tooltip__label">Итого:</span>
                                        <span id="tooltipTotal" class="tooltip__value">50 ₽</span>
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