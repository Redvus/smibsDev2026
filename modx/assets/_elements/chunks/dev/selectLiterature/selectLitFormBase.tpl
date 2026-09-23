<form class="form form-payment--loading">
    <div class="form-payment__container_body">
        <div class="field"><label class="field__label" for="8e73lnx2z9">Тема работы</label><input
                class="field__input  " name="name" type="text" id="8e73lnx2z9" placeholder=""
                autocomplete="off" autocorrect="off" spellcheck="false" value=""></div>
        <div class="field"><label class="field__label" for="81qc6nt92w">Аспекты, раскрывающие и
                конкретизирующие тему</label><textarea class="field__textarea" name="description"
                id="81qc6nt92w" placeholder="" autocomplete="off" autocorrect="off"
                spellcheck="false"></textarea></div>
        <div class="field"><label class="field__label" for="ba85igjtsh">Ключевые слова, область знаний
                или специальность</label><input class="field__input  " name="keywords" type="text"
                id="ba85igjtsh" placeholder="" autocomplete="off" autocorrect="off" spellcheck="false"
                value=""></div>
        <div class="field"><label class="field__label" for="7f3hxdzaic">Количество источников</label>
            <div class="slider__container">
                <div class="slider"><span class="slider__min">5</span><label
                        class="slider__input-container"><input name="need_refs" type="range" min="5"
                            max="200" step="5" class="slider__input" value="10"><span
                            class="slider__input-track"></span><span class="slider__input-progress"
                            style="width: 5%;"></span></label><span class="slider__max">200</span></div>
                <input id="7f3hxdzaic" name="need_refs" type="text" class="slider__current" value="10">
            </div>
        </div>
        <div class="field">
            <div class="work-variants">
                <div class="variant-container"><label class="variant"><input type="radio"
                            class="variant__radio" name="work_type" value="referat" checked=""><span
                            class="variant__name">Реферат</span></label></div>
                <div class="variant-container"><label class="variant"><input type="radio"
                            class="variant__radio" name="work_type" value="kursovaya"><span
                            class="variant__name">Курсовая</span></label></div>
                <div class="variant-container"><label class="variant"><input type="radio"
                            class="variant__radio" name="work_type" value="paper"><span
                            class="variant__name">Научная статья</span></label></div>
                <div class="variant-container"><label class="variant"><input type="radio"
                            class="variant__radio" name="work_type" value="diplom"><span
                            class="variant__name">Диплом</span></label></div>
                <div class="variant-container"><label class="variant"><input type="radio"
                            class="variant__radio" name="work_type" value="thesis"><span
                            class="variant__name">Диссертация</span></label></div>
            </div>
        </div><label class="field select--label"><span class="field__label">Возраст источника</span>
            <div class=" css-b62m3t-container"><span id="react-select-2-live-region"
                    class="css-7pg0cj-a11yText"></span><span aria-live="polite" aria-atomic="false"
                    aria-relevant="additions text" class="css-7pg0cj-a11yText"></span>
                <div class=" css-1gint64-control">
                    <div class=" css-1d8n9bt">
                        <div class=" css-1t7xiof-singleValue">Не важно</div><input
                            id="react-select-2-input" tabindex="0" inputmode="none"
                            aria-autocomplete="list" aria-expanded="false" aria-haspopup="true"
                            aria-controls="react-select-2-listbox" aria-owns="react-select-2-listbox"
                            role="combobox" aria-readonly="true" class="css-1hac4vs-dummyInput"
                            value="">
                    </div>
                    <div class=" css-1rclea9"><span class=" css-43ykx9-indicatorSeparator"></span>
                        <div class=" css-tlfecz-indicatorContainer" aria-hidden="true"><img
                                src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTAiIGhlaWdodD0iNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cGF0aCBkPSJNMTAgMEw1IDYgMCAweiIgZmlsbD0iIzJEMzAzNiIgZmlsbC1ydWxlPSJldmVub2RkIi8+PC9zdmc+"
                                alt=""></div>
                    </div>
                </div><input name="refs_max_age" type="hidden" value="0">
            </div>
        </label>
        <div class="checkbox-group field"><span class="field__label">Язык источника</span>
            <div class="checkbox"><label class="checkbox__label">Русский<input type="checkbox"
                        class="checkbox__input" name="lang_ru" checked=""><span
                        class="checkbox__checkmark"></span></label></div>
            <div class="checkbox"><label class="checkbox__label">Английский<input type="checkbox"
                        class="checkbox__input" name="lang_en"><span
                        class="checkbox__checkmark"></span></label></div>
        </div>
        <div class="checkbox-group field"><span class="field__label">Срочность</span>
            <div class="checkbox"><label class="checkbox__label">Библиография нужна завтра<input
                        type="checkbox" class="checkbox__input" name="urgent"><span
                        class="checkbox__checkmark"></span></label></div>
        </div>
        <div class="checkbox-group field"><span class="field__label">Патенты</span>
            <div class="checkbox"><label class="checkbox__label">Включить патенты в список
                    литературы<input type="checkbox" class="checkbox__input" name="search_patents"><span
                        class="checkbox__checkmark"></span></label></div>
        </div>
        <div class="checkbox-group field"><span class="field__label">Открытый доступ</span>
            <div class="checkbox"><label class="checkbox__label">Все источники доступны по ссылке для
                    скачивания<input type="checkbox" class="checkbox__input" name="open_access"><span
                        class="checkbox__checkmark"></span></label></div>
        </div>
        <div class="field"><label class="field__label" for="dh1h2yean1">Ваш Email для
                связи</label><input class="field__input  " name="email" type="text" id="dh1h2yean1"
                placeholder="" autocomplete="off" autocorrect="off" spellcheck="false" value=""></div>
        <div class="field recaptcha__field">

        </div>
    </div>
    <div class="form-payment__container_footer">
        <div class="payment">
            <div class="price"><span class="price-label">Стоимость:</span><span><span
                        class="price-value">500&nbsp;₽</span><a href="/price"
                        class="price-helper">?</a></span></div>
            <div class="btn-container"><button type="submit"
                    class="btn btn-freshgreen btn--withLoader">ОПЛАТИТЬ</button></div>
        </div>
    </div>
</form>