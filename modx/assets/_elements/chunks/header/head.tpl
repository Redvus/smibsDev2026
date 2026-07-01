<head>
    <base href="{$_modx -> config.site_url}">
    <title>{if $_modx->resource.id == 1}{$_modx -> config.site_name}{else}{$_modx->resource.pagetitle} | {$_modx -> config.site_name}{/if}
    </title>
    <meta charset="{$_modx -> config.modx_charset}" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="author" content="Alexander Suvorov">
    <meta name="format-detection" content="telephone=no">
    {'ss_meta.canonical' | placeholder}
    {'ss_meta.keywords' | placeholder}
    {'ss_meta.meta_description' | placeholder}
    {'ss_meta.robots' | placeholder}
    {'ss_meta.alternates' | placeholder}
    <meta name='yandex-verification' content="{'meta-yandex'|chunk}" />

    <!-- Mobile Specific Meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale = 1, user-scalable=no" />

    <link rel="icon" href="../favicon.svg" type="image/x-icon" />
    {* <link rel="icon" type="image/svg+xml" href="favicon.svg" />
    <link rel="mask-icon" href="favicon.svg" color="#000000" />
    <link rel="apple-touch-icon" href="apple-touch-icon.png"> *}

    <!-- Open Graph Protocol metadata -->
    <meta property="og:title" content="{$_modx->resource.longtitle ?: $_modx->resource.pagetitle}" />
    <meta property="og:site_name" content="{$_modx -> config.site_name}" />
    <meta property="og:url" content="{$_modx->resource.id | url : ["scheme" => "full"]}" />
    <meta property="og:description" content="{$_modx->resource.description}" />
    <meta property="og:image" content="{$_modx -> config.site_url}[[*tv_image]]" />
    <!-- <meta property="og:type" content="article" /> -->

    <!-- google plus schema -->
    <link rel="author" href="http://redvus.ru">
    <meta itemprop="title" content="{$_modx->resource.longtitle ?: $_modx->resource.pagetitle}" />
    <meta itemprop="description" content="{$_modx->resource.description}" />
    [[*tv_image:notempty=`<meta itemprop="image" content="{$_modx -> config.site_url}[[*tv_image]]" />`]]

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    {if $_modx->config.vite_dev_mode}
        <script type="module" src="http://localhost:5173/@vite/client"></script>

        {* Старые стили *}
        <link rel="stylesheet" href="http://localhost:5173/scss/oldSCSS/main_old.scss">

        {* Новые стили *}
        <link rel="stylesheet" href="http://localhost:5173/scss/main.scss">

        {* <script type="module" src="http://localhost:5173/js/layoutOld.js"></script> *}
        <script type="module" src="http://localhost:5173/js/main.js"></script>
    {else}
        <link rel="stylesheet" href="/assets/css/main.css">
        <script type="module" src="/assets/js/main.js"></script>
    {/if}

    {if $_modx -> resource.id == 6}
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>
    {/if}

    {* <link rel="stylesheet" href="{'!fileversion' | snippet: ['input' => '/assets/css/.css']}"> *}

    <!-- Modernizr if needed -->
    <!-- <script type="text/javascript" src="/assets/js/modernizr-custom.js"></script> -->
</head>