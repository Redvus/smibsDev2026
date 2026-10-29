{* ============================================
    slider.tpl — универсальный вариант
============================================ *}

{* Определяем id ресурса *}
{set $resourceId = $id ?: $_modx->resource.id ?: $modx->resource.id}

{* Получаем данные MigX *}
{set $slides = $resourceId | resource : 'slider' | fromJSON}

{* Если есть слайды — показываем *}
{if $slides && $slides | length > 0}
    {set $imagePrefix = $_modx->config.assets_url ~ 'images/'}

    {set $jsonParts = []}
    {foreach $slides as $slide}
        {set $imagePath = $slide.slide_image ?: ''}
        {if $imagePath}
            {set $imagePath = $imagePrefix ~ $imagePath}
        {/if}
        {set $jsonParts[] = '{"slide_image":"' ~ $imagePath ~ '","slide_title":"' ~ ($slide.slide_title ?: '') ~ '","slide_description":"' ~ ($slide.slide_description ?: '') ~ '","slide_link":"' ~ ($slide.slide_link ?: '') ~ '","slide_button":"' ~ ($slide.slide_button ?: '') ~ '"}'}
    {/foreach}
    {set $slidesJson = '[' ~ ($jsonParts | join : ',') ~ ']'}

    {* Выводим слайдер *}
    <div class="slider-component"
         data-slider="1"
         data-slides='{$slidesJson}'
         data-field-image="slide_image"
         data-field-title=""
         data-delay-title="50"
         data-field-button="slide_button"
         data-delay-button="50"
         data-anim-button="fadeInDown"
         data-field-link="slide_link"
         data-anim-duration="200"
         data-autoplay="false"
         data-autoplay-delay="2000">

        <div class="slider-container">
            <div class="slider-track">
                <!-- Слайды будут вставлены автоматически -->
            </div>
        </div>

        <div class="slider-controls">
            <div class="dots-container"></div>
        </div>

        <div class="nav-buttons">
            <button class="btn btn-arrow slider-prev" aria-label="Предыдущий">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M15 18l-6-6 6-6"/>
                </svg>
            </button>
            <button class="btn btn-arrow slider-next" aria-label="Следующий">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M9 18l6-6-6-6"/>
                </svg>
            </button>
        </div>
    </div>
{else}
    <div class="slider-empty">Нет слайдов для отображения</div>
{/if}