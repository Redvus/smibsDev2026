<a href="{$id | url}" class="section__title">
    <h2>{$id | resource: "pagetitle" ?: $id | resource: "longtitle"}</h2>
</a>
{var $idMain = $id | resource: 'id'}
{if $idMain == 25}
    <div class="section-books__main">
        <div class="section-books__grid">
            {'pdoResources' | snippet: [
            'limit' => 7,
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
                <i class="fas fa-arrow-right"></i>
            </button>
        </div>
    </div>

{elseif $idMain == 26}
    <div class="section-books__main">
        <div class="section-books__grid">
            {'pdoResources' | snippet: [
            'limit' => 7,
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
                <i class="fas fa-arrow-right"></i>
            </button>
        </div>
    </div>

{/if}