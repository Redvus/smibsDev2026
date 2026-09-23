<!doctype html>
<!--[if IE 8]>
<html lang="ru" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="rus">
<!--<![endif]-->
{'head'|chunk}

<body>
<div class="wrapper">
    {'header'|chunk}

    <div class="page">
        <div class="page__header">
            <div class="page__title">
                <h1>{$_modx -> resource.pagetitle ?: $_modx -> resource.longtitle}</h1>
            </div>
            <div class="page__breadcrumbs">
                {'breadcrumbs' | chunk}
            </div>
        </div>

        {if $_modx -> resource.content}
            <div class="page__description">
                {$_modx -> resource.content}
            </div>
        {/if}

        {if $_modx -> resource.template == 8}
            <div class="page__grid">
                {'pdoResources' | snippet: [
                'limit' => 0,
                'depth' => 0,
                'tpl' => 'frontNewsTpl',
                'includeContent' => 1,
                'sortby' => 'publishedon',
                'sortdir' => 'desc',
                'includeTVs' => ''
                ]}
            </div>

        {elseif $_modx -> resource.template == 10}
            <section class="page__grid">
                {'pdoResources' | snippet: [
                'limit' => 0,
                'depth' => 0,
                'tpl' => 'frontReadTpl',
                'includeContent' => 1,
                'sortby' => 'publishedon',
                'sortdir' => 'desc',
                'includeTVs' => ''
                ]}
            </section>

            <section class="section section-books section--border-1">
                <div class="section__title">
                    <h2>Случайная подборка</h2>
                    <a href="{'26' | url}">
                        <span class="news-single__link">Показать все</span>&nbsp;
                        <i class="fas fa-circle-arrow-right"></i>
                    </a>
                </div>

                <div class="section-books__main">
                    <div class="section-books__grid">
                        {'pdoResources' | snippet: [
                        'limit' => 7,
                        'depth' => 0,
                        'parents' => 25,
                        'tpl' => 'frontReadTpl',
                        'includeContent' => 1,
                        'sortby' => 'publishedon',
                        'sortdir' => 'desc',
                        'includeTVs' => ''
                        ]}
                    </div>

                    <div class="section-books__nav">
                        <button class="section-books__nav_button section-books__nav_next" id="sectionBooksNext">
                            <i class="fas fa-arrow-right"></i>
                        </button>
                        <button class="section-books__nav_button section-books__nav_prev"  id="sectionBooksPrev">
                            <i class="fas fa-arrow-right"></i>
                        </button>
                    </div>
                </div>
            </section>
        {/if}
    </div>
</div>

{'footer'|chunk}
{'scripts'|chunk}
</body>

</html>