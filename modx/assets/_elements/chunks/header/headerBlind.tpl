<div class="blind-menu" id="blindMenu" role="menu">
    <div class="blind-menu__section">
        <span class="blind-menu__label">Размер шрифта:</span>
        <div class="blind-menu__group">
            <button class="blind-menu__btn" data-font="small" aria-label="Маленький шрифт">A</button>
            <button class="blind-menu__btn active" data-font="medium" aria-label="Средний шрифт">A</button>
            <button class="blind-menu__btn" data-font="large" aria-label="Большой шрифт">A</button>
            <button class="blind-menu__btn" data-font="xlarge" aria-label="Очень большой шрифт">A</button>
        </div>
    </div>

    <div class="blind-menu__section">
        <span class="blind-menu__label">Цветовая схема:</span>
        <div class="blind-menu__group">
            <button class="blind-menu__btn blind-menu__btn--color" data-theme="default" style="background: #ffffff; color: #000000;" aria-label="Стандартная схема">
                <span>Ц</span>
            </button>
            <button class="blind-menu__btn blind-menu__btn--color" data-theme="dark" style="background: #000000; color: #ffffff;" aria-label="Черно-белая схема">
                <span>Ц</span>
            </button>
            <button class="blind-menu__btn blind-menu__btn--color" data-theme="blue" style="background: #0a2463; color: #ffffff;" aria-label="Синяя схема">
                <span>Ц</span>
            </button>
            <button class="blind-menu__btn blind-menu__btn--color" data-theme="yellow" style="background: #ffd700; color: #000000;" aria-label="Желтая схема">
                <span>Ц</span>
            </button>
        </div>
    </div>

    <div class="blind-menu__section">
        <span class="blind-menu__label">Контраст:</span>
        <div class="blind-menu__group">
            <button class="blind-menu__btn" data-contrast="normal" aria-label="Нормальный контраст">Обычный</button>
            <button class="blind-menu__btn" data-contrast="high" aria-label="Высокий контраст">Высокий</button>
        </div>
    </div>

    <div class="blind-menu__section">
        <span class="blind-menu__label">Интервал:</span>
        <div class="blind-menu__group">
            <button class="blind-menu__btn" data-spacing="normal" aria-label="Обычный интервал">Обычный</button>
            <button class="blind-menu__btn" data-spacing="large" aria-label="Большой интервал">Большой</button>
        </div>
    </div>

    <button class="blind-menu__reset" id="blindReset">Сбросить настройки</button>
</div>