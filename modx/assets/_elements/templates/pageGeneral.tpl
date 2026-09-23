<!doctype html>
<!--[if IE 8]> <html lang="ru" class="ie8"> <![endif]-->
<!--[if !IE]><!--><html lang="rus"><!--<![endif]-->
{'head'|chunk}
<body>
    {*'preloader'|chunk*}
    <div class="wrapper">
        {'header'|chunk}

        <div class="main-content">
            {'breadcrumbs'|chunk}

            <div class="main-content__inside">
                {if $_modx->resource.id != 8280}
                    <div class="main-content__title">
                        <h1>{$_modx->resource.longtitle ?: $_modx->resource.pagetitle}</h1>
                    </div>
                    <div class="main-content__text main-content__text--single">
                        {$_modx -> resource.content}

                        {if $_modx -> resource.id == 20}
                            <div class="main-content__doc-block">
                                <div class="main-content__subtitle">
                                    <h2>{2525 | resource: 'pagetitle'}</h2>
                                </div>
                                <ul class="main-content__doc">
                                    {set $rows = 2525 | resource: 'documents' | fromJSON}
                                    {foreach $rows as $row}
                                    <li>
                                        <a href="assets/images/{$row.documentsLink}" target="_blank">
                                            <picture>
                                                <img src="assets/images/documents/documents_preview.jpg" alt="{$row.documentsTitle}" />
                                            </picture>
                                            <span>{$row.documentsTitle}</span>
                                        </a>
                                    </li>
                                    {/foreach}
                                </ul>
                            </div>
                        {/if}
                    </div>
                {/if}
            </div>
        </div>
    </div>

    {'blind-menu'|chunk}
    {'footer'|chunk}
    {'footer-mobile'|chunk}
    {'scripts'|chunk}
</body>
</html>