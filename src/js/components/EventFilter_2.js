// ============================================
// EventFilter — фильтрация событий + календарь
// ============================================

export default class EventFilter {
    /**
     * @param {Object} options
     * @param {string}   options.itemSelector       — селектор карточки события
     * @param {Object[]} options.filters            — конфиг фильтров
     * @param {string}   options.filters[].key      — ключ (place/type/card/...)
     * @param {string}   options.filters[].selector — CSS-селектор select
     * @param {string}   options.filters[].attr     — data-атрибут без "data-" (по умолчанию = key)
     * @param {string}   options.calendarSelector   — корень календаря
     * @param {string}   options.daysSelector       — ul со днями (по умолчанию внутри calendar)
     * @param {string}   options.monthTabSelector   — li месяцев
     * @param {string}   options.monthBlockSelector — ul дней конкретного месяца
     * @param {string}   options.activeClass        — класс активного дня
     * @param {string}   options.mutedClass         — класс «нет событий под фильтром»
     * @param {string}   options.selectedClass      — класс выбранного дня
     * @param {string}   options.monthActiveClass   — класс активной вкладки месяца
     */
    constructor(options = {}) {
        this.options = {
            itemSelector:        '.section-books__item',
            calendarSelector:    '.section-events__calendar',
            monthTabSelector:    '.section-events__calendar_month',
            monthBlockSelector:  '.section-events__calendar_days',
            daySelector:         '.section-events__calendar_days li',
            activeClass:         'section-events__calendar_days--active',
            mutedClass:          'section-events__calendar_days--muted',
            selectedClass:       'section-events__calendar_days--selected',
            monthActiveClass:    'active',

            // 🔽 расширяемо: добавляйте новые фильтры сюда
            filters: [
                { key: 'place', selector: '#filterEventPlace', attr: 'place' },
                { key: 'type',  selector: '#filterEventType',  attr: 'type'  },
                { key: 'card',  selector: '#filterEventCard',  attr: 'card'  },
            ],
            ...options,
        };

        this.elements = {
            items:       [],
            filterSelects: {},
            monthTabs:   [],
            monthBlocks: [],
        };

        this.state = {
            active:   {},      // { place: 'ЦГБ', type: '...' }
            selectedDate: null,
            currentMonth: null,
        };

        this._handlers = [];
        this._initialized = false;
    }

    // ---------- публичный API (совместим с App) ----------

    init() {
        if (this._initialized) return this;
        this.cacheElements();
        this.setupListeners();
        this.applyFilters();
        this._initialized = true;
        return this;
    }

    destroy() {
        this._handlers.forEach(({ el, type, fn }) =>
            el.removeEventListener(type, fn));
        this._handlers = [];
        this._initialized = false;
    }

    // ---------- кэш DOM ----------

    cacheElements() {
        this.elements.items = Array.from(
            document.querySelectorAll(this.options.itemSelector)
        );

        this.elements.filterSelects = {};
        this.options.filters.forEach(({ key, selector }) => {
            const el = document.querySelector(selector);
            if (el) this.elements.filterSelects[key] = el;
        });

        this.elements.monthTabs = Array.from(
            document.querySelectorAll(this.options.monthTabSelector)
        );
        this.elements.monthBlocks = Array.from(
            document.querySelectorAll(this.options.monthBlockSelector)
        );

        // текущий месяц — первый блок
        if (this.elements.monthBlocks.length) {
            this.state.currentMonth = this.elements.monthBlocks[0].dataset.month;
        }
    }

    // ---------- обработчики ----------

    setupListeners() {
        // Select-фильтры
        Object.entries(this.elements.filterSelects).forEach(([key, el]) => {
            const fn = () => {
                this.state.active[key] = this._readSelectValue(el);
                this.applyFilters();
            };
            el.addEventListener('change', fn);
            this._handlers.push({ el, type: 'change', fn });
        });

        // Клик по дням календаря
        const dayEls = document.querySelectorAll(this.options.daySelector);
        dayEls.forEach(el => {
            const fn = (e) => this.onDayClick(el, e);
            el.addEventListener('click', fn);
            this._handlers.push({ el, type: 'click', fn });
        });

        // Переключение месяцев
        this.elements.monthTabs.forEach(tab => {
            const fn = () => this.switchMonth(tab.dataset.month);
            tab.addEventListener('click', fn);
            this._handlers.push({ el: tab, type: 'click', fn });
        });
    }

    _readSelectValue(el) {
        if (!el) return null;
        if (el.selectedIndex === 0) return null;   // placeholder
        const v = el.value.trim();
        return v || null;
    }

    // ---------- основная логика ----------

    /**
     * Возвращает true, если карточка удовлетворяет всем активным фильтрам
     * (AND между фильтрами, OR внутри одного — по запятой в data-атрибуте).
     */
    matchItem(item) {
        for (const { key, attr } of this.options.filters) {
            const want = this.state.active[key];
            if (!want) continue;

            const raw = item.dataset[attr] || '';
            const values = raw.split(',').map(s => s.trim()).filter(Boolean);

            // частичное совпадение — удобно для мультивыборных TV
            const ok = values.some(v =>
                v === want || v.includes(want) || want.includes(v)
            );
            if (!ok) return false;
        }
        return true;
    }

    // Выделение на дне остается, если выбран фильтр, у которого событий нет
    // applyFilters() {
    //     const visibleDates = new Set();
    //
    //     this.elements.items.forEach(item => {
    //         const ok = this.matchItem(item);
    //         item.style.display = ok ? '' : 'none';
    //
    //         if (ok && item.dataset.date) {
    //             visibleDates.add(item.dataset.date);
    //         }
    //     });
    //
    //     // если выбран конкретный день — сузим до него
    //     if (this.state.selectedDate) {
    //         this.elements.items.forEach(item => {
    //             const match = item.dataset.date === this.state.selectedDate;
    //             if (!match) item.style.display = 'none';
    //         });
    //     }
    //
    //     this.updateCalendarHighlight(visibleDates);
    // }

    // Выделение снимается с дня
    applyFilters() {
        const visibleDates = new Set();
        this.elements.items.forEach(item => {
            const ok = this.matchItem(item);
            item.style.display = ok ? '' : 'none';
            if (ok && item.dataset.date) visibleDates.add(item.dataset.date);
        });

        // если выбранная дата «опустела» — снимаем выбор
        if (this.state.selectedDate && !visibleDates.has(this.state.selectedDate)) {
            this.state.selectedDate = null;
            document.querySelectorAll(this.options.daySelector).forEach(el =>
                el.classList.remove(this.options.selectedClass));
        }

        if (this.state.selectedDate) {
            this.elements.items.forEach(item => {
                if (item.dataset.date !== this.state.selectedDate) {
                    item.style.display = 'none';
                }
            });
        }

        this.updateCalendarHighlight(visibleDates);
    }

    updateCalendarHighlight(visibleDates) {
        // все дни во всех месяцах
        document.querySelectorAll(this.options.daySelector).forEach(li => {
            const d = li.dataset.date;
            if (!d) return;

            const has = visibleDates.has(d);
            li.classList.toggle(this.options.activeClass, has);
            li.classList.toggle(this.options.mutedClass, !has);
        });
    }

    onDayClick(li, event) {
        if (event) event.stopPropagation();
        const date = li.dataset.date;
        if (!date) return;

        // 🔒 блокируем клик по «пустым» дням
        if (li.classList.contains(this.options.mutedClass)) return;

        const alreadySelected = li.classList.contains(this.options.selectedClass);

        // снять выделение со всех
        document.querySelectorAll(this.options.daySelector).forEach(el =>
            el.classList.remove(this.options.selectedClass));

        if (alreadySelected) {
            // повторный клик — сбрасываем выбор дня
            this.state.selectedDate = null;
            this.applyFilters();
            return;
        }

        li.classList.add(this.options.selectedClass);
        this.state.selectedDate = date;

        // фильтруем карточки только по выбранной дате (с учётом остальных фильтров)
        this.applyFilters();
    }

    switchMonth(month) {
        if (!month) return;
        this.state.currentMonth = month;

        this.elements.monthTabs.forEach(tab => {
            tab.classList.toggle(
                this.options.monthActiveClass,
                tab.dataset.month === month
            );
        });

        this.elements.monthBlocks.forEach(block => {
            block.style.display = block.dataset.month === month ? '' : 'none';
        });
    }

    // ---------- утилиты (для внешнего вызова) ----------

    reset() {
        Object.values(this.elements.filterSelects).forEach(sel => sel.selectedIndex = 0);
        this.state.active = {};
        this.state.selectedDate = null;
        document.querySelectorAll(this.options.daySelector).forEach(el =>
            el.classList.remove(this.options.selectedClass));
        this.applyFilters();
    }
}