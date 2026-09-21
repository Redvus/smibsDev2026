<li class="section-books__item">
    <a href="{$id | url}">
        <picture class="read-single__image">
            <img src="{$id | resource: 'readImage' | phpthumb:'w=210&h=300&zc=1'}" alt="{$id | resource: 'longtitle' ?: $id | resource: 'pagetitle'}">
        </picture>
        <span class="section-books__age">
    {*        {$id | resource: 'readAge'}*}
            16+
        </span>
    </a>
    <div class="section-books__description">
        <h4 class="section-books__name">{$id | resource: 'introtext'}</h4>
        <h3 class="section-books__title">{$id | resource: 'pagetitle'}</h3>
    </div>