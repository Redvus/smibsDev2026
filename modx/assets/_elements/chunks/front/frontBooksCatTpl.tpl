<li class="section-books__item">
    <a href="{$id | url}">
        <picture class="section-books__image section-books__image--fixed">
            <img src="{$id | resource: 'readImage' | phpthumb:'w=210&h=300&zc=1'}" alt="{$id | resource: 'pagetitle'}">
        </picture>
    </a>
    <span class="section-books__title">{$id | resource: 'pagetitle'}</span>