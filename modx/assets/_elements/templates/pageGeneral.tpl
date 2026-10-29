<!doctype html>
<!--[if IE 8]> <html lang="ru" class="ie8"> <![endif]-->
<!--[if !IE]><!--> <html lang="rus"> <!--<![endif]-->
{'head'|chunk}
<body>
<div class="wrapper">
{*     {'preloader'|chunk}*}
    {'header'|chunk}
    {* {'nav-main'|chunk} *}
    {* {'main-content'|chunk} *}

    {var $idMain = $id | resource: 'id'}
    {if $idMain == 1}
        {'pdoResources' | snippet: [
            'limit' => 0,
            'depth' => 1,
            'parents' => 1,
            'tpl' => 'sectionsFrontTpl',
            'includeContent' => 1,
            'sortby' => 'menuindex',
            'sortdir' => 'asc'
        ]}

    {elseif $idMain == 13}
        <div class="page__header">
            <div class="page__title">
                <h1>{$_modx -> resource.longtitle}</h1>
            </div>
{*            <div class="page__breadcrumbs">*}
{*                {'breadcrumbs' | chunk}*}
{*            </div>*}
        </div>
        <section class="section section-intro">
            <div id="mapGeography" style="width:100%; height:50vmin"></div>
        </section>

        <section class="section section-line">
            <ul class="section-line__block">
                {'pdoResources' | snippet: [
                'limit' => 0,
                'depth' => 1,
                'tpl' => 'libraryTpl',
                'includeContent' => 1,
                'sortby' => 'menuindex',
                'sortdir' => 'asc'
                ]}
            </ul>
        </section>

        {* Случайная подборка *}
        <section class="section section-books section--border-1">
            <div class="section__title">
                <h2>Случайная подборка</h2>
                <a href="{'25' | url}" class="section-books__link">
                    <span>Показать все</span>&nbsp;
                    <i class="fas fa-arrow-right"></i>
                </a>
            </div>

            <div class="section__slider">
                <div class="section-books__main"
                     data-book-slider
                     id="booksNew"
                     data-infinite="false"
                     data-draggable="false"
                     data-slides-per-view="7"
                     data-slides-per-view-large="7"
                     data-slides-per-view-medium="5"
                     data-slides-per-view-small="3"
                     data-gap="20"
                     data-prev-selector="#sectionBooksPrev"
                     data-next-selector="#sectionBooksNext"
                     data-autoplay="false"
                     data-autoplay-delay="4000">
                    <div class="section-books__grid">
                        {'pdoResources' | snippet: [
                        'limit' => 0,
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
                    <button class="section-books__nav_button section-books__nav_next" id="sectionBooksNext">
                        <i class="fas fa-arrow-right"></i>
                    </button>
                    <button class="section-books__nav_button section-books__nav_prev" id="sectionBooksPrev">
                        <i class="fas fa-arrow-left"></i>
                    </button>
                </div>
            </div>
        </section>
    {/if}

    {* {'prototypeBack'|chunk} *}
</div>
    {'footer'|chunk}
    {'scripts'|chunk}
</body>
</html>