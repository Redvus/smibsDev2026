<div class="event__item">
    <div class="event__left">
        <h4 class="event__date">{$id | resource: 'publishedon' | date: 'd / m / y'}</h4>
    </div>
    <div class="event__right">
        <div class="event__header">
            <div href="{$id | url}">
                <h4 class="event__title">{$id | resource: "pagetitle"}</h4>
            </div>
            <div class="event__text">
                <p>{$id | resource: "content"}</p>
            </div>
        </div>
    </div>
</div>