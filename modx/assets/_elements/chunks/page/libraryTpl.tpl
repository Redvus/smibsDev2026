<li class="section-line__item">
    <a href="{$id | url}" class="section-line__link">
        <picture class="read-single__image">
            <img src="{$id | resource: 'readImage' | phpthumb:'w=210&h=300&zc=1'}"
                 alt="{$id | resource: 'longtitle' ?: $id | resource: 'pagetitle'}">
        </picture>
        <span class="section-line__title">
            {$id | resource: 'pagetitle'}
        </span>
    </a>
    <div class="section-line__description">
        <h3 class="section-line__name">{$id | resource: 'introtext'}</h3>
    </div>
    <a href="{$id | url}" class="section-line__button">о филиале</a>