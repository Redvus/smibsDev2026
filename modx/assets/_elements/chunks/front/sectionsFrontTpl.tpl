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

{elseif $idFront == 7}
    <section class="section section-news section--border-1">
        <a href="{18 | resource: "introtext" | url}" class="section__title">
            <h2>{18 | resource: 'pagetitle'}</h2>
        </a>

        <div class="section-news__grid">
            {'pdoResources' | snippet: [
                'limit' => 4,
                'depth' => 0,
                'parents' => 18 | resource: "introtext",
                'tpl' => 'frontNewsTpl',
                'includeContent' => 1,
                'sortby' => 'publishedon',
                'sortdir' => 'desc',
                'includeTVs' => '',

            ]}
        </div>
    </section>

{elseif $idFront == 13}
<section class="section section-news section--border-2">
    <a href="{18 | resource: "introtext" | url}" class="section__title">
        <h2>{18 | resource: 'pagetitle'}</h2>
    </a>

    <div class="section-news__grid">
        {'pdoResources' | snippet: [
            'limit' => 4,
            'depth' => 0,
            'parents' => 18 | resource: "introtext",
            'tpl' => 'frontNewsTpl',
            'includeContent' => 1,
            'sortby' => 'publishedon',
            'sortdir' => 'desc',
            'includeTVs' => '',

        ]}
    </div>
</section>

{elseif $idFront == 14}
    <section class="section section-news section--border-3">
        <a href="{20 | url}" class="section__title">
            <h2>{20 | resource: 'pagetitle'}</h2>
        </a>

        <div class="section-news__grid">
            {'pdoResources' | snippet: [
                'limit' => 3,
                'depth' => 0,
                'parents' => 20,
                'tpl' => 'frontNewsTpl',
                'includeContent' => 1,
                'sortby' => 'publishedon',
                'sortdir' => 'desc',
                'includeTVs' => ''
            ]}
        </div>
    </section>
{/if}