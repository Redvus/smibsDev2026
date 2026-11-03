<div class="wrapper__part general">
    <div class="general__container">
        <div class="general__info">
            <h2 class="general__title general__title--first">Первый шаг к написанию работы</h2>
            <h2 class="general__title general__title--second">{$_modx->resource.longtitle ?: $_modx->resource.pagetitle}</h2>
            <p class="general__text general__text--first regular-text">
                Подберём литературу к&nbsp;уроку или&nbsp;семинару, составим и&nbsp;оформим список источников по&nbsp;ГОСТу и&nbsp;привезём книгу в&nbsp;ближайшую к&nbsp;вам библиотеку, чтобы у&nbsp;вас осталось больше времени на&nbsp;чтение.
            </p>
            <p class="general__text general__text--second regular-text"> Мы&nbsp;помогаем&nbsp;&mdash;
                вы&nbsp;пишете. </p>
        </div>
        <div class="general__img-bg">
            <picture class="general__img">
                 <img
                 src="/assets/images/selectLib/s_sl_top_1.png"
                 srcset="/assets/images/selectLib/s_sl_top_1.png 2x,
                 /assets/images/selectLib/s_sl_top_1.png 3x"
                 alt="Поиск источников" />
            </picture>
        </div>
    </div>
</div>

<div class="wrapper__part teaser-list">
    <ul class="teaser-list__container">
        <li class="teaser">
            <div class="teaser__container">
                <div class="teaser__img">
                    {* <img width="51.98px" height="57px" src="/assets/images/selectLib/ic-expert.V6QJMIME.svg"
                        alt="Профессиональные библиографы" /> *}
                    <i class="fa-solid fa-graduation-cap"></i>
                </div>
                <h4 class="teaser__title">Тематическая<br>подборка&nbsp;книг</h4>
                <p class="teaser__text regular-text">К урокам, семинарам и&nbsp;на&nbsp;любую тему до&nbsp;10&nbsp;источников.<br>Срок от 3 до 5 дней.
                </p>
                <a href="#form_1" class="btn btn--base teaser__button" id="formBtn_1">Подобрать литературу</a>
            </div>
        </li>
        <li class="teaser">
            <div class="teaser__container">
                <div class="teaser__img">
                    {* <img width="49px" height="49px" src="/assets/images/selectLib/ic-search.S816RQHV.svg"
                        alt="Поиск по всей доступной базе современного научного знания " /> *}
                        <i class="fa-solid fa-magnifying-glass"></i>
                </div>
                <h4 class="teaser__title">Редактирование библиографических описаний по&nbsp;ГОСТу</h4>
                <p class="teaser__text regular-text">В соответствии с&nbsp;актуальным ГОСТом.<br>Срок от 3 до 5 дней.</p>
                <a href="#form_2" class="btn btn--base teaser__button" id="formBtn_2">Редактировать</a>
            </div>
        </li>
        <li class="teaser">
            <div class="teaser__container">
                <div class="teaser__img">
                    {* <img width="38px" height="52px" src="/assets/images/selectLib/ic-standard.U73R0562.svg"
                        alt="Библиографический список, оформленный по ГОСТ" /> *}
                    <i class="fa-solid fa-truck"></i>
                </div>
                <h4 class="teaser__title">Межбиблиотечный<br>абонемент</h4>
                <p class="teaser__text regular-text">Заказ и&nbsp;доставка документов из&nbsp;фондов библиотек МБУК г.о.&nbsp;Самара&nbsp;«СМИБС»</p>
                <a href="#form_3" class="btn btn--base teaser__button" id="formBtn_3">Заказать доставку</a>
            </div>
        </li>
        <li class="teaser">
            <div class="teaser__container">
                <div class="teaser__img">
                    {* <img width="38px" height="52px" src="/assets/images/selectLib/ic-standard.U73R0562.svg"
                        alt="Библиографический список, оформленный по ГОСТ" /> *}
                    <i class="fa-regular fa-file-lines"></i>
                </div>
                <h4 class="teaser__title">Составление<br>библиографического</h4>
                <p class="teaser__text regular-text">Библиографический список по&nbsp;ГОСТу до&nbsp;20&nbsp;источников.<br>Срок от 3 до 5 дней.</p>
                <a href="#form_4" class="btn btn--base teaser__button" id="formBtn_4">Составить список</a>
            </div>
        </li>
    </ul>
</div>

<div class="wrapper__part form-payment">

    {* ============================================
        ЕДИНСТВЕННЫЙ ВЫЗОВ FORMIT С УСЛОВНОЙ ЛОГИКОЙ
    ============================================ *}
    {set $form_type = $_modx->getPlaceholder('fi.form_type') ?: ''}

    {set $formit_params = [
        'hooks' => 'validate,email,redirect',
        'validate' => 'name:required,age:required,phone:required,author:required,title:required,numberLibrary:required,email:email:required,description:required,keywords:required',
        'emailTpl' => 'interlibraryEmailTpl',
        'emailSubject' => 'СМИБС. Заказ книг онлайн',
        'emailFrom' => '[[++emailsender]]',
        'emailFromName' => '[[++site_name]]',
        'emailSelectTo' => 'osamlib@mail.ru;smibs1@yandex.ru;smibs2@yandex.ru;smibs3@yandex.ru;smibs.4@yandex.ru;smibs5@yandex.ru;smibs6@yandex.ru;smibs7@yandex.ru;smibs8@yandex.ru;smibs9@yandex.ru;smibs10@yandex.ru;smibs11@yandex.ru;smibs12@yandex.ru;smibs13@yandex.ru;smibs14@yandex.ru;smibs15@yandex.ru;smibs16@yandex.ru;smibs17@yandex.ru;smibs18@yandex.ru;smibs.19@yandex.ru;smibs20@yandex.ru;smibs21@yandex.ru;smibs22@yandex.ru;smibs23@yandex.ru;smibs24@yandex.ru;smibs25@yandex.ru;smibs26@yandex.ru;smibs27@yandex.ru;smibs28@yandex.ru;smibs-29@yandex.ru;smibs30@yandex.ru;smibs31@yandex.ru;smibs32@yandex.ru;smibs33@yandex.ru;smibs34@yandex.ru;smibs35@yandex.ru;a.suvorof@gmail.com',
        'emailSelectToName' => 'ЦГБ;Библиотека №1;Библиотека №2;Библиотека №3;Библиотека №4;Библиотека №5;Библиотека №6;Библиотека №7;Библиотека №8;Библиотека №9;Библиотека №10;Библиотека №11;Библиотека №12;Библиотека №13;Библиотека №14;Библиотека №15;Библиотека №16;Библиотека №17;Библиотека №18;Библиотека №19;Библиотека №20;Библиотека №21;Библиотека №22;Библиотека №23;Библиотека №24;Библиотека №25;Библиотека №26;Библиотека №27;Библиотека №28;Библиотека №29;Библиотека №30;Библиотека №31;Библиотека №32;Библиотека №33;Библиотека №34;Библиотека №35;test',
        'emailSelectField' => 'numberLibrary',
        'redirectTo' => 456,
        'successMessage' => 'Спасибо! Ваша заявка отправлена. В ближайшее время мы с Вами свяжемся!',
        'validationErrorMessage' => 'Пожалуйста, заполните все обязательные поля',
        'name.vTextRequired' => 'Введите ваше имя',
        'email.vTextRequired' => 'Введите корректный email',
        'age.vTextRequired' => 'Укажите возраст',
        'phone.vTextRequired' => 'Введите номер телефона',
        'author.vTextRequired' => 'Укажите автора',
        'title.vTextRequired' => 'Введите заглавие',
        'numberLibrary.vTextRequired' => 'Выберите филиал',
        'description.vTextRequired' => 'Опишите тему',
        'keywords.vTextRequired' => 'Введите ключевые слова'
    ]}

    {$_modx->runSnippet('!FormIt', $formit_params)}

    {* ============================================
        БЛОК С ФОРМАМИ
    ============================================ *}
    <div class="forms-container" id="formsContainer">
        {* Форма 1: Тематическая подборка книг *}
        <div class="form-wrapper form-wrapper--1 {$_modx->getPlaceholder('fi.active_form') == 'form_1' ? 'active' : ''}"
            id="form_1" style="display: none;">
            {$_modx->getChunk('FormSelectLit')}
        </div>

        {* Форма 2: Редактирование библиографических описаний *}
        <div class="form-wrapper form-wrapper--2 {$_modx->getPlaceholder('fi.active_form') == 'form_2' ? 'active' : ''}"
            id="form_2" style="display: none;">
            {$_modx->getChunk('FormEditBiblio')}
        </div>

        {* Форма 3: Межбиблиотечный абонемент *}
        <div class="form-wrapper form-wrapper--3 {$_modx->getPlaceholder('fi.active_form') == 'form_3' ? 'active' : ''}"
            id="form_3" style="display: none;">
            {$_modx->getChunk('FormInterlibrary')}
        </div>

        {* Форма 4: Составление списка литературы *}
        <div class="form-wrapper form-wrapper--4 {$_modx->getPlaceholder('fi.active_form') == 'form_4' ? 'active' : ''}"
            id="form_4" style="display: none;">
            {$_modx->getChunk('FormBiblioList')}
        </div>
    </div>
</div>