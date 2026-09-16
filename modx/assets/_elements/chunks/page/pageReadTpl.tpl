<a href="{$id | url}" class="section__title">
    <h2>{$id | resource: "pagetitle" ?: $id | resource: "longtitle"}</h2>
</a>
{var $idMain = $id | resource: 'id'}
{if $idMain == 25}
    <div class="section-books__main"
         data-book-slider
         id="booksSlider_1"
         data-infinite="false"
         data-slides-per-view="7"
         data-slides-per-view-large="7"
         data-slides-per-view-medium="5"
         data-slides-per-view-small="3"
         data-gap="20"
         data-autoplay="false"
         data-autoplay-delay="4000">
        <div class="section-books__grid">
            {'pdoResources' | snippet: [
            'limit' => 0,
            'depth' => 0,
            'parents' => 25,
            'tpl' => 'frontReadTpl',
            'includeContent' => 1,
            'sortby' => 'publishedon',
            'sortdir' => 'desc',
            'includeTVs' => ''
            ]}
        </div>

        <div class="section-books__nav">
            <button class="section-books__nav_button section-books__nav_next" id="sectionBooksNext">
                <i class="fas fa-arrow-right"></i>
            </button>
            <button class="section-books__nav_button section-books__nav_prev" id="sectionBooksPrev">
                <i class="fas fa-arrow-left"></i>
            </button>
        </div>
    </div>

{elseif $idMain == 26}
    <div class="section-books__main"
         data-book-slider
         id="booksSlider_2"
         data-infinite="false"
         data-slides-per-view="7"
         data-slides-per-view-large="7"
         data-slides-per-view-medium="5"
         data-slides-per-view-small="3"
         data-gap="20"
         data-autoplay="false"
         data-autoplay-delay="4000">
        <div class="section-books__grid">
            {'pdoResources' | snippet: [
            'limit' => 0,
            'depth' => 0,
            'parents' => 26,
            'tpl' => 'frontReadTpl',
            'includeContent' => 1,
            'sortby' => 'publishedon',
            'sortdir' => 'desc',
            'includeTVs' => ''
            ]}
        </div>

        <div class="section-books__nav">
            <button class="section-books__nav_button section-books__nav_next" id="sectionBooksNext">
                <i class="fas fa-arrow-right"></i>
            </button>
            <button class="section-books__nav_button section-books__nav_prev" id="sectionBooksPrev">
                <i class="fas fa-arrow-left"></i>
            </button>
        </div>
    </div>

{/if}