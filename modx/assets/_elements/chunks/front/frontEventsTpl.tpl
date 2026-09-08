<div class="section-events__item">
    <div class="section-events__top">
        <picture>
            <img src="{$id | resource: 'readImage' | pthumb:'w=400&zc=1'}" alt="{$id | resource: 'pagetitle' ?: $id | resource: 'longtitle'}">
        </picture>
    </div>
    <div class="section-events__bottom">
        <div class="section-events__header">
            <div class="section-events__text">
                <p>{$id | resource: "introtext"}</p>
            </div>
            <div class="section-events__date">
                {$id | resource: 'publishedon' | date: 'd / m / y'}
            </div>
        </div>
        <div class="section-events__description">
            <div href="{$id | url}" class="section-events__title">
                <h4>{$id | resource: "pagetitle"}</h4>
            </div>
            <span class="section-events__place">{$id | resource: "description"}</span>
        </div>
        {* <a href="{$id | url}" class="section-events__footer">
            <span class="news-single__link">Подробнее</span>&nbsp;
            <i class="fas fa-circle-arrow-right"></i>
        </a> *}
    </div>
</div>