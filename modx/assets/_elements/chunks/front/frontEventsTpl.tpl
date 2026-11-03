<li class="section-books__item"
    data-place="{$id | resource: "introtext" ?: 'none'}"
    data-type="{$id | resource: "description" ?: 'none'}"
    data-card="{$eventCard ?: 'none'}"
    data-date="{$eventDate ?: $publishedon | date:'Y-m-d'}">
    <div class="section-events__top">
        <picture>
            <img src="{$id | resource: 'readImage' | pthumb:'w=400&zc=1'}" alt="{$id | resource: 'pagetitle' ?: $id | resource: 'longtitle'}">
        </picture>
    </div>
    <div class="section-events__bottom">
        <div class="section-events__header">
            <div class="section-events__text">
                <span></span>
            </div>
            <div class="section-events__date">
                <span>{$id | resource: 'publishedon' | dateRu}</span>
            </div>
        </div>
        <div class="section-events__description">
            <a href="{$id | url}" class="section-events__title">
                <span>{$id | resource: "pagetitle"}</span>
            </a>
            <span class="section-events__place">{$id | resource: "description"}</span>
        </div>
    </div>
</li>


{*<li class="section-books__item" data-place="" data-type="" data-card="">*}
{*    <div class="section-events__top">*}
{*        <picture>*}
{*            <img src="{$id | resource: 'readImage' | pthumb:'w=400&zc=1'}" alt="{$id | resource: 'pagetitle' ?: $id | resource: 'longtitle'}">*}
{*        </picture>*}
{*    </div>*}
{*    <div class="section-events__bottom">*}
{*        <div class="section-events__header">*}
{*            <div class="section-events__text">*}
{*                <span>{$id | resource: "introtext"}</span>*}
{*            </div>*}
{*            <div class="section-events__date">*}
{*                <span>{$id | resource: 'publishedon' | dateRu}</span>*}
{*            </div>*}
{*        </div>*}
{*        <div class="section-events__description">*}
{*            <a href="{$id | url}" class="section-events__title">*}
{*                <span>{$id | resource: "pagetitle"}</span>7*}
{*            </a>*}
{*            <span class="section-events__place">{$id | resource: "description"}</span>*}
{*        </div>*}
{*        *}{* <a href="{$id | url}" class="section-events__footer">*}
{*            <span class="news-single__link">Подробнее</span>&nbsp;*}
{*            <i class="fas fa-circle-arrow-right"></i>*}
{*        </a> *}
{*    </div>*}
{*</li>*}