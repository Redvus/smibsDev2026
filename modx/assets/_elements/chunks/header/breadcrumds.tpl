<div class="main-content__breadcrumbs">
    {'pdoCrumbs' | snippet : [
    'showHome' => 1,
    'outputSeparator' => '<li>&nbsp;/&nbsp;</li>',
    'tplWrapper' => '@INLINE <ul itemscope="" itemtype="http://schema.org/BreadcrumbList" id="breadcrumbs">{$output}</ul>',
    'tpl' => '@INLINE
    <li><span itemscope="" itemprop="itemListElement" itemtype="http://schema.org/ListItem">
            <a title="{$menutitle}" itemprop="item" href="{$link}"><span itemprop="name">{$menutitle}</span>
                <meta itemprop="position" content="{$idx}"></a>
        </span></li>',
    'tplCurrent' => '@INLINE
    <li><span itemscope="" itemprop="itemListElement" itemtype="http://schema.org/ListItem">
            <span itemprop="name">{$menutitle}</span>
            <meta itemprop="position" content="{$idx}">
        </span></li>'
    ]}
</div>