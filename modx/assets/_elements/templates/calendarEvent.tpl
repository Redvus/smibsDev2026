<!doctype html>
<!--[if IE 8]>
<html lang="ru" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="rus"> <!--<![endif]-->
{'head'|chunk}
<body>
<div class="wrapper">
    {*     {'preloader'|chunk}*}
    {'header'|chunk}
    {* {'nav-main'|chunk} *}
    {* {'main-content'|chunk} *}

    <div class="page">
        {set $needle = $.get.event | intval}
        {if $needle < 1}
            <p>Событие не указано</p>
        {else}
            {set $rows = $_modx->resource.calendarEvents | fromJSON}

            {set $row = null}
            {foreach $rows as $r}
                {if $r.MIGX_id == $needle}
                    {set $row = $r}
                    {break}
                {/if}
            {/foreach}

            {if $row}
                {set $branch = $row.calendarEventsPlace | resource}
                {set $addr = $branch.id | resource: 'libraryAdress'}
                {set $whenDate = $row.calendarEventsDate | dateRu}
                {set $whenTime = $row.calendarEventsDate | date:'H:i'}

                <div class="page__title">
                    <h1>{$row.calendarEventsTitle}</h1>
                </div>
                <div class="section__event">
                    <div class="section__event_description">
                        <ul class="section__event_adress">
                            {if $branch}
                                <li class="section__event_adress_item">
                                    <span>Где:</span>
                                    Филиал&nbsp;{$branch.pagetitle}<br>{$addr ?: 'Адрес не указан'}
                                </li>
                                <li class="section__event_adress_item">
                                    <span>Когда:</span>
                                    {$whenDate ?: 'Дата не указана'}{if $whenTime && $whenTime != '00:00'}, {$whenTime}{/if}
                                </li>
                                <li class="section__event_adress_item">
                                    <a href="{$branch.id | url}"
                                       class="section-line__button section__event_button">
                                        О филиале&nbsp;{$branch.pagetitle}
                                    </a>
                                </li>
                            {else}
                                <li class="section__event_adress_item">
                                    <span>Филиал не указан</span>
                                </li>
                            {/if}
                        </ul>
                        <div class="section__library_person">
                            <picture>
                                <img src="{$row.calendarEventsImage | pthumb:'w=400&zc=1'}"
                                     alt="{$row.calendarEventsTitle}">
                            </picture>
                        </div>
                    </div>

                    <div class="section__event_text">
                        <p>{$row.calendarEventsContent | nl2br}</p>
                    </div>
                </div>
            {else}
                <p>Событие не найдено</p>
            {/if}
        {/if}

        {* События библиотеки *}
        <section class="section section-events section--border-2">
            <div class="section__title">
                <h2>Может быть интересно</h2>
                <a href="{'35' | url}" class="section-books__link">
                    <span>Показать все</span>&nbsp;
                    <i class="fas fa-arrow-right"></i>
                </a>
            </div>

            <div class="section__slider">
                <div class="section-books__main"
                     data-book-slider
                     id="booksSlider_1"
                     data-infinite="false"
                     data-draggable="false"
                     data-slides-per-view="3"
                     data-slides-per-view-large="3"
                     data-slides-per-view-medium="2"
                     data-slides-per-view-small="1"
                     data-gap="20"
                     data-prev-selector="#sectionBooksPrev_2"
                     data-next-selector="#sectionBooksNext_2"
                     data-autoplay="false"
                     data-autoplay-delay="4000">
                    <div class="section-books__grid">
                        {'pdoResources' | snippet: [
                        'limit' => 0,
                        'depth' => 0,
                        'parents' => 35,
                        'tpl' => 'frontEventsTpl',
                        'includeContent' => 1,
                        'sortby' => 'publishedon',
                        'sortdir' => 'desc',
                        'includeTVs' => ''
                        ]}
                    </div>
                </div>
                <div class="section-books__nav section-books__nav--gray">
                    <button class="section-books__nav_button section-books__nav_next section-books__nav_button--light"
                            id="sectionBooksNext_2">
                        <i class="fas fa-arrow-right"></i>
                    </button>
                    <button class="section-books__nav_button section-books__nav_prev section-books__nav_button--light"
                            id="sectionBooksPrev_2">
                        <i class="fas fa-arrow-left"></i>
                    </button>
                </div>
            </div>
        </section>

        {* Подборка библиотеки *}
        <section class="section section-books section--border-1">
            <div class="section__title">
                <h2>Случайная подборка</h2>
                <a href="{'26' | url}" class="section-books__link">
                    <span>Показать все</span>&nbsp;
                    <i class="fas fa-arrow-right"></i>
                </a>
            </div>

            <div class="section__slider">
                <div class="section-books__main"
                     data-book-slider
                     id="booksSlider_2"
                     data-infinite="false"
                     data-draggable="false"
                     data-slides-per-view="7"
                     data-slides-per-view-large="7"
                     data-slides-per-view-medium="5"
                     data-slides-per-view-small="3"
                     data-gap="20"
                     data-prev-selector="#sectionBooksPrev_4"
                     data-next-selector="#sectionBooksNext_4"
                     data-autoplay="false"
                     data-autoplay-delay="4000">
                    <div class="section-books__grid">
                        {'pdoResources' | snippet: [
                        'limit' => 8,
                        'depth' => 0,
                        'parents' => 25,
                        'tpl' => 'frontReadTpl',
                        'includeContent' => 1,
                        'sortby' => 'publishedon',
                        'sortdir' => 'desc',
                        'includeTVs' => ''
                        ]}
                    </div>
                </div>
                <div class="section-books__nav">
                    <button class="section-books__nav_button section-books__nav_next" id="sectionBooksNext_4">
                        <i class="fas fa-arrow-right"></i>
                    </button>
                    <button class="section-books__nav_button section-books__nav_prev" id="sectionBooksPrev_4">
                        <i class="fas fa-arrow-left"></i>
                    </button>
                </div>
            </div>
        </section>
    </div>

</div>
{'footer'|chunk}
{'scripts'|chunk}
</body>
</html>