/**
 * BookSlider — универсальный слайдер для книг
 * Настройки через data-атрибуты
 * @class BookSlider
 */
export default class BookSlider {
    constructor(element, options = {}) {
        this.container = typeof element === 'string'
            ? document.querySelector(element)
            : element;

        if (!this.container) {
            console.warn('❌ BookSlider: контейнер не найден');
            return;
        }

        // 🔥 Читаем ВСЕ настройки из data-атрибутов
        this.config = this._readConfig(options);

        // DOM
        this.grid = this.container.querySelector(this.config.gridSelector);

        // 🔥 Кнопки ищем через селекторы, указанные в data-атрибутах
        // Если селектор начинается с '#' или '.', ищем по всему документу
        this.prevBtn = this._findElement(this.config.prevSelector);
        this.nextBtn = this._findElement(this.config.nextSelector);

        if (!this.grid) {
            console.warn('❌ BookSlider: grid не найден');
            return;
        }

        // Если слайдер отключён — выходим
        if (this.config.disabled) {
            console.log('ℹ️ BookSlider: отключён через data-disabled');
            return this;
        }

        // Состояние
        this.slides = [];
        this.totalSlides = 0;
        this.currentIndex = 0;
        this.realIndex = 0;
        this.isAnimating = false;
        this.isDragging = false;
        this.autoplayTimer = null;
        this.originalSlidesHTML = null;

        // Drag
        this.dragStartX = 0;
        this.dragCurrentX = 0;
        this.dragDiff = 0;

        this.isInitialized = false;
        this._isDestroyed = false;

        this.init = this.init.bind(this);
        this.destroy = this.destroy.bind(this);
        this.getState = this.getState.bind(this);

        this.init();
    }

    /**
     * 🔥 Чтение конфигурации из data-атрибутов
     * @param {Object} options - Опции по умолчанию
     * @returns {Object}
     * @private
     */
    _readConfig(options) {
        const data = this.container.dataset;

        // Парсинг чисел
        const parseInt10 = (value, fallback) => {
            const parsed = parseInt(value, 10);
            return isNaN(parsed) ? fallback : parsed;
        };

        // Парсинг boolean
        const parseBool = (value, fallback) => {
            if (value === undefined || value === null || value === '') return fallback;
            return value !== 'false' && value !== '0';
        };

        return {
            // Селекторы
            gridSelector: data.gridSelector || options.gridSelector || '.section-books__grid',
            slideSelector: data.slideSelector || options.slideSelector || '.section-books__item',
            prevSelector: data.prevSelector || options.prevSelector || '.section-books__nav_prev',
            nextSelector: data.nextSelector || options.nextSelector || '.section-books__nav_next',

            // Режимы
            infinite: parseBool(data.infinite, options.infinite ?? true),
            disabled: parseBool(data.disabled, options.disabled ?? false),

            // Количество слайдов
            slidesPerView: parseInt10(data.slidesPerView, options.slidesPerView ?? 4),
            slidesPerViewLarge: parseInt10(data.slidesPerViewLarge, options.slidesPerViewLarge ?? 3),
            slidesPerViewMedium: parseInt10(data.slidesPerViewMedium, options.slidesPerViewMedium ?? 2),
            slidesPerViewSmall: parseInt10(data.slidesPerViewSmall, options.slidesPerViewSmall ?? 1),

            // Анимации
            gap: parseInt10(data.gap, options.gap ?? 20),
            transitionDuration: parseInt10(data.transitionDuration, options.transitionDuration ?? 500),

            // Автоплей
            autoplay: parseBool(data.autoplay, options.autoplay ?? false),
            autoplayDelay: parseInt10(data.autoplayDelay, options.autoplayDelay ?? 4000),

            // Drag
            draggable: parseBool(data.draggable, options.draggable ?? true),
            dragThreshold: parseInt10(data.dragThreshold, options.dragThreshold ?? 50),

            // Breakpoints (можно переопределить)
            breakpointSmall: parseInt10(data.breakpointSmall, options.breakpointSmall ?? 810),
            breakpointMedium: parseInt10(data.breakpointMedium, options.breakpointMedium ?? 1080),
            breakpointLarge: parseInt10(data.breakpointLarge, options.breakpointLarge ?? 1680),
        };
    }

    /**
     * Инициализация
     */
    init() {
        if (this.isInitialized) {
            console.warn('⚠️ BookSlider already initialized');
            return this;
        }

        // Собираем оригинальные слайды
        const originalSlides = Array.from(this.grid.querySelectorAll(this.config.slideSelector));
        this.totalSlides = originalSlides.length;

        if (this.totalSlides === 0) {
            console.log('ℹ️ BookSlider: нет слайдов');
            return this;
        }

        if (this.totalSlides <= 1) {
            console.log('ℹ️ BookSlider: только 1 слайд, слайдер не нужен');
            return this;
        }

        this._setup();

        if (this.totalSlides < 2) return this;

        this._bindEvents();
        this._updatePosition(false);
        this._updateButtons();

        if (this.config.autoplay) {
            this.startAutoplay();
        }

        this.isInitialized = true;
        console.log(`✅ BookSlider initialized (${this.totalSlides} слайдов, infinite: ${this.config.infinite})`);

        return this;
    }

    /**
     * Первоначальная настройка
     * @private
     */
    _setup() {
        // Сохраняем оригинальный HTML для destroy
        this.originalSlidesHTML = Array.from(
            this.grid.querySelectorAll(this.config.slideSelector)
        ).map(el => el.outerHTML);

        // Создаём клоны если infinite
        if (this.config.infinite) {
            this._createClones();
        }

        // Пересчитываем слайды
        this.slides = Array.from(this.grid.querySelectorAll(this.config.slideSelector));

        // Настраиваем стили
        this._setupGridStyles();
    }

    /**
     * Настройка стилей grid
     * @private
     */
    _setupGridStyles() {
        const grid = this.grid;

        grid.style.display = 'flex';
        grid.style.flexWrap = 'nowrap';
        grid.style.gap = `${this.config.gap}px`;
        grid.style.transition = 'none';
        grid.style.willChange = 'transform';
        grid.style.cursor = this.config.draggable ? 'grab' : 'default';
        grid.style.userSelect = 'none';
        grid.style.padding = '0';
        grid.style.margin = '0';
        grid.style.listStyle = 'none';

        if (grid.parentNode) {
            grid.parentNode.style.overflow = 'hidden';
        }

        this._updateSlideWidths();

        // Начальная позиция
        if (this.config.infinite) {
            this.currentIndex = 1;
        } else {
            this.currentIndex = 0;
        }
        this.realIndex = 0;
    }

    /**
     * Обновление ширины слайдов
     * @private
     */
    _updateSlideWidths() {
        const slides = this.grid.querySelectorAll(this.config.slideSelector);
        const gap = this.config.gap;
        const slidesPerView = this._getSlidesPerView();

        slides.forEach(slide => {
            slide.style.flex = `0 0 calc((100% - ${gap * (slidesPerView - 1)}px) / ${slidesPerView})`;
            slide.style.maxWidth = `calc((100% - ${gap * (slidesPerView - 1)}px) / ${slidesPerView})`;
            slide.style.listStyle = 'none';
        });
    }

    /**
     * Получить количество слайдов в видимой области
     * @private
     */
    _getSlidesPerView() {
        const width = window.innerWidth;

        if (width <= this.config.breakpointSmall) {
            return this.config.slidesPerViewSmall;
        } else if (width <= this.config.breakpointMedium) {
            return this.config.slidesPerViewMedium;
        } else if (width <= this.config.breakpointLarge) {
            return this.config.slidesPerViewLarge;
        } else {
            return this.config.slidesPerView;
        }
    }

    /**
     * Максимальный индекс для не-infinite
     * @private
     */
    _getMaxIndex() {
        const slidesPerView = this._getSlidesPerView();
        const maxIndex = this.totalSlides - slidesPerView;
        return Math.max(0, maxIndex);
    }

    /**
     * Создание клонов
     * @private
     */
    _createClones() {
        const originalSlides = Array.from(this.grid.querySelectorAll(this.config.slideSelector));
        const total = originalSlides.length;

        const lastClone = originalSlides[total - 1].cloneNode(true);
        lastClone.classList.add('section-books__item--clone');
        lastClone.setAttribute('aria-hidden', 'true');
        this.grid.insertBefore(lastClone, originalSlides[0]);

        const firstClone = originalSlides[0].cloneNode(true);
        firstClone.classList.add('section-books__item--clone');
        firstClone.setAttribute('aria-hidden', 'true');
        this.grid.appendChild(firstClone);

        this.currentIndex = 1;
        this.realIndex = 0;
    }

    /**
     * Привязка событий
     * @private
     */
    _bindEvents() {
        if (this.prevBtn) {
            this._onPrevClick = (e) => {
                e.preventDefault();
                this.prev();
            };
            this.prevBtn.addEventListener('click', this._onPrevClick);
        }

        if (this.nextBtn) {
            this._onNextClick = (e) => {
                e.preventDefault();
                this.next();
            };
            this.nextBtn.addEventListener('click', this._onNextClick);
        }

        // Resize
        this._onResize = this._debounce(() => {
            if (this._isDestroyed) return;
            this._updateSlideWidths();

            const maxIndex = this._getMaxIndex();
            if (this.realIndex > maxIndex) {
                this.realIndex = maxIndex;
                this.currentIndex = this.config.infinite ? maxIndex + 1 : maxIndex;
            }

            this._updatePosition(false);
            this._updateButtons();
        }, 200);
        window.addEventListener('resize', this._onResize);

        // Drag
        if (this.config.draggable) {
            this._bindDragEvents();
        }

        // Transitionend
        this._onTransitionEnd = () => this._handleTransitionEnd();
        this.grid.addEventListener('transitionend', this._onTransitionEnd);

        // Autoplay pause on hover
        if (this.config.autoplay) {
            this._onMouseEnter = () => this.stopAutoplay();
            this._onMouseLeave = () => this.startAutoplay();
            this.container.addEventListener('mouseenter', this._onMouseEnter);
            this.container.addEventListener('mouseleave', this._onMouseLeave);
        }
    }

    /**
     * 🔥 Поиск элемента (внутри контейнера или по всему документу)
     * @param {string} selector
     * @returns {HTMLElement|null}
     * @private
     */
    _findElement(selector) {
        if (!selector) return null;

        // Если селектор начинается с 'document:' — ищем по всему документу
        if (selector.startsWith('document:')) {
            const realSelector = selector.replace('document:', '');
            return document.querySelector(realSelector);
        }

        // По умолчанию — ищем внутри контейнера
        const inside = this.container.querySelector(selector);
        if (inside) return inside;

        // 🔥 Если не нашли внутри — ищем по всему документу
        return document.querySelector(selector);
    }

    /**
     * Drag события
     * @private
     */
    _bindDragEvents() {
        // Touch
        this._onTouchStart = (e) => this._onDragStart(e.touches[0].clientX);
        this._onTouchMove = (e) => {
            if (!this.isDragging) return;
            this._onDragMove(e.touches[0].clientX);
        };
        this._onTouchEnd = () => this._onDragEnd();

        this.grid.addEventListener('touchstart', this._onTouchStart, { passive: true });
        this.grid.addEventListener('touchmove', this._onTouchMove, { passive: true });
        this.grid.addEventListener('touchend', this._onTouchEnd, { passive: true });

        // Mouse
        this._onMouseDown = (e) => {
            if (e.button !== 0) return;
            if (e.target.closest('button')) return;
            e.preventDefault();
            this._onDragStart(e.clientX);
        };
        this._onMouseMove = (e) => {
            if (!this.isDragging) return;
            this._onDragMove(e.clientX);
        };
        this._onMouseUp = () => {
            if (!this.isDragging) return;
            this._onDragEnd();
        };

        this.grid.addEventListener('mousedown', this._onMouseDown);
        document.addEventListener('mousemove', this._onMouseMove);
        document.addEventListener('mouseup', this._onMouseUp);

        // Отключаем drag изображений
        this._onDragStartNative = (e) => {
            if (e.target.tagName === 'IMG') e.preventDefault();
        };
        this.grid.addEventListener('dragstart', this._onDragStartNative);
    }

    _onDragStart(clientX) {
        if (this.isAnimating) return;

        this.isDragging = true;
        this.dragStartX = clientX;
        this.dragCurrentX = clientX;
        this.dragDiff = 0;

        this.grid.style.transition = 'none';
        this.grid.style.cursor = 'grabbing';

        if (this.config.autoplay) this.stopAutoplay();
    }

    _onDragMove(clientX) {
        if (!this.isDragging) return;

        this.dragCurrentX = clientX;
        this.dragDiff = this.dragCurrentX - this.dragStartX;

        if (!this.config.infinite) {
            const maxIndex = this._getMaxIndex();
            if ((this.realIndex === 0 && this.dragDiff > 0) ||
                (this.realIndex >= maxIndex && this.dragDiff < 0)) {
                this.dragDiff = this.dragDiff * 0.3;
            }
        }

        const slideWidth = this._getSlideWidth();
        const baseTranslate = -this.currentIndex * slideWidth;

        this.grid.style.transform = `translate3d(${baseTranslate + this.dragDiff}px, 0, 0)`;
    }

    _onDragEnd() {
        if (!this.isDragging) return;

        this.isDragging = false;
        this.grid.style.cursor = this.config.draggable ? 'grab' : 'default';

        if (Math.abs(this.dragDiff) > this.config.dragThreshold) {
            if (this.dragDiff < 0) {
                this.next();
            } else {
                this.prev();
            }
        } else {
            this._updatePosition(true);
        }

        this.dragDiff = 0;

        if (this.config.autoplay) this.startAutoplay();
    }

    _getSlideWidth() {
        if (this.slides.length === 0) return 0;
        return this.slides[0].offsetWidth + this.config.gap;
    }

    _updatePosition(animate = true) {
        if (this.slides.length === 0) return;

        const slideWidth = this._getSlideWidth();

        if (animate) {
            this.grid.style.transition = `transform ${this.config.transitionDuration}ms cubic-bezier(0.25, 0.46, 0.45, 0.94)`;
        } else {
            this.grid.style.transition = 'none';
        }

        const translate = -this.currentIndex * slideWidth;
        this.grid.style.transform = `translate3d(${translate}px, 0, 0)`;
    }

    _handleTransitionEnd() {
        this.isAnimating = false;

        if (!this.config.infinite) return;

        if (this.currentIndex === 0) {
            this.grid.style.transition = 'none';
            this.currentIndex = this.totalSlides;
            const slideWidth = this._getSlideWidth();
            this.grid.style.transform = `translate3d(${-this.currentIndex * slideWidth}px, 0, 0)`;
            void this.grid.offsetHeight;
        }

        if (this.currentIndex === this.totalSlides + 1) {
            this.grid.style.transition = 'none';
            this.currentIndex = 1;
            const slideWidth = this._getSlideWidth();
            this.grid.style.transform = `translate3d(${-this.currentIndex * slideWidth}px, 0, 0)`;
            void this.grid.offsetHeight;
        }
    }

    next() {
        if (this.isAnimating) return;

        if (this.config.infinite) {
            this.isAnimating = true;
            this.currentIndex++;
            this.realIndex = (this.realIndex + 1) % this.totalSlides;
            this._updatePosition(true);
        } else {
            const maxIndex = this._getMaxIndex();
            if (this.realIndex >= maxIndex) return;

            this.isAnimating = true;
            this.currentIndex++;
            this.realIndex++;
            this._updatePosition(true);
            this._updateButtons();
        }

        if (this.config.autoplay) this.resetAutoplay();
    }

    prev() {
        if (this.isAnimating) return;

        if (this.config.infinite) {
            this.isAnimating = true;
            this.currentIndex--;
            this.realIndex = (this.realIndex - 1 + this.totalSlides) % this.totalSlides;
            this._updatePosition(true);
        } else {
            if (this.realIndex <= 0) return;

            this.isAnimating = true;
            this.currentIndex--;
            this.realIndex--;
            this._updatePosition(true);
            this._updateButtons();
        }

        if (this.config.autoplay) this.resetAutoplay();
    }

    goTo(index, animate = true) {
        if (this.isAnimating) return;

        let newReal = index;

        if (this.config.infinite) {
            if (newReal < 0) newReal = this.totalSlides - 1;
            if (newReal >= this.totalSlides) newReal = 0;
        } else {
            const maxIndex = this._getMaxIndex();
            if (newReal < 0) newReal = 0;
            if (newReal > maxIndex) newReal = maxIndex;
        }

        if (newReal === this.realIndex && animate) return;

        this.isAnimating = true;
        this.currentIndex = this.config.infinite ? newReal + 1 : newReal;
        this.realIndex = newReal;

        this._updatePosition(animate);
        this._updateButtons();
    }

    _updateButtons() {
        if (this.config.infinite) {
            if (this.prevBtn) {
                this.prevBtn.disabled = false;
                this.prevBtn.style.opacity = '1';
                this.prevBtn.style.cursor = 'pointer';
            }
            if (this.nextBtn) {
                this.nextBtn.disabled = false;
                this.nextBtn.style.opacity = '1';
                this.nextBtn.style.cursor = 'pointer';
            }
            return;
        }

        const maxIndex = this._getMaxIndex();

        if (this.prevBtn) {
            const disabled = this.realIndex === 0;
            this.prevBtn.disabled = disabled;
            this.prevBtn.style.opacity = disabled ? '0.4' : '1';
            this.prevBtn.style.cursor = disabled ? 'not-allowed' : 'pointer';
        }

        if (this.nextBtn) {
            const disabled = this.realIndex >= maxIndex;
            this.nextBtn.disabled = disabled;
            this.nextBtn.style.opacity = disabled ? '0.4' : '1';
            this.nextBtn.style.cursor = disabled ? 'not-allowed' : 'pointer';
        }
    }

    startAutoplay() {
        if (!this.config.autoplay) return;
        this.stopAutoplay();
        this.autoplayTimer = setInterval(() => this.next(), this.config.autoplayDelay);
    }

    stopAutoplay() {
        if (this.autoplayTimer) {
            clearInterval(this.autoplayTimer);
            this.autoplayTimer = null;
        }
    }

    resetAutoplay() {
        this.stopAutoplay();
        this.startAutoplay();
    }

    _debounce(fn, delay) {
        let timer;
        return (...args) => {
            clearTimeout(timer);
            timer = setTimeout(() => fn.apply(this, args), delay);
        };
    }

    getState() {
        return {
            isInitialized: this.isInitialized,
            totalSlides: this.totalSlides,
            currentIndex: this.realIndex,
            maxIndex: this._getMaxIndex(),
            slidesPerView: this._getSlidesPerView(),
            isAnimating: this.isAnimating,
            infinite: this.config.infinite,
            disabled: this.config.disabled,
        };
    }

    destroy() {
        if (!this.isInitialized) return;

        this._isDestroyed = true;
        this.stopAutoplay();

        window.removeEventListener('resize', this._onResize);

        if (this.prevBtn && this._onPrevClick) {
            this.prevBtn.removeEventListener('click', this._onPrevClick);
        }
        if (this.nextBtn && this._onNextClick) {
            this.nextBtn.removeEventListener('click', this._onNextClick);
        }

        if (this._onTransitionEnd) {
            this.grid.removeEventListener('transitionend', this._onTransitionEnd);
        }

        if (this._onMouseMove) {
            document.removeEventListener('mousemove', this._onMouseMove);
        }
        if (this._onMouseUp) {
            document.removeEventListener('mouseup', this._onMouseUp);
        }

        if (this._onDragStartNative) {
            this.grid.removeEventListener('dragstart', this._onDragStartNative);
        }

        if (this.originalSlidesHTML) {
            this.grid.innerHTML = this.originalSlidesHTML.join('');
            this.grid.style.cssText = '';
        }

        this.isInitialized = false;
        console.log('🔄 BookSlider destroyed');
    }
}