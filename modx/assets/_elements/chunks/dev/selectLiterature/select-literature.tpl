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
                    <i class="fa-solid fa-file-circle-check"></i>
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

{* <div class="wrapper__part examples" id="examples">
    <div class="lazyload-wrapper " style="position: relative;">
        <h2 class="examples__title simple-title">Примеры готовых списков литературы</h2>

        <div class="examples__list">
            <div type="button" class="example" title="Курсовая" data-worktype="kursach">
                <div class="examples__container">
                    <h4 class="examples__name">Курсовая</h4>
                    <div class="examples__preview">
                        <picture>
                            <source media="(max-width: 192px)" srcset="
                                /assets/images/selectLib/preview_1.webp 1x,
                                /assets/images/selectLib/preview_1.webp 2x,
                                /assets/images/selectLib/preview_1.webp 3x
                                " type="image/webp">
                                                    <source media="(max-width: 192px)" srcset="
                                /assets/images/selectLib/preview_1.png 1x,
                                /assets/images/selectLib/preview_1.png 2x,
                                /assets/images/selectLib/preview_1.png 3x
                                " type="image/png"><img width="192px" height="220px" src="/assets/images/selectLib/preview_1.png" srcset="
                                /assets/images/selectLib/preview_1.png 2x,
                                /assets/images/selectLib/preview_1.png 3x
                                " alt="Курсовая" class="example__img">
                        </picture>
                        <div class="example__circuit"></div>
                    </div>
                </div>
            </div>

            <div type="button" class="example" title="Научная статья" data-typework="article">
                <div class="examples__container">
                    <h4 class="examples__name">Научная статья</h4>
                    <div class="examples__preview">
                        <picture>
                            <source media="(max-width: 192px)" srcset="
                                /assets/images/selectLib/preview_2.webp 1x,
                                /assets/images/selectLib/preview_2.webp 2x,
                                /assets/images/selectLib/preview_2.webp 3x
                                " type="image/webp">
                                                    <source media="(max-width: 192px)" srcset="
                                /assets/images/selectLib/preview_2.png 1x,
                                /assets/images/selectLib/preview_2.png 2x,
                                /assets/images/selectLib/preview_2.png 3x
                                " type="image/png"><img width="192px" height="220px" src="/assets/images/selectLib/preview_2.png" srcset="
                                /assets/images/selectLib/preview_2.png 2x,
                                /assets/images/selectLib/preview_2.png 3x
                                " alt="Научная статья" class="example__img">
                        </picture>
                        <div class="example__circuit"></div>
                    </div>
                </div>
            </div>

            <div type="button" class="example" title="Диплом" data-typework="diplom">
                <div class="examples__container">
                    <h4 class="examples__name">Диплом</h4>
                    <div class="examples__preview">
                        <picture>
                            <source media="(max-width: 192px)" srcset="
                                /assets/images/selectLib/preview_3.webp 1x,
                                /assets/images/selectLib/preview_3.webp 2x,
                                /assets/images/selectLib/preview_3.webp 3x
                                " type="image/webp">
                                                    <source media="(max-width: 192px)" srcset="
                                /assets/images/selectLib/preview_3.png 1x,
                                /assets/images/selectLib/preview_3.png 2x,
                                /assets/images/selectLib/preview_3.png 3x
                                " type="image/png"><img width="192px" height="220px" src="/assets/images/selectLib/preview_3.png" srcset="
                                /assets/images/selectLib/preview_3.png 2x,
                                /assets/images/selectLib/preview_3.png 3x
                                " alt="Диплом" class="example__img">
                        </picture>
                        <div class="example__circuit"></div>
                    </div>
                </div>
            </div>

            <div type="button" class="example" title="Диссертация" data-typework="dissertation">
                <div class="examples__container">
                    <h4 class="examples__name">Диссертация</h4>
                    <div class="examples__preview">
                        <picture>
                            <source media="(max-width: 192px)" srcset="
                                /assets/images/selectLib/preview_4.webp 1x,
                                /assets/images/selectLib/preview_4.webp 2x,
                                /assets/images/selectLib/preview_4.webp 3x
                                " type="image/webp">
                                                    <source media="(max-width: 192px)" srcset="
                                /assets/images/selectLib/preview_4.png 1x,
                                /assets/images/selectLib/preview_4.png 2x,
                                /assets/images/selectLib/preview_4.png 3x
                                " type="image/png"><img width="192px" height="220px" src="/assets/images/selectLib/preview_4.png" srcset="
                                /assets/images/selectLib/preview_4.png 2x,
                                /assets/images/selectLib/preview_4.png 3x
                                " alt="Диссертация" class="example__img">
                        </picture>
                        <div class="example__circuit"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div> *}

{* <div class="wrapper__part courses" id="courses">
    <h2 class="courses__title simple-title">Наши курсы</h2>
    <div class="courses__list">
        <div class="courses__preview">
            <div class="courses__preview_container">
                <a href="https://bibloid.ru/kursach/" class="courses__preview_link" rel="noopener" rel="noreferrer"
                    target="_blank" title="Как написать курсовую работу и остаться личностью">
                    <div class="courses__preview_picture">
                        <div class="courses__preview_circuit courses__preview_circuit--blue"></div>
                        <picture>
                            <source media="(max-width: 237.25px)" srcset="
                    /assets/images/selectLib/Illustration1@1x.V02DQJU4.webp 1x,
                    /assets/images/selectLib/Illustration1@2x.4XP5S352.webp 2x,
                    /assets/images/selectLib/Illustration1@3x.5W0J2PX2.webp 3x
                " type="image/webp" />
                            <source media="(max-width: 237.25px)" srcset="
                    /assets/images/selectLib/Illustration1@1x.019PNX64.png 1x,
                    /assets/images/selectLib/Illustration1@2x.B5B9OVL7.png 2x,
                    /assets/images/selectLib/Illustration1@3x.OPNRM7TA.png 3x
                " type="image/png" />
                            <img width="237.25px" height="135px" src="/assets/images/selectLib/Illustration1@1x.BGG7MN8C.png" srcset="
                    /assets/images/selectLib/Illustration1@2x.6VHFPRVJ.png 2x,
                    /assets/images/selectLib/Illustration1@3x.PH2JVHOU.png 3x
                " class="courses__preview_img courses__preview_img--first"
                                alt="Как написать курсовую работу и остаться личностью" />
                        </picture>
                    </div>
                    <h3 class="courses__preview_title">КиберКурсач</h3>
                </a>
                <p class="courses__preview_text regular-text"> Практические тонкости создания курсовой на&nbsp;всех
                    этапах: от&nbsp;идеи до&nbsp;оформления готовой работы, навыки оригинального мышления, полезные
                    инструменты </p>
            </div>
        </div>
        <div class="courses__preview">
            <div class="courses__preview_container">
                <a href="https://bibloid.ru/diplom/" rel="noopener" rel="noreferrer" target="_blank"
                    class="courses__preview_link"
                    title="Как написать дипломную работу и стать настоящим исследователем">
                    <div class="courses__preview_picture">
                        <div class="courses__preview_circuit courses__preview_circuit--green"></div>
                        <picture>
                            <source media="(max-width: 205px)" srcset="
                    /assets/images/selectLib/Illustration2@1x.T8T8ZF3M.webp 1x,
                    /assets/images/selectLib/Illustration2@2x.6IGWEA2G.webp 2x,
                    /assets/images/selectLib/Illustration2@3x.G34ON9Q3.webp 3x
                " type="image/webp" />
                            <source media="(max-width: 205px)" srcset="
                    /assets/images/selectLib/Illustration2@1x.BGXW0OCK.png 1x,
                    /assets/images/selectLib/Illustration2@2x.GY1EZEBL.png 2x,
                    /assets/images/selectLib/Illustration2@3x.603VHRKV.png 3x
                " type="image/png" />
                            <img width="205px" height="152px" src="/assets/images/selectLib/Illustration2@1x.1IVROXS5.png" srcset="
                    /assets/images/selectLib/Illustration2@2x.OABSXU4T.png 2x,
                    /assets/images/selectLib/Illustration2@3x.8V44Z93P.png 3x
                " class="courses__preview_img"
                                alt="Как написать дипломную работу и стать настоящим исследователем" />
                        </picture>
                    </div>
                    <h3 class="courses__preview_title">КиберДиплом</h3>
                </a>
                <p class="courses__preview_text regular-text"> Использование инструментов стратегического управления,
                    основные принципы работы с данными, ВКР как проект, который станет первой ступенью на&nbsp;пути
                    построения карьерной стратегии </p>
            </div>
        </div>
        <div class="courses__preview">
            <div class="courses__preview_container">
                <a href="https://bibloid.ru/article/" rel="noopener" rel="noreferrer" target="_blank"
                    class="courses__preview_link" title="Как написать научную статью на благо общества">
                    <div class="courses__preview_picture">
                        <div class="courses__preview_circuit courses__preview_circuit--yellow"></div>
                        <picture>
                            <source media="(max-width: 213px)" srcset="
                    /assets/images/selectLib/Illustration3@1x.MOEQEPBI.webp 1x,
                    /assets/images/selectLib/Illustration3@2x.8W0C3CDG.webp 2x,
                    /assets/images/selectLib/Illustration3@3x.VG034QIC.webp 3x
                " type="image/webp" />
                            <source media="(max-width: 213px)" srcset="
                    /assets/images/selectLib/Illustration3@1x.6OPZMQYE.png 1x,
                    /assets/images/selectLib/Illustration3@2x.CXF2NEJ4.png 2x,
                    /assets/images/selectLib/Illustration3@3x.3MDC92LU.png 3x
                " type="image/png" />
                            <img width="213px" height="152px" src="/assets/images/selectLib/Illustration3@1x.MC7NB9CM.png" srcset="
                    /assets/images/selectLib/Illustration3@2x.62X5C518.png 2x,
                    /assets/images/selectLib/Illustration3@3x.1ZRMG8JO.png 3x
                " class="courses__preview_img" alt="КиберСтатья" />
                        </picture>
                    </div>
                    <h3 class="courses__preview_title">КиберСтатья</h3>
                </a>
                <p class="courses__preview_text regular-text"> Полезные практические навыки проведения исследования
                    и&nbsp;написания сильных текстов для полноценной статьи, которую можно опубликовать
                    в&nbsp;научном журнале </p>
            </div>
        </div>
    </div>
</div> *}

{* <div class="wrapper__part opinions">
    <h3 class="opinions__title">60&nbsp;000+</h3>
    <h3 class="opinions__sub-title simple-title">составленных списков</h3>
    <p class="opinions__text regular-text"> Слово учащимся и&nbsp;исследователям, уже получившим свои готовые списки
        литературы </p>
    <div class="opinions__items" id="messages-carousel">
        <div class="lazyload-wrapper " style="position: relative;">
            <div class="slick-slider messages-carousel slick-initialized" dir="ltr"><button
                    class="slick-arrow-left slick-arrow slick-prev" aria-label="button"
                    style="display: block;"></button>
                <div class="slick-list">
                    <div class="slick-track"
                        style="width: 5740px; opacity: 1; transform: translate3d(-1640px, 0px, 0px);">
                        <div data-index="-2" tabindex="-1" class="slick-slide slick-cloned" aria-hidden="true"
                            style="width: 410px;">
                            <div>
                                <div class="message-padding" tabindex="-1"
                                    style="width: 100%; display: inline-block;">
                                    <div class="message">
                                        <div class="message__container">
                                            <p class="message__text regular-text"
                                                title="Отличный сервис! выполняют заказ быстро и качественно, главное ПОДРОБНО и ПОНЯТНО донести им что вам нужно!:)">
                                                Отличный сервис! выполняют заказ быстро и качественно, главное
                                                ПОДРОБНО и ПОНЯТНО донести им что вам нужно!:)</p>
                                            <div class="message__author">
                                                <p class="message__author-name" title="Сергей К.">Сергей К.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div data-index="-1" tabindex="-1" class="slick-slide slick-cloned" aria-hidden="true"
                            style="width: 410px;">
                            <div>
                                <div class="message-padding" tabindex="-1"
                                    style="width: 100%; display: inline-block;">
                                    <div class="message">
                                        <div class="message__container">
                                            <p class="message__text regular-text"
                                                title="Понравился очень сервис. Заказывала подбор для аттестационной работы по рентгенологии. Собрали хороший список. по времени примерно два дня ждала. Удачи всем">
                                                Понравился очень сервис. Заказывала подбор для аттестационной работы
                                                по рентгенологии. Собрали хороший список. по времени примерно два
                                                дня ждала. Удачи всем</p>
                                            <div class="message__author">
                                                <p class="message__author-name" title="Екатерина Д.">Екатерина Д.
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div data-index="0" class="slick-slide" tabindex="-1" aria-hidden="true"
                            style="outline: none; width: 410px;">
                            <div>
                                <div class="message-padding" tabindex="-1"
                                    style="width: 100%; display: inline-block;">
                                    <div class="message">
                                        <div class="message__container">
                                            <p class="message__text regular-text"
                                                title="Первый раз воспользовалась данным ресурсом. Цель: подбор новых источников по редкой теме для научной статьи. Источники на русском и английском языках. Работа сделана добросовестно, быстро. Найдены авторы, которых я по своей теме не находила. Спасибо еще раз, буду обращаться! Развития проекту!">
                                                Первый раз воспользовалась данным ресурсом. Цель: подбор новых
                                                источников по редкой теме для научной статьи. Источники на русском и
                                                английском языках. Работа сделана добросовестно, быстро. Найдены
                                                авторы, которых я по своей теме не находила. Спасибо еще раз, буду
                                                обращаться! Развития проекту!</p>
                                            <div class="message__author">
                                                <p class="message__author-name" title="Екатерина Лютик">Екатерина
                                                    Лютик</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div data-index="1" class="slick-slide" tabindex="-1" aria-hidden="true"
                            style="outline: none; width: 410px;">
                            <div>
                                <div class="message-padding" tabindex="-1"
                                    style="width: 100%; display: inline-block;">
                                    <div class="message">
                                        <div class="message__container">
                                            <p class="message__text regular-text"
                                                title="Мне очень помогли списки литературы по моим темам, готовлю реферат по истории и философии науки. Точно буду обращаться к вам и дальше. Спасибо. С уважением Александр, аспирант ИМЦ">
                                                Мне очень помогли списки литературы по моим темам, готовлю реферат
                                                по истории и философии науки. Точно буду обращаться к вам и дальше.
                                                Спасибо. С уважением Александр, аспирант ИМЦ</p>
                                            <div class="message__author">
                                                <p class="message__author-name" title="Александр С.">Александр С.
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div data-index="2" class="slick-slide slick-active slick-current" tabindex="-1"
                            aria-hidden="false" style="outline: none; width: 410px;">
                            <div>
                                <div class="message-padding" tabindex="-1"
                                    style="width: 100%; display: inline-block;">
                                    <div class="message">
                                        <div class="message__container">
                                            <p class="message__text regular-text"
                                                title="Воспользовалась сервисом Библоид, потому что понадобилось в кратчайшие сроки написать научную статью, а времени искать литературу особо не было) Нашла данный сервис, действительно крутой) Нашли материал за пару часов, не скажу, что все источники мне в итоге пригодились, но сработали четко, все по теме. Спасибо! Обязательно обращусь еще, когда буду писать диссертацию">
                                                Воспользовалась сервисом Библоид, потому что понадобилось в
                                                кратчайшие сроки написать научную статью, а времени искать
                                                литературу особо не было) Нашла данный сервис, действительно крутой)
                                                Нашли материал за пару часов, не скажу, что все источники мне в
                                                итоге пригодились, но сработали четко, все по теме. Спасибо!
                                                Обязательно обращусь еще, когда буду писать диссертацию</p>
                                            <div class="message__author">
                                                <p class="message__author-name" title="Alexandra">Alexandra</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div data-index="3" class="slick-slide slick-active" tabindex="-1" aria-hidden="false"
                            style="outline: none; width: 410px;">
                            <div>
                                <div class="message-padding" tabindex="-1"
                                    style="width: 100%; display: inline-block;">
                                    <div class="message">
                                        <div class="message__container">
                                            <p class="message__text regular-text"
                                                title="Оперативное и качественное выполнение запроса на формирование списка литературы по заданной теме, что полностью отвечает заявленному в описании услуги">
                                                Оперативное и качественное выполнение запроса на формирование списка
                                                литературы по заданной теме, что полностью отвечает заявленному в
                                                описании услуги</p>
                                            <div class="message__author">
                                                <p class="message__author-name" title="Виктор Я.">Виктор Я.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div data-index="4" class="slick-slide" tabindex="-1" aria-hidden="true"
                            style="outline: none; width: 410px;">
                            <div>
                                <div class="message-padding" tabindex="-1"
                                    style="width: 100%; display: inline-block;">
                                    <div class="message">
                                        <div class="message__container">
                                            <p class="message__text regular-text"
                                                title="Отличный сервис! выполняют заказ быстро и качественно, главное ПОДРОБНО и ПОНЯТНО донести им что вам нужно!:)">
                                                Отличный сервис! выполняют заказ быстро и качественно, главное
                                                ПОДРОБНО и ПОНЯТНО донести им что вам нужно!:)</p>
                                            <div class="message__author">
                                                <p class="message__author-name" title="Сергей К.">Сергей К.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div data-index="5" class="slick-slide" tabindex="-1" aria-hidden="true"
                            style="outline: none; width: 410px;">
                            <div>
                                <div class="message-padding" tabindex="-1"
                                    style="width: 100%; display: inline-block;">
                                    <div class="message">
                                        <div class="message__container">
                                            <p class="message__text regular-text"
                                                title="Понравился очень сервис. Заказывала подбор для аттестационной работы по рентгенологии. Собрали хороший список. по времени примерно два дня ждала. Удачи всем">
                                                Понравился очень сервис. Заказывала подбор для аттестационной работы
                                                по рентгенологии. Собрали хороший список. по времени примерно два
                                                дня ждала. Удачи всем</p>
                                            <div class="message__author">
                                                <p class="message__author-name" title="Екатерина Д.">Екатерина Д.
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div data-index="6" tabindex="-1" class="slick-slide slick-cloned" aria-hidden="true"
                            style="width: 410px;">
                            <div>
                                <div class="message-padding" tabindex="-1"
                                    style="width: 100%; display: inline-block;">
                                    <div class="message">
                                        <div class="message__container">
                                            <p class="message__text regular-text"
                                                title="Первый раз воспользовалась данным ресурсом. Цель: подбор новых источников по редкой теме для научной статьи. Источники на русском и английском языках. Работа сделана добросовестно, быстро. Найдены авторы, которых я по своей теме не находила. Спасибо еще раз, буду обращаться! Развития проекту!">
                                                Первый раз воспользовалась данным ресурсом. Цель: подбор новых
                                                источников по редкой теме для научной статьи. Источники на русском и
                                                английском языках. Работа сделана добросовестно, быстро. Найдены
                                                авторы, которых я по своей теме не находила. Спасибо еще раз, буду
                                                обращаться! Развития проекту!</p>
                                            <div class="message__author">
                                                <p class="message__author-name" title="Екатерина Лютик">Екатерина
                                                    Лютик</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div data-index="7" tabindex="-1" class="slick-slide slick-cloned" aria-hidden="true"
                            style="width: 410px;">
                            <div>
                                <div class="message-padding" tabindex="-1"
                                    style="width: 100%; display: inline-block;">
                                    <div class="message">
                                        <div class="message__container">
                                            <p class="message__text regular-text"
                                                title="Мне очень помогли списки литературы по моим темам, готовлю реферат по истории и философии науки. Точно буду обращаться к вам и дальше. Спасибо. С уважением Александр, аспирант ИМЦ">
                                                Мне очень помогли списки литературы по моим темам, готовлю реферат
                                                по истории и философии науки. Точно буду обращаться к вам и дальше.
                                                Спасибо. С уважением Александр, аспирант ИМЦ</p>
                                            <div class="message__author">
                                                <p class="message__author-name" title="Александр С.">Александр С.
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div data-index="8" tabindex="-1" class="slick-slide slick-cloned" aria-hidden="true"
                            style="width: 410px;">
                            <div>
                                <div class="message-padding" tabindex="-1"
                                    style="width: 100%; display: inline-block;">
                                    <div class="message">
                                        <div class="message__container">
                                            <p class="message__text regular-text"
                                                title="Воспользовалась сервисом Библоид, потому что понадобилось в кратчайшие сроки написать научную статью, а времени искать литературу особо не было) Нашла данный сервис, действительно крутой) Нашли материал за пару часов, не скажу, что все источники мне в итоге пригодились, но сработали четко, все по теме. Спасибо! Обязательно обращусь еще, когда буду писать диссертацию">
                                                Воспользовалась сервисом Библоид, потому что понадобилось в
                                                кратчайшие сроки написать научную статью, а времени искать
                                                литературу особо не было) Нашла данный сервис, действительно крутой)
                                                Нашли материал за пару часов, не скажу, что все источники мне в
                                                итоге пригодились, но сработали четко, все по теме. Спасибо!
                                                Обязательно обращусь еще, когда буду писать диссертацию</p>
                                            <div class="message__author">
                                                <p class="message__author-name" title="Alexandra">Alexandra</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div data-index="9" tabindex="-1" class="slick-slide slick-cloned" aria-hidden="true"
                            style="width: 410px;">
                            <div>
                                <div class="message-padding" tabindex="-1"
                                    style="width: 100%; display: inline-block;">
                                    <div class="message">
                                        <div class="message__container">
                                            <p class="message__text regular-text"
                                                title="Оперативное и качественное выполнение запроса на формирование списка литературы по заданной теме, что полностью отвечает заявленному в описании услуги">
                                                Оперативное и качественное выполнение запроса на формирование списка
                                                литературы по заданной теме, что полностью отвечает заявленному в
                                                описании услуги</p>
                                            <div class="message__author">
                                                <p class="message__author-name" title="Виктор Я.">Виктор Я.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div data-index="10" tabindex="-1" class="slick-slide slick-cloned" aria-hidden="true"
                            style="width: 410px;">
                            <div>
                                <div class="message-padding" tabindex="-1"
                                    style="width: 100%; display: inline-block;">
                                    <div class="message">
                                        <div class="message__container">
                                            <p class="message__text regular-text"
                                                title="Отличный сервис! выполняют заказ быстро и качественно, главное ПОДРОБНО и ПОНЯТНО донести им что вам нужно!:)">
                                                Отличный сервис! выполняют заказ быстро и качественно, главное
                                                ПОДРОБНО и ПОНЯТНО донести им что вам нужно!:)</p>
                                            <div class="message__author">
                                                <p class="message__author-name" title="Сергей К.">Сергей К.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div data-index="11" tabindex="-1" class="slick-slide slick-cloned" aria-hidden="true"
                            style="width: 410px;">
                            <div>
                                <div class="message-padding" tabindex="-1"
                                    style="width: 100%; display: inline-block;">
                                    <div class="message">
                                        <div class="message__container">
                                            <p class="message__text regular-text"
                                                title="Понравился очень сервис. Заказывала подбор для аттестационной работы по рентгенологии. Собрали хороший список. по времени примерно два дня ждала. Удачи всем">
                                                Понравился очень сервис. Заказывала подбор для аттестационной работы
                                                по рентгенологии. Собрали хороший список. по времени примерно два
                                                дня ждала. Удачи всем</p>
                                            <div class="message__author">
                                                <p class="message__author-name" title="Екатерина Д.">Екатерина Д.
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><button class="slick-arrow-right slick-arrow slick-next" aria-label="button"
                    style="display: block;"></button>
            </div>
        </div>
    </div>
</div> *}

<div class="wrapper__part form-payment">

    {* ============================================
        ВЫЗОВ FORMIT ДЛЯ ВСЕХ ФОРМ
    ============================================ *}
    {* {set $formit_params = [
        'hooks' => 'validate,email,redirect',
        'validate' => 'name:required,description:required,keywords:required,email:email:required',
        'emailTpl' => 'selectLitFormEmailTpl',
        'emailSubject' => 'Новая заявка на подбор литературы',
        'emailTo' => '[[++bibliographer_email]]',
        'redirectTo' => 123,
        'successMessage' => 'Ваша заявка отправлена! Вы будете перенаправлены на страницу оплаты.',
        'validationErrorMessage' => 'Пожалуйста, заполните все обязательные поля'
    ]} *}
{* 'hooks' => 'validate,SaveFormForPayment,email,redirect', *}
{* 'emailTo' => '{if $form_type == "lit_selection"}bibliographer1@library.ru
      {elseif $form_type == "edit_bibliography"}bibliographer2@library.ru
      {else}bibliographer@library.ru{/if}', *}
{* 'redirectParams' => '{"work_type":"[[+work_type]]","need_refs":"[[+need_refs]]","price":"[[+price]]"}', *}


    {* Инициализация FormIt *}
    {* {$_modx->runSnippet('!FormIt', $formit_params)} *}

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