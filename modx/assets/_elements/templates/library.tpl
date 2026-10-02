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
        <div class="section__grid section__library">
            <div class="section__grid_description">
                <div class="section__grid_header">
                    <div class="page__title section__grid_title">
                        <h1>Библиотека&nbsp;{$_modx -> resource.pagetitle}</h1>
                    </div>
                    <ul class="section__library_location">
                        <li class="section__library_address">
                            <span>Адрес:</span>
                            {$_modx -> resource.introtext}
                        </li>
                        <li class="section__library_address">
                            <span>Телефон:</span>
                            {$_modx -> resource.introtext}
                        </li>
                        <li class="section__library_address">
                            <span>Электронная&nbsp;почта:</span>
                            {$_modx -> resource.introtext}
                        </li>
                    </ul>
                </div>
                <div class="section__grid_text">
                    <p>{$_modx -> resource.content}</p>
                </div>
            </div>

            <div class="section__library_person">
                <picture>
                    <img src="{$_modx -> resource.readImage}"
                         alt="{$_modx -> resource.pagetitle}. {$_modx -> resource.introtext}">
                </picture>
                <span class="section__library_ceo">
                    <span class="section__library_name">
                        Константинопольский Константин Константинович
                    </span>
                    <span class="section__library_post">
                        Директор
                    </span>
                </span>
            </div>
        </div>

        {* События библиотеки *}
        <section class="section section-events section--border-2">
            <div class="section__title">
                <h2>События&nbsp;в&nbsp;библиотеке&nbsp;{$_modx -> resource.pagetitle}</h2>
                <a href="{'35' | url}" class="section-books__link">
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
                <h2>Подборка&nbsp;библиотеки&nbsp;{$_modx -> resource.pagetitle}</h2>
                <a href="{'26' | url}" class="section-books__link">
                    <span>Показать все</span>&nbsp;
                    <i class="fas fa-arrow-right"></i>
                </a>
            </div>

            <div class="section__slider">
                <div class="section-books__main"
                     data-book-slider
                     id="booksSlider_4"
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