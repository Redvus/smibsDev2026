<li class="section-books__item">
    <div class="section-events__top">
        <picture>
            <img src="{$id | resource: 'readImage' | pthumb:'w=400&zc=1'}" alt="{$id | resource: 'pagetitle' ?: $id | resource: 'longtitle'}">
        </picture>
    </div>
    <div class="section-events__bottom">
        <div class="section-events__header">
            <div class="section-events__text">
                <span>{$id | resource: "introtext"}</span>
            </div>
            <div class="section-events__date">
                <span>{$id | resource: 'publishedon' | date: 'd / m / y'}</span>
            </div>
        </div>
        <div class="section-events__description">
            <div href="{$id | url}" class="section-events__title">
                <h3>{$id | resource: "pagetitle"}</h3>
            </div>
            <span class="section-events__place">{$id | resource: "description"}</span>
        </div>
        {* <a href="{$id | url}" class="section-events__footer">
            <span class="news-single__link">Подробнее</span>&nbsp;
            <i class="fas fa-circle-arrow-right"></i>
        </a> *}
    </div>
</li>