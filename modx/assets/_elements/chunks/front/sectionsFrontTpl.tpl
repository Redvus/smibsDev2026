{var $idFront = $id | resource: 'id'}
{if $idFront == 12}
    <section class="section section-intro">
        <div class="section__slider" id="sliderIntro">
            {'sliderTopTpl' | chunk : ['id' => $id]}
        </div>
    </section>

    <section class="section section-service">
        {'!SimpleSearchForm' | snippet: [
            'landing' => 69,
            'tpl' => 'searchTpl'
        ]}
        <div class="section-service__event">
            {'pdoResources' | snippet: [
                'limit' => 1,
                'depth' => 0,
                'parents' => 35,
                'tpl' => 'sectionEventTpl',
                'includeContent' => 1,
                'sortby' => 'publishedon',
                'sortdir' => 'desc',
                'includeTVs' => '',

            ]}
        </div>
    </section>

{elseif $idFront == 7}
    <section class="section section-books section--border-1">
        <div class="section__title">
            <h2>{'25' | resource: 'pagetitle'}</h2>
            <a href="{'25' | url}" class="section-books__link">
                <span>Показать все</span>&nbsp;
                <i class="fas fa-arrow-right"></i>
            </a>
        </div>

        <div class="section__slider">
            <div class="section-books__main"
                 data-book-slider
                 id="booksSlider_1"
                 data-infinite="false"
                 data-draggable="false"
                 data-slides-per-view="7"
                 data-slides-per-view-large="7"
                 data-slides-per-view-medium="5"
                 data-slides-per-view-small="3"
                 data-gap="20"
                 data-prev-selector="#sectionBooksPrev_1"
                 data-next-selector="#sectionBooksNext_1"
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
            </div>
            <div class="section-books__nav">
                <button class="section-books__nav_button section-books__nav_next" id="sectionBooksNext_1">
                    <i class="fas fa-arrow-right"></i>
                </button>
                <button class="section-books__nav_button section-books__nav_prev"  id="sectionBooksPrev_1">
                    <i class="fas fa-arrow-left"></i>
                </button>
            </div>
        </div>
    </section>

{elseif $idFront == 13}
    <section class="section section-events section--border-2">
        <div class="section__title">
            <h2>{'35' | resource: 'pagetitle'}</h2>
            <a href="{'35' | url}" class="section-books__link">
                <span>Показать все</span>&nbsp;
                <i class="fas fa-arrow-right"></i>
            </a>
        </div>

        <div class="section__slider">
            <div class="section-books__main"
                 data-book-slider
                 id="booksSlider_2"
                 data-infinite="false"
                 data-draggable="false"
                 data-slides-per-view="3"
                 data-slides-per-view-large="3"
                 data-slides-per-view-medium="2"
                 data-slides-per-view-small="1"
                 data-gap="20"
                 data-prev-selector="#sectionBooksPrev_2"
                 data-next-selector="#sectionBooksNext_2"
                 data-autoplay="false"
                 data-autoplay-delay="4000">
                <div class="section-books__grid">
                    {'pdoResources' | snippet: [
                    'limit' => 0,
                    'depth' => 0,
                    'parents' => 35,
                    'tpl' => 'frontEventsTpl',
                    'includeContent' => 1,
                    'sortby' => 'publishedon',
                    'sortdir' => 'desc',
                    'includeTVs' => ''
                    ]}
                </div>
            </div>
            <div class="section-books__nav section-books__nav--gray">
                <button class="section-books__nav_button section-books__nav_next section-books__nav_button--light" id="sectionBooksNext_2">
                    <i class="fas fa-arrow-right"></i>
                </button>
                <button class="section-books__nav_button section-books__nav_prev section-books__nav_button--light"  id="sectionBooksPrev_2">
                    <i class="fas fa-arrow-left"></i>
                </button>
            </div>
        </div>
    </section>

{elseif $idFront == 41}
    <section class="section section-books section--border-3">
        <div class="section__title">
            <h2>{'20' | resource: 'pagetitle'}</h2>
            <a href="{'20' | url}" class="section-books__link">
                <span>Показать все</span>&nbsp;
                <i class="fas fa-arrow-right"></i>
            </a>
        </div>

        <div class="section__slider">
            <div class="section-books__main"
                 data-book-slider
                 id="booksSlider_3"
                 data-infinite="false"
                 data-draggable="false"
                 data-slides-per-view="5"
                 data-slides-per-view-large="5"
                 data-slides-per-view-medium="3"
                 data-slides-per-view-small="1"
                 data-gap="20"
                 data-prev-selector="#sectionBooksPrev_3"
                 data-next-selector="#sectionBooksNext_3"
                 data-autoplay="false"
                 data-autoplay-delay="4000">
                <div class="section-books__grid">
                    {'pdoResources' | snippet: [
                    'limit' => 0,
                    'depth' => 0,
                    'parents' => 20,
                    'tpl' => 'frontReadTpl',
                    'includeContent' => 1,
                    'sortby' => 'publishedon',
                    'sortdir' => 'desc',
                    'includeTVs' => ''
                    ]}
                </div>
            </div>
            <div class="section-books__nav">
                <button class="section-books__nav_button section-books__nav_next" id="sectionBooksNext_3">
                    <i class="fas fa-arrow-right"></i>
                </button>
                <button class="section-books__nav_button section-books__nav_prev"  id="sectionBooksPrev_3">
                    <i class="fas fa-arrow-left"></i>
                </button>
            </div>
        </div>
    </section>

{elseif $idFront == 14}
    <section class="section section-books section--border-1">
        <div class="section__title">
            <h2>{'26' | resource: 'pagetitle'}</h2>
            <a href="{'26' | url}" class="section-books__link">
                <span>Показать все</span>&nbsp;
                <i class="fas fa-arrow-right"></i>
            </a>
        </div>

        <div class="section__slider">
            <div class="section-books__main"
                 data-book-slider
                 id="booksSlider_4"
                 data-infinite="false"
                 data-draggable="false"
                 data-slides-per-view="7"
                 data-slides-per-view-large="7"
                 data-slides-per-view-medium="5"
                 data-slides-per-view-small="3"
                 data-gap="20"
                 data-prev-selector="#sectionBooksPrev_4"
                 data-next-selector="#sectionBooksNext_4"
                 data-autoplay="false"
                 data-autoplay-delay="4000">
                <div class="section-books__grid">
                    {'pdoResources' | snippet: [
                    'limit' => 8,
                    'depth' => 0,
                    'parents' => 25,
                    'tpl' => 'frontReadTpl',
                    'includeContent' => 1,
                    'sortby' => 'publishedon',
                    'sortdir' => 'desc',
                    'includeTVs' => ''
                    ]}
                </div>
            </div>
            <div class="section-books__nav">
                <button class="section-books__nav_button section-books__nav_next" id="sectionBooksNext_4">
                    <i class="fas fa-arrow-right"></i>
                </button>
                <button class="section-books__nav_button section-books__nav_prev"  id="sectionBooksPrev_4">
                    <i class="fas fa-arrow-left"></i>
                </button>
            </div>
        </div>
    </section>
{/if}