<!doctype html>
<!--[if IE 8]>
<html lang="ru" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="rus">
<!--<![endif]-->
{'head'|chunk}

<body>
<div class="wrapper">
    {'header'|chunk}

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
            <ul class="section-events__calendar_year">
                <li class="section-events__calendar_month">Октябрь</li>
                <li class="section-events__calendar_month active">Ноябрь</li>
            </ul>
            <ul class="section-events__calendar_days">
                <li>01<span>пн</span></li>
                <li>02<span>вт</span></li>
                <li>03<span>ср</span></li>
                <li>04<span>чт</span></li>
                <li>05<span>пт</span></li>
                <li class="section-events__calendar_days--weekend">06<span>сб</span></li>
                <li class="section-events__calendar_days--weekend">07<span>вс</span></li>
                <li class="section-events__calendar_days--weekend">08<span>пн</span></li>
                <li class="section-events__calendar_days--weekend">09<span>вт</span></li>
                <li class="section-events__calendar_days--weekend">10<span>ср</span></li>
                <li>11<span>чт</span></li>
                <li>12<span>пт</span></li>
                <li class="section-events__calendar_days--weekend">13<span>сб</span></li>
                <li class="section-events__calendar_days--weekend">14<span>вс</span></li>
                <li>15<span>пн</span></li>
                <li class="section-events__calendar_days--active">16<span>вт</span></li>
                <li>17<span>ср</span></li>
                <li>18<span>чт</span></li>
                <li>19<span>пт</span></li>
                <li class="section-events__calendar_days--weekend">20<span>пн</span></li>
                <li class="section-events__calendar_days--weekend">21<span>пн</span></li>
                <li>22<span>пн</span></li>
                <li>23<span>пн</span></li>
                <li>24<span>пн</span></li>
                <li>25<span>пн</span></li>
                <li>26<span>пн</span></li>
                <li class="section-events__calendar_days--weekend">27<span>пн</span></li>
                <li class="section-events__calendar_days--weekend">28<span>пн</span></li>
                <li>29<span>пн</span></li>
                <li>30<span>пн</span></li>
                <li>31<span>пн</span></li>
            </ul>
        </div>

        <div class="section-events__filters">
            <div class="filter-block">
                <div class="section-events__text filter-block__title">
                    Филиалы
                </div>
                <select class="filter-block__select">
                    <option>Выбрать филиал</option>
                    <option>ЦГБ</option>
                    <option>Филиал №1</option>
                    <option>Филиал №2</option>
                    <option>Филиал №3</option>
                    <option>Филиал №4</option>
                    <option>Филиал №5</option>
                </select>
            </div>
            <div class="filter-block">
                <div class="filter-block__title">
                    Вид события
                </div>
                <select class="filter-block__select">
                    <option>Выбрать тип события</option>
                    <option>Лекции и лектории</option>
                    <option>Прогулки</option>
                    <option>Интерактивные программы</option>
                    <option>Творческие лаборатории и мастер-классы</option>
                    <option>Встречи и беседы</option>
                    <option>Клубы и объединения</option>
                    <option>Массовые мероприятия</option>
                    <option>Выставки</option>
                    <option>Акции и конкурсы</option>
                    <option>Тематические уроки</option>
                    <option>Другие</option>
                </select>
            </div>
            <div class="filter-block">
                <div class="filter-block__title">
                    Пушкинская карта
                </div>
                <select class="filter-block__select">
                    <option>Выбрать карту</option>
                    <option>Лекции и лектории</option>
                    <option>Прогулки</option>
                    <option>Интерактивные программы</option>
                </select>
            </div>

        </div>

        <div class="section-events__grid section-events__grid--page">
            {'pdoResources' | snippet: [
            'limit' => 0,
            'depth' => 3,
            'parents' => 18,
            'tpl' => 'frontEventsTpl',
            'includeContent' => 1,
            'sortby' => 'publishedon',
            'sortdir' => 'desc',
            'includeTVs' => '',
            'where' => ['template != 8']
            ]}
        </div>

    </div>
</div>

{'footer'|chunk}
{'scripts'|chunk}
</body>

</html>