<li class="section-books__item">
    <a href="{$id | url}">
        <picture class="read-single__image">
            <img src="{$id | resource: 'readImage' | phpthumb:'w=210&h=300&zc=1'}" alt="{$id | resource: 'longtitle' ?: $id | resource: 'pagetitle'}">
        </picture>
    </a>
    <span>{$id | resource: 'longtitle' ?: $id | resource: 'pagetitle'}</span>