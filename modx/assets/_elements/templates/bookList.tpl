<!doctype html>
<!--[if IE 8]> <html lang="ru" class="ie8"> <![endif]-->
<!--[if !IE]><!--> <html lang="rus"> <!--<![endif]-->
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
            {'pdoResources' | snippet: [
                'limit' => 0,
                'depth' => 0,
                'parents' => 20,
                'tpl' => 'pageReadTpl',
                'includeContent' => 1,
                'sortby' => 'menuindex',
                'sortdir' => 'asc',
                'includeTVs' => ''
            ]}
        </div>
    </div>

    {'footer'|chunk}
    {'scripts'|chunk}
</body>
</html>