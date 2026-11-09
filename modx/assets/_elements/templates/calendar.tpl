<!doctype html>
<!--[if IE 8]>
<html lang="ru" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="rus">
<!--<![endif]-->
{include 'head'}

<body>
<div class="wrapper">
    {include 'header'}

    <div class="page">
        <div class="page__header">
            <div class="page__title">
                <h1>{$_modx -> resource.longtitle ?: $_modx -> resource.pagetitle}</h1>
            </div>
{*            <div class="page__breadcrumbs">*}
{*                {'breadcrumbs' | chunk}*}
{*            </div>*}
        </div>

        <div class="section-events__calendar">
            {$_modx->runSnippet('!eventCalendar', [
            'parents'     => 18,
            'depth'       => 3,
            'monthsCount' => 3
            ])}
        </div>

        <div class="section-events__filters">
            <div class="filter-block">
                <div class="section-events__text filter-block__title">
                    Филиалы
                </div>
                <select class="filter-block__select" id="filterEventPlace">
                    <option>Выбрать филиал</option>
                    {$_modx->runSnippet('getBranchOptions', ['parents' => 13, 'mode' => 'select'])}
                </select>
            </div>

            <div class="filter-block">
                <div class="filter-block__title">
                    Вид события
                </div>
                <select class="filter-block__select" id="filterEventType">
                    {$_modx->runSnippet('getEventTypesOptions', ['tv' => 'calendarEventsTermsList'])}
                </select>
            </div>

            <div class="filter-block">
                <div class="filter-block__title">
                    Условия участия
                </div>
                <select class="filter-block__select" id="filterEventEntrance">
                    {$_modx->runSnippet('getEventTypesOptions', ['tv' => 'calendarEventsEntranceList'])}
                </select>
            </div>

            <div class="filter-block">
                <div class="filter-block__title">
                    Возрастное&nbsp;ограничение
                </div>
                <select class="filter-block__select" id="filterEventAge">
                    {$_modx->runSnippet('getEventTypesOptions', ['tv' => 'calendarEventsAgeList'])}
                </select>
            </div>

{*            <div class="filter-block">*}
{*                <div class="filter-block__title">*}
{*                    Пушкинская карта*}
{*                </div>*}
{*                <select class="filter-block__select" id="filterEventCard">*}
{*                    <option>Выбрать карту</option>*}
{*                    <option>Лекции и лектории</option>*}
{*                    <option>Прогулки</option>*}
{*                    <option>Интерактивные программы</option>*}
{*                </select>*}
{*            </div>*}

        </div>

        <div class="section-events__grid section-events__grid--page">
            {'pdoResources' | snippet: [
            'limit' => 0,
            'depth' => 3,
            'parents' => 18,
            'tpl' => 'frontEventsTpl',
            'includeContent' => 1,
            'processTVs' => 1,
            'sortby' => 'publishedon',
            'sortdir' => 'desc',
            'includeTVs' => 'eventPlace,eventType,eventDate',
            'where' => ['template != 8']
            ]}
        </div>

    </div>
</div>

{include 'footer'}
{include 'scripts'}
</body>

</html>