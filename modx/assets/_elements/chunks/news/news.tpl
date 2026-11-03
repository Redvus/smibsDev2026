<!doctype html>
<!--[if IE 8]> <html lang="ru" class="ie8"> <![endif]-->
<!--[if !IE]><!--> <html lang="rus"> <!--<![endif]-->
{'head'|chunk}
<body>
    <div class="wrapper">
        {'header'|chunk}
        {'headerWave' | chunk}

        <div class="page">
            <div class="page__header">
                <div class="page__title">
                    <h1>{$_modx -> resource.pagetitle ?: $_modx -> resource.longtitle}</h1>
                </div>
                <div class="page__breadcrumbs">
                    {'breadcrumbs' | chunk}
                </div>
            </div>
            <div class="page__content page__news">
                <div class="page__news_image">
                    <picture>
                        <img src="{$_modx -> resource.imageNews}" alt="{$_modx -> resource.pagetitle ?: $_modx -> resource.longtitle}">
                    </picture>
                </div>
                <div class="page__news_text">
                    {$id | resource: "content"}
                </div>
            </div>
        </div>

        {'footer'|chunk}
    </div>

    {'scripts'|chunk}
</body>
</html>
