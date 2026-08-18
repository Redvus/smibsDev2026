<header class="header">
    <div class="header__logo">
        <a href="{$_modx -> config.site_url}">
            {'smibsLogoNew' | chunk}
        </a>
        <span>{$_modx -> config.companyName}</span>
    </div>

    <nav id="nav" class="header__nav" role="navigation">
        {'!pdoMenu' | snippet: [
            'parents' => 0,
            'level' => 3,
            'outerTpl' => 'outerTpl',
            'innerTpl' => 'innerTpl',
            'parentRowTpl' => 'parentRowTpl',
            'innerRowTpl' => 'innerRowTpl',
            'rowTpl' => 'rowTpl',
            'sortby' => 'menuindex',
            'sortdir' => 'asc',
            'hereClass' => 'active',
            'outerClass' => 'nav'
        ]}
    </nav>

    <div class="header__social">
        {'socialBlock' | chunk}
    </div>

</header>