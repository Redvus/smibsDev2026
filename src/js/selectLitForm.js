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

    // ============================================
    // ПРОКРУТКА К ФОРМЕ
    // ============================================

    const formElement = document.getElementById("formPayment");
    const formBtn = document.getElementById("formBtn");
    const formOffset = 100;

    if (!formElement) return;

    // Функция плавной прокрутки к форме
    function scrollToForm(offset = formOffset) {
        const elementPosition = formElement.getBoundingClientRect().top;
        const offsetPosition = elementPosition + window.pageYOffset - offset;

        window.scrollTo({
            top: offsetPosition,
            behavior: "smooth",
        });

        // Подсвечиваем форму
        // formElement.classList.add("form-payment--highlight");
        // setTimeout(function () {
        //     formElement.classList.remove("form-payment--highlight");
        // }, 2000);
    }

    // ============================================
    // 1. ПРОКРУТКА ПО КЛИКУ НА formBtn
    // ============================================
    if (formBtn) {
        formBtn.addEventListener("click", function (e) {
            e.preventDefault(); // Если это ссылка

            // Проверяем, видна ли форма
            const rect = formElement.getBoundingClientRect();
            const isVisible =
                rect.top >= 0 &&
                rect.bottom <=
                    (window.innerHeight ||
                        document.documentElement.clientHeight);

            // Если форма уже видна - просто подсвечиваем
            if (isVisible) {
                formElement.classList.add("form-payment--highlight");
                setTimeout(function () {
                    formElement.classList.remove("form-payment--highlight");
                }, 2000);
                return;
            }

            // Иначе скроллим к форме
            scrollToForm(formOffset);

            // Фокусируем первое поле ввода после прокрутки
            setTimeout(function () {
                const firstInput = formElement.querySelector(
                    'input:not([type="hidden"]), textarea, select',
                );
                if (firstInput) {
                    firstInput.focus();
                }
            }, 600);
        });
    }

    // ============================================
    // 2. ПРОКРУТКА ПОСЛЕ УСПЕШНОЙ ОТПРАВКИ
    // ============================================
    // document.addEventListener("formit:success", function () {
    //     setTimeout(function () {
    //         scrollToForm(80);
    //     }, 300);
    // });

    // ============================================
    // 3. ПРОКРУТКА К ПЕРВОЙ ОШИБКЕ
    // ============================================
    document.addEventListener("formit:error", function () {
        setTimeout(function () {
            // Ищем первое поле с ошибкой
            const errorSpans = document.querySelectorAll("[data-formit-error]");
            let firstErrorField = null;

            for (const span of errorSpans) {
                if (span.textContent.trim()) {
                    const field = span.closest(".field");
                    if (field) {
                        firstErrorField = field;
                        break;
                    }
                }
            }

            if (firstErrorField) {
                // Скроллим к полю с ошибкой
                const headerOffset = formOffset;
                const elementPosition =
                    firstErrorField.getBoundingClientRect().top;
                const offsetPosition =
                    elementPosition + window.pageYOffset - headerOffset;

                window.scrollTo({
                    top: offsetPosition,
                    behavior: "smooth",
                });

                // Подсвечиваем и фокусируем поле
                const input = firstErrorField.querySelector(
                    "input, textarea, select",
                );
                if (input) {
                    setTimeout(function () {
                        input.focus();
                        input.classList.add("highlight-error");
                        setTimeout(function () {
                            input.classList.remove("highlight-error");
                        }, 2000);
                    }, 400);
                }
            } else {
                // Если нет конкретного поля - скроллим к форме
                scrollToForm(formOffset);
            }
        }, 400);
    });

    // ============================================
    // 4. ПРОКРУТКА ПО ЯКОРЮ #formPayment
    // ============================================
    // document
    //     .querySelectorAll('a[href="#formPayment"]')
    //     .forEach(function (link) {
    //         link.addEventListener("click", function (e) {
    //             e.preventDefault();
    //             scrollToForm(80);
    //         });
    //     });

    // ============================================
    // ОБНОВЛЕНИЕ АНАЛИТИКИ (опционально)
    // ============================================
    document.addEventListener("DOMContentLoaded", function () {
        const formBtn = document.getElementById("formBtn");

        if (formBtn) {
            formBtn.addEventListener("click", function () {
                // Отправляем событие в аналитику
                if (typeof gtag !== "undefined") {
                    gtag("event", "form_button_click", {
                        event_category: "Form",
                        event_label: 'Клик по кнопке "Оставить заявку"',
                    });
                }

                if (typeof ym !== "undefined") {
                    ym(12345678, "reachGoal", "FORM_BTN_CLICK");
                }

                console.log("📊 Аналитика: Клик по кнопке formBtn");
            });
        }
    });
});
