{* BibliographyEmailTpl - письмо для библиографов *}
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Новая заявка на подбор литературы</title>
</head>
<body style="font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto; padding: 20px;">
    <h2 style="color: #2D3036; border-bottom: 2px solid #3B82F6; padding-bottom: 10px;">
        📚 Новая заявка на подбор литературы
    </h2>

    <table style="width: 100%; border-collapse: collapse; margin: 20px 0;">
        <tr>
            <td style="padding: 8px 12px; background: #F3F4F6; font-weight: 600; width: 40%;">Тип заявки:</td>
            <td style="padding: 8px 12px;">{if $form_type == 'lit_selection'}Тематическая подборка книг
                {elseif $form_type == 'edit_bibliography'}Редактирование библиографических описаний
                {elseif $form_type == 'interlibrary_loan'}Межбиблиотечный абонемент
                {elseif $form_type == 'bibliography_list'}Составление списка литературы
                {else}{$form_type}{/if}</td>
        </tr>
        <tr>
            <td style="padding: 8px 12px; background: #F3F4F6; font-weight: 600;">Тема работы:</td>
            <td style="padding: 8px 12px;">{$name}</td>
        </tr>
        <tr>
            <td style="padding: 8px 12px; background: #F3F4F6; font-weight: 600;">Аспекты темы:</td>
            <td style="padding: 8px 12px;">{$description}</td>
        </tr>
        <tr>
            <td style="padding: 8px 12px; background: #F3F4F6; font-weight: 600;">Ключевые слова:</td>
            <td style="padding: 8px 12px;">{$keywords}</td>
        </tr>
        <tr>
            <td style="padding: 8px 12px; background: #F3F4F6; font-weight: 600;">Количество источников:</td>
            <td style="padding: 8px 12px;">{$need_refs}</td>
        </tr>
        <tr>
            <td style="padding: 8px 12px; background: #F3F4F6; font-weight: 600;">Тип работы:</td>
            <td style="padding: 8px 12px;">
                {if $work_type == 'referat'}Урок (семинар)
                {elseif $work_type == 'kursovaya'}Курсовая
                {elseif $work_type == 'paper'}Краеведение
                {elseif $work_type == 'diplom'}Юбилейная дата
                {else}{$work_type}{/if}
            </td>
        </tr>
        <tr>
            <td style="padding: 8px 12px; background: #F3F4F6; font-weight: 600;">Язык (Русский):</td>
            <td style="padding: 8px 12px;">{if $lang_ru}✅ Да{else}❌ Нет{/if}</td>
        </tr>
        <tr>
            <td style="padding: 8px 12px; background: #F3F4F6; font-weight: 600;">Язык (Английский):</td>
            <td style="padding: 8px 12px;">{if $lang_en}✅ Да{else}❌ Нет{/if}</td>
        </tr>
        <tr>
            <td style="padding: 8px 12px; background: #F3F4F6; font-weight: 600;">Срочность:</td>
            <td style="padding: 8px 12px;">{if $urgent}🔴 Да (нужно завтра){else}🟢 Нет{/if}</td>
        </tr>
        <tr>
            <td style="padding: 8px 12px; background: #F3F4F6; font-weight: 600;">Email пользователя:</td>
            <td style="padding: 8px 12px;"><a href="mailto:{$email}">{$email}</a></td>
        </tr>
        <tr>
            <td style="padding: 8px 12px; background: #F3F4F6; font-weight: 600;">Стоимость:</td>
            <td style="padding: 8px 12px; font-size: 18px; font-weight: 700; color: #3B82F6;">{$price} ₽</td>
        </tr>
        <tr>
            <td style="padding: 8px 12px; background: #F3F4F6; font-weight: 600;">Дата заявки:</td>
            <td style="padding: 8px 12px;">{$_modx->now | date:'Y-m-d H:i:s'}</td>
        </tr>
    </table>

    <div style="margin-top: 20px; padding: 15px; background: #F0FDF4; border-left: 4px solid #22C55E; border-radius: 4px;">
        <p style="margin: 0; color: #166534;">
            <strong>⚠️ Важно:</strong> После обработки заявки, пользователь будет перенаправлен на страницу оплаты.
            Свяжитесь с пользователем по email для уточнения деталей.
        </p>
    </div>

    <p style="margin-top: 30px; padding-top: 15px; border-top: 1px solid #E5E7EB; color: #6B7280; font-size: 12px;">
        Это письмо сгенерировано автоматически. Пожалуйста, не отвечайте на него.
    </p>
</body>
</html>