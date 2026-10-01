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
            <div class="section-news__grid">
                {'pdoResources' | snippet: [
                    'limit' => 3,
                    'depth' => 0,
                    'parents' => 17 | resource: "introtext",
                    'tpl' => 'frontNewsTpl',
                    'includeContent' => 1,
                    'sortby' => 'publishedon',
                    'sortdir' => 'desc',
                    'includeTVs' => ''
                ]}
            </div>
        </div>

        {'footer'|chunk}
    </div>

    {'scripts'|chunk}
</body>
</html>