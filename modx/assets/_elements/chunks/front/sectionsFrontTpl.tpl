{var $idFront = $id | resource: 'id'}
{if $idFront == 12}
    <section class="section section-intro">
        <div class="slider" id="sliderIntro">
            <div class="slider_item">
                <picture>
                    <img src="/assets/images/sliderIntro/bannerSlide_1.png" alt="">
                </picture>
            </div>
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
            <h2>{25 | resource: 'pagetitle'}</h2>
            <a href="{25 | url}">
                <span class="news-single__link">Подробнее</span>&nbsp;
                <i class="fas fa-circle-arrow-right"></i>
            </a>
        </div>

        <div class="section-books__grid">
            {'pdoResources' | snippet: [
                'limit' => 7,
                'depth' => 0,
                'parents' => 25,
                'tpl' => 'frontReadTpl',
                'includeContent' => 1,
                'sortby' => 'publishedon',
                'sortdir' => 'desc',
                'includeTVs' => '',

            ]}
        </div>
    </section>

{elseif $idFront == 13}
    <section class="section section-events section--border-2">
        <div class="section__title">
            <h2>{35 | resource: 'pagetitle'}</h2>
            <a href="{35 | url}">
                <span class="news-single__link">Подробнее</span>&nbsp;
                <i class="fas fa-circle-arrow-right"></i>
            </a>
        </div>

        <div class="section-events__grid">
            {'pdoResources' | snippet: [
                'limit' => 3,
                'depth' => 0,
                'parents' => 35,
                'tpl' => 'frontEventsTpl',
                'includeContent' => 1,
                'sortby' => 'publishedon',
                'sortdir' => 'desc',
                'includeTVs' => '',

            ]}
        </div>
    </section>

{elseif $idFront == 14}
    <section class="section section-books section--border-3">
        <div class="section__title">
            <h2>{26 | resource: 'pagetitle'}</h2>
            <a href="{26 | url}">
                <span class="news-single__link">Подробнее</span>&nbsp;
                <i class="fas fa-circle-arrow-right"></i>
            </a>
        </div>

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
    </section>
{/if}