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
            <div class="page__grid">
                {'pdoResources' | snippet: [
                'limit' => 0,
                'depth' => 0,
                'tpl' => 'frontReadTpl',
                'includeContent' => 1,
                'sortby' => 'publishedon',
                'sortdir' => 'desc',
                'includeTVs' => ''
                ]}
            </div>
        {/if}
    </div>
</div>

{'footer'|chunk}
{'scripts'|chunk}
</body>

</html>