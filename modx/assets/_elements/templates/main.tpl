<!doctype html>
<!--[if IE 8]> <html lang="ru" class="ie8"> <![endif]-->
<!--[if !IE]><!--> <html lang="rus"> <!--<![endif]-->
{'head'|chunk}
<body>
<div class="wrapper">
    {* {'preloader'|chunk} *}
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
    {/if}

    {'prototypeBack'|chunk}
</div>
    {'footerBanners' | chunk}
    {'footer'|chunk}
    {'scripts'|chunk}
</body>
</html>