<div class="news-preview">
    <div class="news-preview__top">
        <picture>
            <img src="{$id | resource: "imageNews"}" alt="{$id | resource: "pagetitle" ?: $id | resource: "longtitle"}">
        </picture>
    </div>
    <div class="news-preview__bottom">
        <div class="news-preview__header">
            <div class="news-preview__date">
                {$id | resource: 'publishedon' | date: 'd / m / y'}
            </div>
        </div>
        <div class="news-preview__description">
            <a href="{$id | url}" class="news-preview__title">
                <h4>{$id | resource: "pagetitle"}</h4>
            </a>
            <div class="news-preview__text">
                <p>{$id | resource: "introtext" | ellipsis: 180}</p>
            </div>
        </div>
        <a href="{$id | url}" class="news-preview__footer">
            <span class="news-single__link">Подробнее</span>&nbsp;
            <i class="fas fa-circle-arrow-right"></i>
        </a>
    </div>
</div>