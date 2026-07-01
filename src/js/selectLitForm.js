document.addEventListener("DOMContentLoaded", function () {
    // ============================================
    // ДИНАМИЧЕСКИЙ РАСЧЕТ ЦЕНЫ (без базовой стоимости)
    // ============================================

    const slider = document.querySelector(".slider__input");
    const sliderDisplay = document.querySelector(".slider__current");
    const progress = document.querySelector(".slider__input-progress");
    const priceElement = document.getElementById("priceValue");
    const tooltipRefs = document.getElementById("tooltipRefs");
    const tooltipTotal = document.getElementById("tooltipTotal");
    const tooltipWorkType = document.getElementById("tooltipWorkType");
    const tooltipPricePerSource = document.getElementById(
        "tooltipPricePerSource",
    );

    // Таблица цен
    const prices = {
        referat: 30,
        kursovaya: 80,
        paper: 100,
        diplom: 150,
    };

    const workLabels = {
        referat: "Урок (семинар)",
        kursovaya: "Курсовая",
        paper: "Краеведение",
        diplom: "Юбилейная дата",
    };

    // Функция расчета цены (НОВАЯ)
    function calculatePrice(workType, refs) {
        const pricePerSource = prices[workType] || 30;
        // БЕЗ БАЗОВОЙ СТОИМОСТИ: цена = цена_за_источник * количество
        const total = pricePerSource * refs;

        return {
            pricePerSource: pricePerSource,
            total: total,
            label: workLabels[workType] || workType,
        };
    }

    // Функция обновления цены
    function updatePrice() {
        // Получаем выбранный тип работы
        const selectedRadio = document.querySelector(
            'input[name="work_type"]:checked',
        );
        const workType = selectedRadio ? selectedRadio.value : "referat";

        // Получаем количество источников
        const refs = parseInt(slider ? slider.value : 1);

        // Рассчитываем цену
        const result = calculatePrice(workType, refs);

        // Обновляем цену на странице
        if (priceElement) {
            priceElement.textContent = result.total + " ₽";
        }

        // Обновляем тултип
        if (tooltipRefs) tooltipRefs.textContent = refs;
        if (tooltipWorkType) tooltipWorkType.textContent = result.label;
        if (tooltipPricePerSource)
            tooltipPricePerSource.textContent = result.pricePerSource + " ₽";
        if (tooltipTotal) tooltipTotal.textContent = result.total + " ₽";

        return result;
    }

    // Событие изменения слайдера
    if (slider) {
        slider.addEventListener("input", function () {
            const value = parseInt(this.value);
            if (sliderDisplay) sliderDisplay.value = value;

            // Обновляем прогресс-бар
            if (progress) {
                const min = parseInt(this.min) || 1;
                const max = parseInt(this.max) || 50;
                const percent = ((value - min) / (max - min)) * 100;
                progress.style.width = percent + "%";
            }

            // Обновляем цену
            updatePrice();
        });
    }

    // Событие изменения типа работы
    const workRadios = document.querySelectorAll(".work-type-radio");
    workRadios.forEach(function (radio) {
        radio.addEventListener("change", function () {
            if (this.checked) {
                updatePrice();
            }
        });
    });

    // Обновляем цену при инициализации
    updatePrice();

    // ============================================
    // СИНХРОНИЗАЦИЯ СЛАЙДЕРА С ПОЛЕМ ВВОДА
    // ============================================
    if (slider && sliderDisplay) {
        const min = parseInt(slider.min) || 1;
        const max = parseInt(slider.max) || 50;
        const step = parseInt(slider.step) || 1;

        const updateAll = function (value) {
            let val = parseInt(value);
            if (isNaN(val) || val === "") val = min;
            if (val < min) val = min;
            if (val > max) val = max;

            // Округляем до шага
            val = Math.round(val / step) * step;

            slider.value = val;
            sliderDisplay.value = val;

            if (progress) {
                const percent = ((val - min) / (max - min)) * 100;
                progress.style.width = percent + "%";
            }

            updatePrice();
        };

        // Событие слайдера
        slider.addEventListener("input", function () {
            updateAll(this.value);
        });

        // Событие ввода с клавиатуры
        sliderDisplay.addEventListener("input", function () {
            const val = this.value;
            if (val === "" || val === "-" || val === ".") {
                return;
            }

            const num = parseInt(val);
            if (!isNaN(num)) {
                if (progress) {
                    const clampedVal = Math.min(Math.max(num, min), max);
                    const percent = ((clampedVal - min) / (max - min)) * 100;
                    progress.style.width = percent + "%";
                }
            }
        });

        // При потере фокуса
        sliderDisplay.addEventListener("blur", function () {
            const val = this.value.trim();
            if (val === "" || val === "-") {
                updateAll(min);
                return;
            }

            const num = parseInt(val);
            if (isNaN(num)) {
                updateAll(slider.value);
                return;
            }

            updateAll(num);
        });

        // При нажатии Enter
        sliderDisplay.addEventListener("keydown", function (e) {
            if (e.key === "Enter") {
                this.blur();
                e.preventDefault();
            }

            const allowed = [
                "Backspace",
                "Delete",
                "Tab",
                "Escape",
                "Enter",
                "ArrowLeft",
                "ArrowRight",
                "ArrowUp",
                "ArrowDown",
                "Home",
                "End",
            ];

            if (allowed.includes(e.key)) return;
            if (e.ctrlKey || e.metaKey) {
                if (["a", "c", "v", "x"].includes(e.key.toLowerCase())) return;
            }

            if (!/^\d$/.test(e.key)) {
                e.preventDefault();
            }
        });
    }
});
