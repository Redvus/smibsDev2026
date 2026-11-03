/*
Сгенерирован локальной моделью
 */

export default class EventFilter {
    constructor() {
        this.filters = {
            place: document.getElementById('filterEventPlace'),
            type:  document.getElementById('filterEventType'),
            card:  document.getElementById('filterEventCard'),
        };
    }

    getItems() {
        return document.querySelectorAll('.section-books__item');
    }

    // Собираем активные фильтры. «Выбрать ...» — пустое значение.
    getActiveFilters() {
        const out = {};
        Object.entries(this.filters).forEach(([key, el]) => {
            if (!el) return;
            const v = el.value.trim();
            // первая опция — placeholder
            if (el.selectedIndex === 0 || !v) return;
            out[key] = v;
        });
        return out;
    }

    // Проверка одного события на соответствие всем фильтрам (AND)
    match(el, active) {
        for (const [key, val] of Object.entries(active)) {
            const attr = (el.dataset[key] || '').split(',').map(s => s.trim());
            if (!attr.includes(val) && !attr.some(a => a.includes(val))) {
                return false;
            }
        }
        return true;
    }

    // Применение фильтров
    applyFilters() {
        const active = this.getActiveFilters();
        const visibleDates = new Set();
        const visibleEventIds = new Set();

        this.getItems().forEach(el => {
            const ok = this.match(el, active);
            el.style.display = ok ? '' : 'none';
            if (ok) {
                if (el.dataset.date) visibleDates.add(el.dataset.date);
                (el.dataset.events || '').split(',').forEach(id => {
                    if (id) visibleEventIds.add(id);
                });
            }
        });

        // Подсветка дней: активные только там, где есть видимые события
        document.querySelectorAll('.section-events__calendar_days li').forEach(li => {
            const d = li.dataset.date;
            const has = d && visibleDates.has(d);
            li.classList.toggle('section-events__calendar_days--active', has);
            li.classList.toggle('section-events__calendar_days--muted', !has);
        });
    }

    // Навешиваем обработчики на все select с id^=filterEvent
    setupListeners() {
        Object.values(this.filters).forEach(sel => {
            if (sel) sel.addEventListener('change', () => this.applyFilters());
        });

        document.querySelectorAll('.section-events__calendar_days li').forEach(li => {
            li.addEventListener('click', () => this.filterByDate(li.dataset.date));
        });

        document.querySelectorAll('.section-events__calendar_month').forEach(tab => {
            tab.addEventListener('click', () => this.filterByMonth(tab.dataset.month));
        });
    }

    // Фильтрация по дате
    filterByDate(date) {
        const isActive = date && document.querySelector(`.section-events__calendar_days li[data-date="${date}"]`).classList.contains('section-events__calendar_days--selected');

        if (isActive) {
            this.applyFilters();
            return;
        }

        document.querySelectorAll('.section-events__calendar_days li').forEach(x => x.classList.remove('section-events__calendar_days--selected'));
        document.querySelector(`.section-events__calendar_days li[data-date="${date}"]`).classList.add('section-events__calendar_days--selected');

        this.getItems().forEach(el => {
            el.style.display = (el.dataset.date === date) ? '' : 'none';
        });
    }

    // Фильтрация по месяцу
    filterByMonth(month) {
        document.querySelectorAll('.section-events__calendar_month').forEach(x => x.classList.remove('active'));
        document.querySelector(`.section-events__calendar_month[data-month="${month}"]`).classList.add('active');

        document.querySelectorAll('.section-events__calendar_days').forEach(ul => {
            ul.style.display = (ul.dataset.month === month) ? '' : 'none';
        });
    }
}
