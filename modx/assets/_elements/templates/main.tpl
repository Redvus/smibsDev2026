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


    {/if}

    {* {'prototypeBack'|chunk} *}
</div>
    {'footer'|chunk}
    {'scripts'|chunk}
</body>
</html>