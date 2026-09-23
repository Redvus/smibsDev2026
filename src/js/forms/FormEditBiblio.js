// assets/js/payment-form.js
// ============================================
// УНИВЕРСАЛЬНЫЙ СКРИПТ ДЛЯ ЛЮБЫХ ФОРМ
// ============================================

document.addEventListener("DOMContentLoaded", function () {
    // ============================================
    // 1. ПЕРЕКЛЮЧЕНИЕ ФОРМ
    // ============================================

    const formsContainer = document.getElementById("formsContainer");
    const formWrappers = document.querySelectorAll(".form-wrapper");
    const formBtns = document.querySelectorAll(".teaser__button");
    const formOffset = 100;

    const formMap = {
        formBtn_1: "form_1",
        formBtn_2: "form_2",
        formBtn_3: "form_3",
        formBtn_4: "form_4",
    };

    function showForm(formId, buttonId) {
        formWrappers.forEach(function (wrapper) {
            wrapper.style.display = "none";
            wrapper.classList.remove("active");
        });

        const targetForm = document.getElementById(formId);
        if (targetForm) {
            targetForm.style.display = "block";
            setTimeout(function () {
                targetForm.classList.add("active");
            }, 50);

            // Инициализируем форму, если она еще не инициализирована
            const formElement = targetForm.querySelector("form");
            if (formElement && !formElement.dataset.initialized) {
                initForm(formElement);
                formElement.dataset.initialized = "true";
            }
        }

        formBtns.forEach(function (btn) {
            btn.classList.remove("active");
        });
        const activeBtn = document.getElementById(buttonId);
        if (activeBtn) {
            activeBtn.classList.add("active");
        }

        if (formsContainer) {
            setTimeout(function () {
                const headerOffset = formOffset;
                const elementPosition =
                    formsContainer.getBoundingClientRect().top;
                const offsetPosition =
                    elementPosition + window.pageYOffset - headerOffset;

                window.scrollTo({
                    top: offsetPosition,
                    behavior: "smooth",
                });
            }, 200);
        }
    }

    Object.keys(formMap).forEach(function (buttonId) {
        const button = document.getElementById(buttonId);
        if (button) {
            button.addEventListener("click", function (e) {
                e.preventDefault();
                const formId = formMap[buttonId];
                showForm(formId, buttonId);
            });
        }
    });

    // ============================================
    // 2. УНИВЕРСАЛЬНАЯ ФУНКЦИЯ ИНИЦИАЛИЗАЦИИ ФОРМЫ
    // ============================================

    function initForm(formElement) {
        if (!formElement) return null;
        if (formElement.dataset.initialized === "true") return null;

        console.log(`✅ Инициализация формы: ${formElement.id || "без ID"}`);

        // --- ПОИСК ЭЛЕМЕНТОВ ВНУТРИ ФОРМЫ ---
        const slider = formElement.querySelector(".slider__input");
        const sliderDisplay = formElement.querySelector(".slider__current");
        const progress = formElement.querySelector(".slider__input-progress");
        const priceElement = formElement.querySelector("#priceValue");
        const tooltipRefs = formElement.querySelector("#tooltipRefs");
        const tooltipTotal = formElement.querySelector("#tooltipTotal");
        const tooltipWorkType = formElement.querySelector("#tooltipWorkType");
        const tooltipPricePerSource = formElement.querySelector(
            "#tooltipPricePerSource",
        );
        const workRadios = formElement.querySelectorAll(".work-type-radio");

        // --- ОПРЕДЕЛЯЕМ ТИП ФОРМЫ ---
        const hasSlider = slider !== null;
        const hasRadios = workRadios.length > 0;
        const hasPrice = priceElement !== null;

        console.log(
            `   📊 Тип формы: слайдер=${hasSlider}, радиокнопки=${hasRadios}, цена=${hasPrice}`,
        );

        // --- ЕСЛИ ЕСТЬ РАДИОКНОПКИ И ЦЕНА (но нет слайдера) ---
        if (hasRadios && hasPrice && !hasSlider) {
            console.log("   📌 Форма с радиокнопками (без слайдера)");

            // --- Таблица цен ---
            const prices = {};
            const workLabels = {};

            // Собираем цены из data-атрибутов радиокнопок
            workRadios.forEach(function (radio) {
                const value = radio.value;
                const price = parseInt(radio.getAttribute("data-price")) || 0;
                const label =
                    radio.closest(".variant")?.querySelector(".variant__name")
                        ?.textContent || value;

                prices[value] = price;
                workLabels[value] = label;
            });

            // --- Функция обновления цены ---
            function updatePrice() {
                const selectedRadio = formElement.querySelector(
                    'input[name="work_type"]:checked',
                );
                const workType = selectedRadio
                    ? selectedRadio.value
                    : Object.keys(prices)[0] || "default";
                const price = prices[workType] || 0;

                if (priceElement) {
                    priceElement.textContent = price + " ₽";
                }

                // Обновляем тултип
                if (tooltipWorkType)
                    tooltipWorkType.textContent =
                        workLabels[workType] || workType;
                if (tooltipTotal) tooltipTotal.textContent = price + " ₽";
                if (tooltipPricePerSource) {
                    tooltipPricePerSource.textContent = price + " ₽";
                }
            }

            // --- События радиокнопок ---
            workRadios.forEach(function (radio) {
                radio.addEventListener("change", function () {
                    if (this.checked) {
                        updatePrice();
                    }
                });
            });

            // --- Инициализация ---
            updatePrice();

            formElement.dataset.initialized = "true";
            console.log(
                `✅ Форма ${formElement.id || "без ID"} инициализирована (только радиокнопки)`,
            );

            return {
                form: formElement,
                updatePrice: updatePrice,
                type: "radios_only",
            };
        }

        // --- ЕСЛИ ЕСТЬ СЛАЙДЕР И ЦЕНА (без радиокнопок) ---
        if (hasSlider && hasPrice && !hasRadios) {
            console.log("   📌 Форма со слайдером (без радиокнопок)");

            // --- Функция обновления цены ---
            function updatePrice() {
                const refs = parseInt(slider ? slider.value : 1);
                const pricePerSource =
                    parseInt(slider.getAttribute("data-price")) || 30;
                const total = pricePerSource * refs;

                if (priceElement) {
                    priceElement.textContent = total + " ₽";
                }

                if (tooltipRefs) tooltipRefs.textContent = refs;
                if (tooltipTotal) tooltipTotal.textContent = total + " ₽";
                if (tooltipPricePerSource) {
                    tooltipPricePerSource.textContent = pricePerSource + " ₽";
                }
            }

            // --- События слайдера ---
            slider.addEventListener("input", function () {
                const value = parseInt(this.value);
                if (sliderDisplay) sliderDisplay.value = value;

                if (progress) {
                    const min = parseInt(this.min) || 1;
                    const max = parseInt(this.max) || 50;
                    const percent = ((value - min) / (max - min)) * 100;
                    progress.style.width = percent + "%";
                }

                updatePrice();
            });

            // --- Синхронизация слайдера ---
            if (slider && sliderDisplay) {
                const min = parseInt(slider.min) || 1;
                const max = parseInt(slider.max) || 50;
                const step = parseInt(slider.step) || 1;

                const updateAll = function (value) {
                    let val = parseInt(value);
                    if (isNaN(val) || val === "") val = min;
                    if (val < min) val = min;
                    if (val > max) val = max;
                    val = Math.round(val / step) * step;

                    slider.value = val;
                    sliderDisplay.value = val;

                    if (progress) {
                        const percent = ((val - min) / (max - min)) * 100;
                        progress.style.width = percent + "%";
                    }

                    updatePrice();
                };

                slider.addEventListener("input", function () {
                    updateAll(this.value);
                });

                sliderDisplay.addEventListener("input", function () {
                    const val = this.value;
                    if (val === "" || val === "-" || val === ".") return;

                    const num = parseInt(val);
                    if (!isNaN(num) && progress) {
                        const clampedVal = Math.min(Math.max(num, min), max);
                        const percent =
                            ((clampedVal - min) / (max - min)) * 100;
                        progress.style.width = percent + "%";
                    }
                });

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
                        if (["a", "c", "v", "x"].includes(e.key.toLowerCase()))
                            return;
                    }
                    if (!/^\d$/.test(e.key)) {
                        e.preventDefault();
                    }
                });
            }

            // --- Инициализация ---
            const initialValue = parseInt(slider.value) || 1;
            if (sliderDisplay) sliderDisplay.value = initialValue;
            if (progress) {
                const min = parseInt(slider.min) || 1;
                const max = parseInt(slider.max) || 50;
                const percent = ((initialValue - min) / (max - min)) * 100;
                progress.style.width = percent + "%";
            }
            updatePrice();

            formElement.dataset.initialized = "true";
            console.log(
                `✅ Форма ${formElement.id || "без ID"} инициализирована (только слайдер)`,
            );

            return {
                form: formElement,
                updatePrice: updatePrice,
                type: "slider_only",
            };
        }

        // --- ЕСЛИ ЕСТЬ СЛАЙДЕР + РАДИОКНОПКИ + ЦЕНА (полная версия) ---
        if (hasSlider && hasRadios && hasPrice) {
            console.log("   📌 Полная форма (слайдер + радиокнопки)");

            // --- Таблица цен ---
            const prices = {};
            const workLabels = {};

            workRadios.forEach(function (radio) {
                const value = radio.value;
                const price = parseInt(radio.getAttribute("data-price")) || 30;
                const label =
                    radio.closest(".variant")?.querySelector(".variant__name")
                        ?.textContent || value;

                prices[value] = price;
                workLabels[value] = label;
            });

            // --- Функция расчета цены ---
            function calculatePrice(workType, refs) {
                const pricePerSource = prices[workType] || 30;
                const total = pricePerSource * refs;

                return {
                    pricePerSource: pricePerSource,
                    total: total,
                    label: workLabels[workType] || workType,
                };
            }

            // --- Функция обновления цены ---
            function updatePrice() {
                const selectedRadio = formElement.querySelector(
                    'input[name="work_type"]:checked',
                );
                const workType = selectedRadio
                    ? selectedRadio.value
                    : Object.keys(prices)[0] || "referat";
                const refs = parseInt(slider ? slider.value : 1);
                const result = calculatePrice(workType, refs);

                if (priceElement) {
                    priceElement.textContent = result.total + " ₽";
                }

                if (tooltipRefs) tooltipRefs.textContent = refs;
                if (tooltipWorkType) tooltipWorkType.textContent = result.label;
                if (tooltipPricePerSource) {
                    tooltipPricePerSource.textContent =
                        result.pricePerSource + " ₽";
                }
                if (tooltipTotal)
                    tooltipTotal.textContent = result.total + " ₽";

                return result;
            }

            // --- События ---
            slider.addEventListener("input", function () {
                const value = parseInt(this.value);
                if (sliderDisplay) sliderDisplay.value = value;

                if (progress) {
                    const min = parseInt(this.min) || 1;
                    const max = parseInt(this.max) || 50;
                    const percent = ((value - min) / (max - min)) * 100;
                    progress.style.width = percent + "%";
                }

                updatePrice();
            });

            workRadios.forEach(function (radio) {
                radio.addEventListener("change", function () {
                    if (this.checked) {
                        updatePrice();
                    }
                });
            });

            // --- Синхронизация слайдера ---
            if (slider && sliderDisplay) {
                const min = parseInt(slider.min) || 1;
                const max = parseInt(slider.max) || 50;
                const step = parseInt(slider.step) || 1;

                const updateAll = function (value) {
                    let val = parseInt(value);
                    if (isNaN(val) || val === "") val = min;
                    if (val < min) val = min;
                    if (val > max) val = max;
                    val = Math.round(val / step) * step;

                    slider.value = val;
                    sliderDisplay.value = val;

                    if (progress) {
                        const percent = ((val - min) / (max - min)) * 100;
                        progress.style.width = percent + "%";
                    }

                    updatePrice();
                };

                slider.addEventListener("input", function () {
                    updateAll(this.value);
                });

                sliderDisplay.addEventListener("input", function () {
                    const val = this.value;
                    if (val === "" || val === "-" || val === ".") return;

                    const num = parseInt(val);
                    if (!isNaN(num) && progress) {
                        const clampedVal = Math.min(Math.max(num, min), max);
                        const percent =
                            ((clampedVal - min) / (max - min)) * 100;
                        progress.style.width = percent + "%";
                    }
                });

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
                        if (["a", "c", "v", "x"].includes(e.key.toLowerCase()))
                            return;
                    }
                    if (!/^\d$/.test(e.key)) {
                        e.preventDefault();
                    }
                });
            }

            // --- Инициализация ---
            const initialValue = parseInt(slider.value) || 1;
            if (sliderDisplay) sliderDisplay.value = initialValue;
            if (progress) {
                const min = parseInt(slider.min) || 1;
                const max = parseInt(slider.max) || 50;
                const percent = ((initialValue - min) / (max - min)) * 100;
                progress.style.width = percent + "%";
            }
            updatePrice();

            formElement.dataset.initialized = "true";
            console.log(
                `✅ Форма ${formElement.id || "без ID"} инициализирована (полная версия)`,
            );

            return {
                form: formElement,
                updatePrice: updatePrice,
                type: "full",
            };
        }

        // --- ЕСЛИ НЕТ НИ СЛАЙДЕРА, НИ РАДИОКНОПОК ---
        console.log(`   📌 Простая форма (без расчета цены)`);
        formElement.dataset.initialized = "true";

        return {
            form: formElement,
            type: "simple",
        };
    }

    // ============================================
    // 3. ИНИЦИАЛИЗАЦИЯ ВСЕХ ФОРМ
    // ============================================

    const allForms = document.querySelectorAll(".form-wrapper form");
    const initializedForms = [];

    allForms.forEach(function (form) {
        const result = initForm(form);
        if (result) {
            initializedForms.push(result);
        }
    });

    console.log(`✅ Инициализировано форм: ${initializedForms.length}`);

    // ============================================
    // 4. ОБРАБОТКА СОБЫТИЙ FORMIT (универсальная)
    // ============================================

    document.addEventListener("formit:error", function (e) {
        const activeForm = document.querySelector(".form-wrapper.active form");
        if (!activeForm) return;

        const errorSpans = activeForm.querySelectorAll("[data-formit-error]");
        errorSpans.forEach(function (span) {
            if (span.textContent.trim()) {
                const field = span.closest(".field");
                if (field) {
                    const input = field.querySelector(
                        "input, textarea, select",
                    );
                    if (input) {
                        input.classList.add("is-invalid");
                    }
                    field.classList.add("has-error");
                }
            }
        });

        setTimeout(function () {
            const firstError = activeForm.querySelector("[data-formit-error]");
            if (firstError && firstError.textContent.trim()) {
                const field = firstError.closest(".field");
                if (field) {
                    const headerOffset = formOffset;
                    const elementPosition = field.getBoundingClientRect().top;
                    const offsetPosition =
                        elementPosition + window.pageYOffset - headerOffset;

                    window.scrollTo({
                        top: offsetPosition,
                        behavior: "smooth",
                    });

                    const input = field.querySelector(
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
                }
            }
        }, 400);

        const submitBtn = activeForm.querySelector('button[type="submit"]');
        if (submitBtn) {
            submitBtn.disabled = false;
            submitBtn.innerHTML = "Отправить заявку";
        }
    });

    document.addEventListener("formit:success", function (e) {
        const activeForm = document.querySelector(".form-wrapper.active form");
        if (activeForm) {
            const submitBtn = activeForm.querySelector('button[type="submit"]');
            if (submitBtn) {
                submitBtn.disabled = false;
                submitBtn.innerHTML = "Отправить заявку";
            }
        }

        if (formsContainer) {
            setTimeout(function () {
                const headerOffset = 80;
                const elementPosition =
                    formsContainer.getBoundingClientRect().top;
                const offsetPosition =
                    elementPosition + window.pageYOffset - headerOffset;

                window.scrollTo({
                    top: offsetPosition,
                    behavior: "smooth",
                });
            }, 300);
        }
    });

    document.addEventListener("formit:beforeSubmit", function (e) {
        const activeForm = document.querySelector(".form-wrapper.active form");
        if (activeForm) {
            const submitBtn = activeForm.querySelector('button[type="submit"]');
            if (submitBtn) {
                submitBtn.disabled = true;
                submitBtn.innerHTML = "Отправка...";
            }
        }
    });
});
