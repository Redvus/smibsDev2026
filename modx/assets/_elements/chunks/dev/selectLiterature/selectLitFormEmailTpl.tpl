{* PaymentFormEmailTpl *}
<p><strong>Тема работы:</strong> {$name}</p>
<p><strong>Аспекты:</strong> {$description}</p>
<p><strong>Ключевые слова:</strong> {$keywords}</p>
<p><strong>Количество источников:</strong> {$need_refs}</p>
<p><strong>Тип работы:</strong>
    {if $work_type == 'referat'}Реферат
    {elseif $work_type == 'kursovaya'}Курсовая
    {elseif $work_type == 'paper'}Научная статья
    {elseif $work_type == 'diplom'}Диплом
    {elseif $work_type == 'thesis'}Диссертация
    {else}{$work_type}{/if}
</p>
<p><strong>Язык (Русский):</strong> {if $lang_ru}Да{else}Нет{/if}</p>
<p><strong>Язык (Английский):</strong> {if $lang_en}Да{else}Нет{/if}</p>
<p><strong>Срочность:</strong> {if $urgent}Да{else}Нет{/if}</p>
<p><strong>Включить патенты:</strong> {if $search_patents}Да{else}Нет{/if}</p>
<p><strong>Открытый доступ:</strong> {if $open_access}Да{else}Нет{/if}</p>
<p><strong>Email:</strong> {$email}</p>