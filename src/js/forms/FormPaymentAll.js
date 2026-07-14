// assets/js/payment-form.js

document.addEventListener("DOMContentLoaded", function () {
    // ============================================
    // 1. ПЕРЕКЛЮЧЕНИЕ ФОРМ
    // ============================================

    const formsContainer = document.getElementById("formsContainer");
    const formWrappers = document.querySelectorAll(".form-wrapper");
    const formBtns = document.querySelectorAll(".teaser__button");
    const formOffset = 100;
    const sliderMax = 20;
    const dataPriceSlider = 50;

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

        const hasSlider = slider !== null;
        const hasRadios = workRadios.length > 0;
        const hasPrice = priceElement !== null;

        console.log(
            `   📊 Тип формы: слайдер=${hasSlider}, радиокнопки=${hasRadios}, цена=${hasPrice}`,
        );

        // --- ЕСЛИ ЕСТЬ РАДИОКНОПКИ И ЦЕНА (но нет слайдера) ---
        if (hasRadios && hasPrice && !hasSlider) {
            console.log("   📌 Форма с радиокнопками (без слайдера)");

            const prices = {};
            const workLabels = {};

            workRadios.forEach(function (radio) {
                const value = radio.value;
                const priceAttr = radio.getAttribute("data-price");
                let price;
                if (
                    priceAttr === "custom" ||
                    priceAttr === "null" ||
                    priceAttr === ""
                ) {
                    price = null;
                } else {
                    price = parseInt(priceAttr) || 0;
                }
                const label =
                    radio.closest(".variant")?.querySelector(".variant__name")
                        ?.textContent || value;

                prices[value] = price;
                workLabels[value] = label;
                console.log(`   📌 ${value}: цена=${price}, метка=${label}`);
            });

            function updatePrice() {
                const selectedRadio = formElement.querySelector(
                    'input[name="work_type"]:checked',
                );
                const workType = selectedRadio
                    ? selectedRadio.value
                    : Object.keys(prices)[0] || "default";
                const price = prices[workType];
                const isCustom = price === null || price === undefined;

                if (priceElement) {
                    if (isCustom) {
                        priceElement.textContent = "Договорная";
                        priceElement.classList.add("price--custom");
                        // priceElement.style.color = "#3B82F6";
                        // priceElement.style.fontSize = "18px";
                        // priceElement.style.fontWeight = "600";
                    } else {
                        priceElement.textContent = price + " ₽";
                        priceElement.classList.remove("price--custom");
                        priceElement.style.color = "";
                        priceElement.style.fontSize = "";
                        priceElement.style.fontWeight = "";
                    }
                }

                if (tooltipWorkType)
                    tooltipWorkType.textContent =
                        workLabels[workType] || workType;
                if (tooltipTotal)
                    tooltipTotal.textContent = isCustom
                        ? "Договорная"
                        : price + " ₽";
                if (tooltipPricePerSource) {
                    tooltipPricePerSource.textContent = isCustom
                        ? "Договорная"
                        : price + " ₽";
                }

                const priceNote = formElement.querySelector(".price-note");
                if (priceNote) {
                    priceNote.style.display = isCustom ? "block" : "none";
                }
            }

            workRadios.forEach(function (radio) {
                radio.addEventListener("change", function () {
                    if (this.checked) {
                        updatePrice();
                    }
                });
            });

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

        // --- ЕСЛИ ЕСТЬ СЛАЙДЕР + РАДИОКНОПКИ + ЦЕНА (полная версия) ---
        if (hasSlider && hasRadios && hasPrice) {
            console.log("   📌 Полная форма (слайдер + радиокнопки)");

            const prices = {};
            const workLabels = {};

            workRadios.forEach(function (radio) {
                const value = radio.value;
                const priceAttr = radio.getAttribute("data-price");
                let price;
                if (
                    priceAttr === "custom" ||
                    priceAttr === "null" ||
                    priceAttr === ""
                ) {
                    price = null;
                } else {
                    price = parseInt(priceAttr) || 30;
                }
                const label =
                    radio.closest(".variant")?.querySelector(".variant__name")
                        ?.textContent || value;

                prices[value] = price;
                workLabels[value] = label;
                console.log(`   📌 ${value}: цена=${price}, метка=${label}`);
            });

            function calculatePrice(workType, refs) {
                const pricePerSource = prices[workType];
                if (pricePerSource === null || pricePerSource === undefined) {
                    return {
                        pricePerSource: null,
                        total: null,
                        label: workLabels[workType] || workType,
                        isCustom: true,
                    };
                }
                const total = pricePerSource * (refs || 1);
                return {
                    pricePerSource: pricePerSource,
                    total: total,
                    label: workLabels[workType] || workType,
                    isCustom: false,
                };
            }

            function updatePrice() {
                const selectedRadio = formElement.querySelector(
                    'input[name="work_type"]:checked',
                );
                const workType = selectedRadio
                    ? selectedRadio.value
                    : Object.keys(prices)[0] || "referat";
                const refs = parseInt(slider ? slider.value : 1);
                const result = calculatePrice(workType, refs);

                console.log(
                    `   📊 Обновление цены: ${workType}, refs=${refs}, isCustom=${result.isCustom}`,
                );

                if (priceElement) {
                    if (result.isCustom) {
                        priceElement.textContent = "Договорная";
                        priceElement.classList.add("price--custom");
                        priceElement.style.color = "#3B82F6";
                        priceElement.style.fontSize = "18px";
                        priceElement.style.fontWeight = "600";
                    } else {
                        priceElement.textContent = result.total + " ₽";
                        priceElement.classList.remove("price--custom");
                        priceElement.style.color = "";
                        priceElement.style.fontSize = "";
                        priceElement.style.fontWeight = "";
                    }
                }

                if (tooltipRefs)
                    tooltipRefs.textContent = result.isCustom ? "—" : refs;
                if (tooltipWorkType) tooltipWorkType.textContent = result.label;
                if (tooltipPricePerSource) {
                    tooltipPricePerSource.textContent = result.isCustom
                        ? "Договорная"
                        : result.pricePerSource + " ₽";
                }
                if (tooltipTotal)
                    tooltipTotal.textContent = result.isCustom
                        ? "Договорная"
                        : result.total + " ₽";

                const priceNote = formElement.querySelector(".price-note");
                if (priceNote) {
                    priceNote.style.display = result.isCustom
                        ? "block"
                        : "none";
                }

                return result;
            }

            slider.addEventListener("input", function () {
                const value = parseInt(this.value);
                if (sliderDisplay) sliderDisplay.value = value;

                if (progress) {
                    const min = parseInt(this.min) || 1;
                    const max = parseInt(this.max) || sliderMax;
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

            if (slider && sliderDisplay) {
                const min = parseInt(slider.min) || 1;
                const max = parseInt(slider.max) || sliderMax;
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

            const initialValue = parseInt(slider.value) || 1;
            if (sliderDisplay) sliderDisplay.value = initialValue;
            if (progress) {
                const min = parseInt(slider.min) || 1;
                const max = parseInt(slider.max) || sliderMax;
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

        // --- ЕСЛИ ЕСТЬ ТОЛЬКО СЛАЙДЕР (без радиокнопок) ---
        if (hasSlider && hasPrice && !hasRadios) {
            console.log("   📌 Форма со слайдером (без радиокнопок)");

            function updatePrice() {
                const refs = parseInt(slider ? slider.value : 1);
                const pricePerSource =
                    parseInt(slider.getAttribute("data-price")) ||
                    dataPriceSlider;
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

            slider.addEventListener("input", function () {
                const value = parseInt(this.value);
                if (sliderDisplay) sliderDisplay.value = value;

                if (progress) {
                    const min = parseInt(this.min) || 1;
                    const max = parseInt(this.max) || sliderMax;
                    const percent = ((value - min) / (max - min)) * 100;
                    progress.style.width = percent + "%";
                }

                updatePrice();
            });

            if (slider && sliderDisplay) {
                const min = parseInt(slider.min) || 1;
                const max = parseInt(slider.max) || sliderMax;
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

            const initialValue = parseInt(slider.value) || 1;
            if (sliderDisplay) sliderDisplay.value = initialValue;
            if (progress) {
                const min = parseInt(slider.min) || 1;
                const max = parseInt(slider.max) || sliderMax;
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
    // 4. ОБРАБОТКА СОБЫТИЙ FORMIT (исправленная)
    // ============================================

    // --- Функция поиска активной формы ---
    function getActiveForm() {
        const activeWrapper = document.querySelector(".form-wrapper.active");
        if (activeWrapper) {
            return activeWrapper.querySelector("form");
        }
        return null;
    }

    // --- Ошибка валидации ---
    document.addEventListener("formit:error", function (e) {
        // Находим активную форму
        const activeForm = getActiveForm();
        if (!activeForm) {
            console.warn("⚠️ Активная форма не найдена");
            return;
        }

        // console.log("❌ Ошибка валидации в форме:", activeForm.id || "без ID");

        // Подсветка полей с ошибками ТОЛЬКО в активной форме
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

        // --- Прокрутка к первому полю с ошибкой ТОЛЬКО в активной форме ---
        setTimeout(function () {
            // Ищем первую ошибку ТОЛЬКО в активной форме
            const errorSpansInForm = activeForm.querySelectorAll(
                "[data-formit-error]",
            );
            let firstErrorField = null;
            let firstInput = null;

            for (const span of errorSpansInForm) {
                if (span.textContent.trim()) {
                    const field = span.closest(".field");
                    if (field) {
                        firstErrorField = field;
                        firstInput = field.querySelector(
                            "input, textarea, select",
                        );
                        break;
                    }
                }
            }

            if (firstErrorField) {
                console.log("📌 Прокрутка к полю с ошибкой в активной форме");

                const headerOffset = formOffset;
                const elementPosition =
                    firstErrorField.getBoundingClientRect().top;
                const offsetPosition =
                    elementPosition + window.pageYOffset - headerOffset;

                window.scrollTo({
                    top: offsetPosition,
                    behavior: "smooth",
                });

                if (firstInput) {
                    setTimeout(function () {
                        firstInput.focus();
                        firstInput.classList.add("highlight-error");
                        setTimeout(function () {
                            firstInput.classList.remove("highlight-error");
                        }, 2000);
                    }, 400);
                }
            } else {
                // Если нет ошибок в активной форме (может быть ошибка в другой форме)
                console.log("⚠️ Нет полей с ошибками в активной форме");
            }
        }, 400);

        // Разблокируем кнопку в активной форме
        const submitBtn = activeForm.querySelector('button[type="submit"]');
        if (submitBtn) {
            submitBtn.disabled = false;
            submitBtn.innerHTML = "Отправить заявку";
        }
    });

    // --- Успешная отправка ---
    document.addEventListener("formit:success", function (e) {
        const activeForm = getActiveForm();
        if (activeForm) {
            const submitBtn = activeForm.querySelector('button[type="submit"]');
            if (submitBtn) {
                submitBtn.disabled = false;
                submitBtn.innerHTML = "Отправить заявку";
            }
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
            }, 300);
        }
    });

    // --- Перед отправкой ---
    document.addEventListener("formit:beforeSubmit", function (e) {
        const activeForm = getActiveForm();
        if (activeForm) {
            const submitBtn = activeForm.querySelector('button[type="submit"]');
            if (submitBtn) {
                submitBtn.disabled = true;
                submitBtn.innerHTML = "Отправка...";
            }
        }
    });

    // --- 1. МАСКА ТЕЛЕФОНА ---
    function phoneMask(input) {
        let phone = input.value.replace(/\D/g, "");
        if (phone.length > 0 && phone[0] === "8")
            phone = "7" + phone.substring(1);
        if (phone.length > 0 && phone[0] === "9") phone = "7" + phone;
        if (phone.length > 0 && phone[0] !== "7") phone = "7" + phone;

        let formatted = "";
        if (phone.length > 0) {
            formatted = "+7";
            if (phone.length > 1) {
                formatted += " (" + phone.substring(1, 4);
                if (phone.length > 4) {
                    formatted += ") " + phone.substring(4, 7);
                    if (phone.length > 7) {
                        formatted += "-" + phone.substring(7, 9);
                        if (phone.length > 9) {
                            formatted += "-" + phone.substring(9, 11);
                        }
                    }
                }
            }
        }
        input.value = formatted;
    }

    // Применяем ко всем полям телефона
    document.querySelectorAll('input[name="phone"]').forEach(function (input) {
        input.addEventListener("input", function () {
            phoneMask(this);
        });
        input.addEventListener("focus", function () {
            if (!this.value) this.value = "+7 ";
        });
        input.addEventListener("blur", function () {
            if (this.value.replace(/\D/g, "") === "7" || this.value === "") {
                this.value = "";
            }
        });
    });

    // --- 2. ВАЛИДАЦИЯ ВОЗРАСТА ---
    document.querySelectorAll('input[name="age"]').forEach(function (input) {
        input.addEventListener("input", function () {
            this.value = this.value.replace(/\D/g, "");
            if (this.value.length > 3) this.value = this.value.substring(0, 3);

            const val = parseInt(this.value);
            this.classList.remove("is-valid", "is-invalid");

            if (this.value && !isNaN(val)) {
                if (val >= 1 && val <= 150) {
                    this.classList.add("is-valid");
                } else {
                    this.classList.add("is-invalid");
                }
            }
        });
    });

    // --- 2. ВАЛИДАЦИЯ ГОДА ИЗДАНИЯ ---
    document
        .querySelectorAll('input[name="yearPublish"]')
        .forEach(function (input) {
            input.addEventListener("input", function () {
                this.value = this.value.replace(/\D/g, "");
                if (this.value.length > 4)
                    this.value = this.value.substring(0, 4);

                const val = parseInt(this.value);
                this.classList.remove("is-valid", "is-invalid");

                if (this.value && !isNaN(val)) {
                    if (val >= 1 && val <= 2050) {
                        this.classList.add("is-valid");
                    } else {
                        this.classList.add("is-invalid");
                    }
                }
            });
        });

    // ============================================
    // 8. МАСКА И ВАЛИДАЦИЯ EMAIL
    // ============================================

    // --- Функция валидации email ---
    function validateEmail(input) {
        const value = input.value.trim();
        const field = input.closest(".field");
        const errorSpan = field
            ? field.querySelector('[data-formit-error="email"]')
            : null;

        // Убираем старые классы
        input.classList.remove("is-valid", "is-invalid");

        // Если поле пустое
        if (!value) {
            if (errorSpan) {
                errorSpan.textContent = "Введите email";
            }
            input.classList.add("is-invalid");
            return false;
        }

        // Регулярное выражение для проверки email
        // Поддерживает: name@domain.com, name@domain.ru, name@sub.domain.com
        const emailRegex = /^[a-zA-Z0-9._%+\-]+@[a-zA-Z0-9.\-]+\.[a-zA-Z]{2,}$/;

        if (!emailRegex.test(value)) {
            // Определяем тип ошибки
            let errorMessage = "Введите корректный email";

            if (!value.includes("@")) {
                errorMessage = "Email должен содержать символ @";
            } else if (!value.includes(".")) {
                errorMessage = "Email должен содержать точку после @";
            } else if (value.indexOf("@") === 0) {
                errorMessage = "Введите имя пользователя перед @";
            } else if (value.lastIndexOf(".") < value.indexOf("@")) {
                errorMessage = "Введите домен после @ (например, .com, .ru)";
            } else if (value.length < 5) {
                errorMessage = "Email слишком короткий";
            } else {
                // Проверяем, что после точки есть буквы
                const domainPart = value.substring(value.lastIndexOf(".") + 1);
                if (domainPart.length < 2) {
                    errorMessage =
                        "Введите корректное расширение домена (например, .com, .ru)";
                }
            }

            if (errorSpan) {
                errorSpan.textContent = errorMessage;
            }
            input.classList.add("is-invalid");
            return false;
        }

        // Дополнительная проверка на популярные домены
        const allowedDomains = [
            "com",
            "ru",
            "org",
            "net",
            "info",
            "biz",
            "io",
            "me",
            "gov",
            "edu",
        ];
        const domain = value
            .substring(value.lastIndexOf(".") + 1)
            .toLowerCase();

        // Если домен не в списке, но это не ошибка, просто предупреждение
        // Можно раскомментировать, если нужно ограничить домены
        /*
        if (!allowedDomains.includes(domain)) {
            if (errorSpan) {
                errorSpan.textContent = 'Нестандартный домен. Убедитесь, что email корректен';
            }
            input.classList.add('is-valid');
            input.classList.add('has-warning');
            return true;
        }
        */

        // Все хорошо
        if (errorSpan) {
            errorSpan.textContent = "";
        }
        input.classList.add("is-valid");
        return true;
    }

    // --- Применяем валидацию ко всем полям email ---
    const emailInputs = document.querySelectorAll(
        'input[type="email"], input[name="email"]',
    );
    emailInputs.forEach(function (input) {
        // При вводе - проверяем
        input.addEventListener("input", function () {
            // Если поле пустое, не показываем ошибку сразу
            if (!this.value.trim()) {
                this.classList.remove("is-valid", "is-invalid");
                const field = this.closest(".field");
                const errorSpan = field
                    ? field.querySelector('[data-formit-error="email"]')
                    : null;
                if (errorSpan) {
                    errorSpan.textContent = "";
                }
                return;
            }
            validateEmail(this);
        });

        // При потере фокуса
        input.addEventListener("blur", function () {
            if (this.value.trim()) {
                validateEmail(this);
            } else {
                this.classList.remove("is-valid", "is-invalid");
            }
        });

        // При вставке из буфера обмена
        input.addEventListener("paste", function (e) {
            setTimeout(function () {
                if (input.value.trim()) {
                    validateEmail(input);
                }
            }, 100);
        });

        // Автодополнение для популярных доменов (опционально)
        input.addEventListener("input", function () {
            const value = this.value;
            if (
                value.includes("@") &&
                !value.includes(".") &&
                value.indexOf("@") === value.length - 1
            ) {
                // Показываем подсказку с популярными доменами
                // Можно реализовать выпадающий список
            }
        });
    });

    // --- Автодополнение для email (опционально) ---
    // Создаем подсказку для популярных доменов
    function createEmailSuggestion(input) {
        const popularDomains = [
            "gmail.com",
            "yandex.ru",
            "mail.ru",
            "bk.ru",
            "inbox.ru",
            "list.ru",
            "rambler.ru",
            "yahoo.com",
            "hotmail.com",
            "outlook.com",
        ];

        // Проверяем, что введено имя пользователя и @
        const value = input.value;
        if (
            value.includes("@") &&
            !value.includes(".") &&
            value.indexOf("@") === value.length - 1
        ) {
            // Показываем подсказку
            const field = input.closest(".field");
            let suggestionBox = field
                ? field.querySelector(".email-suggestions")
                : null;

            if (!suggestionBox) {
                suggestionBox = document.createElement("div");
                suggestionBox.className = "email-suggestions";
                if (field) field.appendChild(suggestionBox);
            }

            // Очищаем старые подсказки
            suggestionBox.innerHTML = "";
            suggestionBox.style.display = "block";

            // Добавляем популярные домены
            const username = value.substring(0, value.indexOf("@"));
            popularDomains.slice(0, 5).forEach(function (domain) {
                const suggestion = document.createElement("div");
                suggestion.className = "email-suggestion";
                suggestion.textContent = username + "@" + domain;
                suggestion.addEventListener("click", function () {
                    input.value = this.textContent;
                    suggestionBox.style.display = "none";
                    validateEmail(input);
                });
                suggestionBox.appendChild(suggestion);
            });

            // Скрываем подсказку при потере фокуса
            setTimeout(function () {
                document.addEventListener("click", function hideSuggestions(e) {
                    if (
                        !suggestionBox.contains(e.target) &&
                        e.target !== input
                    ) {
                        suggestionBox.style.display = "none";
                        document.removeEventListener("click", hideSuggestions);
                    }
                });
            }, 100);
        } else {
            // Скрываем подсказку
            const field = input.closest(".field");
            const suggestionBox = field
                ? field.querySelector(".email-suggestions")
                : null;
            if (suggestionBox) {
                suggestionBox.style.display = "none";
            }
        }
    }

    // Добавляем автодополнение для email полей (опционально)
    emailInputs.forEach(function (input) {
        input.addEventListener("input", function () {
            if (this.value.includes("@")) {
                createEmailSuggestion(this);
            }
        });
    });

    // Скрываем подсказки при скролле
    document.addEventListener("scroll", function () {
        document
            .querySelectorAll(".email-suggestions")
            .forEach(function (suggestion) {
                suggestion.style.display = "none";
            });
    });

    // ============================================
    // 9. КАСТОМНАЯ ВАЛИДАЦИЯ EMAIL (для FormIt)
    // ============================================
    const form = document.querySelector("form[data-formit-ajax-token]");
    if (form) {
        form.addEventListener("submit", function (e) {
            const emailInput = this.querySelector(
                'input[type="email"], input[name="email"]',
            );
            if (emailInput) {
                const isValid = validateEmail(emailInput);
                if (!isValid) {
                    e.preventDefault();
                    // Прокручиваем к полю email
                    setTimeout(function () {
                        const headerOffset = 100;
                        const elementPosition =
                            emailInput.getBoundingClientRect().top;
                        const offsetPosition =
                            elementPosition + window.pageYOffset - headerOffset;
                        window.scrollTo({
                            top: offsetPosition,
                            behavior: "smooth",
                        });
                        emailInput.focus();
                    }, 100);
                    return false;
                }
            }
        });
    }
});

// ============================================
// ТАБЛИЦА КНИГ
// ============================================

document.addEventListener("DOMContentLoaded", function () {
    const MAX_BOOKS = 10;
    const PRICE_PER_BOOK = 50;

    const booksTableBody = document.getElementById("booksTableBody");
    const addBookBtn = document.getElementById("addBookBtn");
    const maxWarning = document.getElementById("maxBooksWarning");
    const bookCountInput = document.getElementById("bookCount");
    const priceValue = document.getElementById("priceValue");
    const tooltipBooks = document.getElementById("tooltipBooks");
    const tooltipTotal = document.getElementById("tooltipTotal");

    // Функция обновления цены
    function updatePrice() {
        const rows = booksTableBody.querySelectorAll(".books-table__row");
        const count = rows.length;
        const total = count * PRICE_PER_BOOK;

        // Находим все элементы с ценой
        const priceElements = document.querySelectorAll(
            ".price-value, #priceValue",
        );

        priceElements.forEach(function (el) {
            // Очищаем все содержимое
            while (el.firstChild) {
                el.removeChild(el.firstChild);
            }
            // Добавляем новый текст
            el.appendChild(document.createTextNode(total + " ₽"));
            console.log("✅ Обновлен элемент:", el, "на:", total + " ₽");
        });

        // После обновления цены
        // if (priceValue) {
        //     // Добавляем анимацию
        //     priceValue.style.transition = "all 0.3s ease";
        //     priceValue.style.color = "#3B82F6";
        //     priceValue.style.transform = "scale(1.1)";

        //     setTimeout(function () {
        //         priceValue.style.color = "";
        //         priceValue.style.transform = "scale(1)";
        //     }, 300);
        // }

        if (tooltipBooks) {
            tooltipBooks.textContent = count;
        }
        if (tooltipTotal) {
            tooltipTotal.textContent = total + " ₽";
        }
        if (bookCountInput) {
            bookCountInput.value = count;
        }
    }

    // Функция добавления новой строки
    function addBookRow() {
        const rows = booksTableBody.querySelectorAll(".books-table__row");
        const currentCount = rows.length;

        if (currentCount >= MAX_BOOKS) {
            if (maxWarning) {
                maxWarning.style.display = "block";
                setTimeout(function () {
                    maxWarning.style.display = "none";
                }, 3000);
            }
            return;
        }

        const newIndex = currentCount;

        // Создаем новую строку
        const row = document.createElement("div");
        row.className = "books-table__row books-table__row--adding";
        row.dataset.rowIndex = newIndex;

        row.innerHTML = `
            <span class="books-table__col books-table__col--number">${newIndex + 1}</span>
            <div class="books-table__col books-table__col--author">
                <input type="text" name="book_author[]" class="books-table__input" placeholder="Автор" data-error="book_author_${newIndex}">
                <span class="field__error" data-formit-error="book_author_${newIndex}"></span>
            </div>
            <div class="books-table__col books-table__col--title">
                <input type="text" name="book_title[]" class="books-table__input" placeholder="Заглавие" data-error="book_title_${newIndex}">
                <span class="field__error" data-formit-error="book_title_${newIndex}"></span>
            </div>
            <div class="books-table__col books-table__col--year">
                <input type="text" name="book_year[]" class="books-table__input" placeholder="Год">
            </div>
            <div class="books-table__col books-table__col--place">
                <input type="text" name="book_place[]" class="books-table__input" placeholder="Место">
            </div>
            <div class="books-table__col books-table__col--volume">
                <input type="text" name="book_volume[]" class="books-table__input" placeholder="Том">
            </div>
            <div class="books-table__col books-table__col--actions">
                <button type="button" class="books-table__remove-btn" data-row-index="${newIndex}">
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <line x1="18" y1="6" x2="6" y2="18"/>
                        <line x1="6" y1="6" x2="18" y2="18"/>
                    </svg>
                </button>
            </div>
        `;

        // Добавляем строку в таблицу
        booksTableBody.appendChild(row);

        // Обновляем нумерацию
        updateRowNumbers();

        // Обновляем цену
        updatePrice();

        // Показываем кнопку удаления у первой строки, если есть больше одной строки
        updateRemoveButtons();

        // Обновляем состояние кнопки "Добавить"
        if (currentCount + 1 >= MAX_BOOKS) {
            if (addBookBtn) {
                addBookBtn.disabled = true;
            }
        }

        // Убираем анимацию
        setTimeout(function () {
            row.classList.remove("books-table__row--adding");
        }, 300);
    }

    // Функция удаления строки
    function removeBookRow(button) {
        const row = button.closest(".books-table__row");
        const rows = booksTableBody.querySelectorAll(".books-table__row");

        // Не удаляем последнюю строку
        if (rows.length <= 1) {
            return;
        }

        // Анимация удаления
        row.classList.add("books-table__row--removing");

        setTimeout(function () {
            row.remove();
            updateRowNumbers();
            updatePrice();
            updateRemoveButtons();

            // Включаем кнопку "Добавить" если нужно
            const currentRows =
                booksTableBody.querySelectorAll(".books-table__row");
            if (currentRows.length < MAX_BOOKS) {
                if (addBookBtn) {
                    addBookBtn.disabled = false;
                }
            }
        }, 300);
    }

    // Функция обновления нумерации
    function updateRowNumbers() {
        const rows = booksTableBody.querySelectorAll(".books-table__row");
        rows.forEach(function (row, index) {
            const numberCol = row.querySelector(".books-table__col--number");
            if (numberCol) {
                numberCol.textContent = index + 1;
            }
            row.dataset.rowIndex = index;
        });
    }

    // Функция обновления кнопок удаления
    function updateRemoveButtons() {
        const rows = booksTableBody.querySelectorAll(".books-table__row");
        const removeBtns = booksTableBody.querySelectorAll(
            ".books-table__remove-btn",
        );

        removeBtns.forEach(function (btn, index) {
            if (rows.length <= 1) {
                btn.style.display = "none";
            } else {
                btn.style.display = "flex";
            }
        });
    }

    // ============================================
    // СОБЫТИЯ
    // ============================================

    // Добавление книги
    if (addBookBtn) {
        addBookBtn.addEventListener("click", addBookRow);
    }

    // Удаление книги (делегирование событий)
    if (booksTableBody) {
        booksTableBody.addEventListener("click", function (e) {
            const removeBtn = e.target.closest(".books-table__remove-btn");
            if (removeBtn) {
                removeBookRow(removeBtn);
            }
        });
    }

    // Валидация полей книги при вводе
    if (booksTableBody) {
        booksTableBody.addEventListener("input", function (e) {
            const input = e.target.closest(".books-table__input");
            if (input) {
                // Проверяем обязательные поля
                const isAuthor = input.name === "book_author[]";
                const isTitle = input.name === "book_title[]";

                if (isAuthor || isTitle) {
                    const errorSpan = input
                        .closest(".books-table__col")
                        .querySelector(".field__error");
                    if (input.value.trim()) {
                        input.classList.remove("is-invalid");
                        if (errorSpan) {
                            errorSpan.textContent = "";
                        }
                    }
                }
            }
        });
    }

    // ============================================
    // ДОПОЛНИТЕЛЬНАЯ ВАЛИДАЦИЯ ДЛЯ ТАБЛИЦЫ
    // ============================================

    // Проверка перед отправкой формы
    const form = document.querySelector("#form_3 form");
    if (form) {
        form.addEventListener("submit", function (e) {
            const rows = booksTableBody.querySelectorAll(".books-table__row");
            let hasErrors = false;

            rows.forEach(function (row, index) {
                const authorInput = row.querySelector(
                    'input[name="book_author[]"]',
                );
                const titleInput = row.querySelector(
                    'input[name="book_title[]"]',
                );

                // Проверяем автора
                if (authorInput && !authorInput.value.trim()) {
                    authorInput.classList.add("is-invalid");
                    const errorSpan = authorInput
                        .closest(".books-table__col")
                        .querySelector(".field__error");
                    if (errorSpan) {
                        errorSpan.textContent = "Введите автора";
                    }
                    hasErrors = true;
                }

                // Проверяем заглавие
                if (titleInput && !titleInput.value.trim()) {
                    titleInput.classList.add("is-invalid");
                    const errorSpan = titleInput
                        .closest(".books-table__col")
                        .querySelector(".field__error");
                    if (errorSpan) {
                        errorSpan.textContent = "Введите заглавие";
                    }
                    hasErrors = true;
                }
            });

            if (hasErrors) {
                e.preventDefault();
                // Прокручиваем к таблице
                const booksTable = document.querySelector(".books-table");
                if (booksTable) {
                    setTimeout(function () {
                        const headerOffset = 100;
                        const elementPosition =
                            booksTable.getBoundingClientRect().top;
                        const offsetPosition =
                            elementPosition + window.pageYOffset - headerOffset;
                        window.scrollTo({
                            top: offsetPosition,
                            behavior: "smooth",
                        });
                    }, 100);
                }
            }
        });
    }

    // --- 2. ВАЛИДАЦИЯ ГОДА ИЗДАНИЯ ---
    document
        .querySelectorAll('input[name="book_year[]"]')
        .forEach(function (input) {
            input.addEventListener("input", function () {
                this.value = this.value.replace(/\D/g, "");
                if (this.value.length > 4)
                    this.value = this.value.substring(0, 4);

                const val = parseInt(this.value);
                this.classList.remove("is-valid", "is-invalid");

                if (this.value && !isNaN(val)) {
                    if (val >= 1 && val <= 2050) {
                        this.classList.add("is-valid");
                    } else {
                        this.classList.add("is-invalid");
                    }
                }
            });
        });

    // --- 2. ВАЛИДАЦИЯ ТОМА ИЗДАНИЯ ---
    document
        .querySelectorAll('input[name="book_volume[]"]')
        .forEach(function (input) {
            input.addEventListener("input", function () {
                this.value = this.value.replace(/\D/g, "");
                if (this.value.length > 3)
                    this.value = this.value.substring(0, 3);

                const val = parseInt(this.value);
                this.classList.remove("is-valid", "is-invalid");

                if (this.value && !isNaN(val)) {
                    if (val >= 1 && val <= 100) {
                        this.classList.add("is-valid");
                    } else {
                        this.classList.add("is-invalid");
                    }
                }
            });
        });

    // Инициализация
    updatePrice();
    updateRemoveButtons();

    // console.log("✅ Таблица книг инициализирована");
});
