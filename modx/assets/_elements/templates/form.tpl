<!doctype html>
<!--[if IE 8]> <html lang="ru" class="ie8"> <![endif]-->
<!--[if !IE]><!--> <html lang="rus"> <!--<![endif]-->
{'head'|chunk}
<body>
<div class="wrapper">
    <div class="sidebar"></div>
    <div class="sidebar-static"></div>
    <div class="header header--desktop">
        <div class="header__nav">
            <div class="header__top"></div>
            <div class="header__bottom"></div>
        </div>
        <a href="javascript:void(0);" class="header__blind" id="blindButton">
            <i class="fa fa-eye"></i>
            <p>Контрастная версия</p>
        </a>
    </div>

    <div class="main-content">
        <div class="main-content__inside">
            {if $_modx->resource.id == 11}
                <div class="main-content__block">
                    {'select-literature'|chunk}
                </div>
                <div class="general__container general__container--links">
                    <div class="general__info">
                        <h2 class="general__title general__title--first">Другие услуги</h2>
                    </div>
                    <div class="main-content__block main-content__block--links">
                        <a href="#form" class="general__btn btn btn--simple">Заказать книгу</a>
                    </div>
                </div>
            {/if}
        </div>
    </div>

    <div class="footer"></div>

</div>
    {* {'preloader'|chunk} *}
    {* {'header'|chunk} *}
    {* {'nav-main'|chunk} *}
    {* {'main-content'|chunk} *}
    {* {'footer'|chunk} *}
    {'scripts'|chunk}
</body>
</html>