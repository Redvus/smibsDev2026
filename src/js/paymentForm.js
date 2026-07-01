// assets/js/payment-form.js
// ============================================
// ПОЛНЫЙ УНИВЕРСАЛЬНЫЙ СКРИПТ ДЛЯ ВСЕХ ФОРМ
// ============================================

document.addEventListener("DOMContentLoaded", function () {
    // ============================================
    // 1. ПЕРЕКЛЮЧЕНИЕ ФОРМ
    // ============================================

    const formsContainer = document.getElementById("formsContainer");
    const formWrappers = document.querySelectorAll(".form-wrapper");
    const formBtns = document.querySelectorAll(".teaser__button");
    const formOffset = 100;

    // Маппинг кнопок на формы
    const formMap = {
        formBtn_1: "form_1",
        formBtn_2: "form_2",
        formBtn_3: "form_3",
        formBtn_4: "form_4",
    };

    function showForm(formId, buttonId) {
        // Скрываем все формы
        formWrappers.forEach(function (wrapper) {
            wrapper.style.display = "none";
            wrapper.classList.remove("active");
        });

        // Показываем нужную форму
        const targetForm = document.getElementById(formId);
        if (targetForm) {
            targetForm.style.display = "block";
            setTimeout(function () {
                targetForm.classList.add("active");
            }, 50);
        }

        // Обновляем активную кнопку
        formBtns.forEach(function (btn) {
            btn.classList.remove("active");
        });
        const activeBtn = document.getElementById(buttonId);
        if (activeBtn) {
            activeBtn.classList.add("active");
        }

        // Скроллим к формам
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

    // Навешиваем обработчики на кнопки
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
    // 2. УНИВЕРСАЛЬНАЯ ПРОВЕРКА ОШИБОК
    // ============================================

    // Функция поиска всех ошибок в форме
    function getFormErrors(formElement) {
        const errors = [];
        const errorSpans = formElement.querySelectorAll("[data-formit-error]");

        errorSpans.forEach(function (span) {
            const errorText = span.textContent.trim();
            if (errorText) {
                errors.push({
                    field: span.getAttribute("data-formit-error"),
                    message: errorText,
                    element: span,
                });
            }
        });

        return errors;
    }

    // Функция подсветки полей с ошибками
    function highlightErrors(formElement) {
        const errorSpans = formElement.querySelectorAll("[data-formit-error]");

        errorSpans.forEach(function (span) {
            const errorText = span.textContent.trim();
            const field = span.closest(".field");

            if (field && errorText) {
                const input = field.querySelector("input, textarea, select");
                if (input) {
                    input.classList.add("is-invalid");
                }
                field.classList.add("has-error");
            } else if (field) {
                const input = field.querySelector("input, textarea, select");
                if (input) {
                    input.classList.remove("is-invalid");
                }
                field.classList.remove("has-error");
            }
        });
    }

    // Функция прокрутки к первой ошибке
    function scrollToFirstError(formElement) {
        const errorSpans = formElement.querySelectorAll("[data-formit-error]");
        let firstErrorField = null;
        let firstInput = null;

        for (const span of errorSpans) {
            if (span.textContent.trim()) {
                const field = span.closest(".field");
                if (field) {
                    firstErrorField = field;
                    firstInput = field.querySelector("input, textarea, select");
                    break;
                }
            }
        }

        if (firstErrorField) {
            const headerOffset = formOffset;
            const elementPosition = firstErrorField.getBoundingClientRect().top;
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

            return true;
        }

        return false;
    }

    // ============================================
    // 3. ОБРАБОТКА СОБЫТИЙ FORMIT
    // ============================================

    // Ошибка валидации
    document.addEventListener("formit:error", function (e) {
        const activeForm = document.querySelector(".form-wrapper.active form");
        if (!activeForm) return;

        highlightErrors(activeForm);

        setTimeout(function () {
            scrollToFirstError(activeForm);
        }, 400);

        // Разблокируем кнопку
        const submitBtn = activeForm.querySelector('button[type="submit"]');
        if (submitBtn) {
            submitBtn.disabled = false;
            submitBtn.innerHTML = "Отправить заявку";
        }
    });

    // Успешная отправка
    document.addEventListener("formit:success", function (e) {
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

        // Разблокируем кнопку
        const activeForm = document.querySelector(".form-wrapper.active form");
        if (activeForm) {
            const submitBtn = activeForm.querySelector('button[type="submit"]');
            if (submitBtn) {
                submitBtn.disabled = false;
                submitBtn.innerHTML = "Отправить заявку";
            }
        }
    });

    // ============================================
    // 4. ИНИЦИАЛИЗАЦИЯ (автооткрытие по якорю)
    // ============================================

    const hash = window.location.hash;
    if (hash) {
        const formId = hash.substring(1);
        for (const [btnId, fId] of Object.entries(formMap)) {
            if (fId === formId) {
                setTimeout(function () {
                    showForm(formId, btnId);
                }, 500);
                break;
            }
        }
    }

    console.log("✅ Универсальный скрипт для всех форм инициализирован");
});

// assets/js/payment-form.js

// Добавляем обработку редиректа после успешной отправки
document.addEventListener("formit:success", function (e) {
    // Показываем сообщение пользователю
    const successMessage = document.querySelector(
        "[data-formit-success-message]",
    );
    if (successMessage) {
        successMessage.style.display = "block";
        successMessage.innerHTML =
            "✅ Ваша заявка отправлена! Перенаправление на страницу оплаты...";
    }

    // Блокируем кнопку
    const submitBtn = document.querySelector('button[type="submit"]');
    if (submitBtn) {
        submitBtn.disabled = true;
        submitBtn.innerHTML = "Перенаправление...";
    }

    // Редирект будет выполнен автоматически через FormIt redirect hook
    // Но мы можем добавить дополнительную логику
    console.log("🔄 Перенаправление на страницу оплаты...");
});

// Отслеживание успешного редиректа
document.addEventListener("formit:redirect", function (e) {
    console.log("✅ Редирект выполнен на:", e.detail?.url);
});
