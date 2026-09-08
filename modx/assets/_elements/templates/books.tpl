<!doctype html>
<!--[if IE 8]>
<html lang="ru" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="rus"> <!--<![endif]-->
{'head'|chunk}
<body>
<div class="wrapper">
    {'header'|chunk}

    <div class="page">
        <div class="section__grid">
            <div class="section__grid_description">
                <div class="section__grid_header">
                    <div class="page__title section__grid_title">
                        <h1>{$_modx -> resource.pagetitle}</h1>
                    </div>
                    <div class="page__title page__subtitle">
                        <h1>{$_modx -> resource.introtext}</h1>
                    </div>
                    <div class="page__breadcrumbs">
                        {'breadcrumbs' | chunk}
                    </div>
                </div>
                <div class="section__grid_text">
                    <p>{$_modx -> resource.content}</p>
                </div>
            </div>

            <div class="section__grid_image">
                <picture>
                    <img src="{$_modx -> resource.readImage}"
                         alt="{$_modx -> resource.pagetitle}. {$_modx -> resource.introtext}">
                </picture>
                <span class="section__grid_age">16+</span>
            </div>
        </div>
        <div class="section__grid">
            <p>{$_modx -> resource.librarySelect}</p>
        </div>
        <div class="section__grid section__grid_footer">
            <div class="section__grid_warning">
                <div class="section__grid_icon">
                    <i class="fas fa-warning"></i>
                </div>
                <span>{$_modx -> resource.librarySpeaker}</span>
            </div>
            <span></span>
        </div>
    </div>
</div>

{'footer'|chunk}
{'scripts'|chunk}
</body>
</html>