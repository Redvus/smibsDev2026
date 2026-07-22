let currentSessionId = null;
let currentMode = null;
let currentAnswer = null;
let currentQuestionId = null;
let currentResult = null; // Сохраняем результат для экспорта
let currentQuestionObject = null;

function startChat(mode) {
    currentMode = mode;
    addMessage("bot", "🤔 Думаю...");

    fetch("/assets/ajax/bot.php", {
        method: "POST",
        headers: { "Content-Type": "application/x-www-form-urlencoded" },
        body: "bot_action=start&mode=" + mode,
    })
        .then((res) => res.json())
        .then((data) => {
            document
                .querySelector("#chat-messages .message.bot:last-child")
                ?.remove();

            if (data.success) {
                currentSessionId = data.data.sessionId;

                // ✅ Добавляем приветствие для режима "Эксперт"
                // if (mode === "expert") {
                //     addMessage(
                //         "bot",
                //         "Я помогу оценить готовность вашего мероприятия. При ответе на мои вопросы нажимайте на кнопки «да» или «нет». Если вы что-то упустили, я дам совет, как доработать этот пункт. Начнём.",
                //     );
                // }

                showQuestion(data.data.question);
                document.getElementById("mode-selector").style.display = "none";
                document.getElementById("input-area").style.display = "block";
            } else {
                addMessage("bot", "❌ Ошибка. Попробуйте позже.");
            }
        })
        .catch((error) => {
            addMessage("bot", "❌ Ошибка соединения");
        });
}

function showQuestion(question) {
    const questionText = document.getElementById("question-text");
    const optionsContainer = document.getElementById("options-container");
    const userInput = document.getElementById("user-input");
    const textarea = document.getElementById("user-textarea");
    const sendBtn = document.querySelector(".send-btn");

    currentQuestionId = question.id;
    questionText.innerHTML = "<strong>" + question.text + "</strong>";
    currentQuestionObject = question;

    // Очищаем всё перед показом нового вопроса
    optionsContainer.innerHTML = "";
    if (userInput) userInput.style.display = "none";
    if (textarea) textarea.style.display = "none";
    // ✅ Скрываем кнопку "Отправить" по умолчанию
    if (sendBtn) sendBtn.style.display = "none";

    if (question.type === "options" && question.options) {
        // if (sendBtn) sendBtn.style.display = "inline-block";

        // Обычные кнопки-варианты
        question.options.forEach((opt) => {
            const btn = document.createElement("button");
            btn.className = "option-btn";
            btn.textContent = opt.label;
            // Сохраняем и value, и label
            btn.dataset.value = opt.value;
            btn.dataset.label = opt.label;
            btn.onclick = () => {
                // Очищаем контейнер сразу после клика
                optionsContainer.innerHTML = "";
                selectOption(opt.value, opt.label);
            };
            optionsContainer.appendChild(btn);
        });
    } else if (question.type === "multiple" && question.options) {
        // if (sendBtn) sendBtn.style.display = "inline-block";

        // Multiple choice с чекбоксами
        const selectedValues = [];

        question.options.forEach((opt) => {
            const div = document.createElement("div");
            div.className = "checkbox-option";

            const checkbox = document.createElement("input");
            checkbox.type = "checkbox";
            checkbox.value = opt.value;
            checkbox.id = "opt_" + opt.value.replace(/[^a-z0-9]/gi, "_");

            const label = document.createElement("label");
            label.htmlFor = checkbox.id;
            label.textContent = opt.label;

            div.appendChild(checkbox);
            div.appendChild(label);
            optionsContainer.appendChild(div);
        });

        const doneBtn = document.createElement("button");
        doneBtn.className = "option-btn done-btn";
        doneBtn.textContent = "✅ Готово";
        doneBtn.onclick = () => {
            const checkboxes = optionsContainer.querySelectorAll(
                'input[type="checkbox"]:checked',
            );
            const values = Array.from(checkboxes).map((cb) => cb.value);
            const labels = Array.from(checkboxes).map((cb) => {
                const label = document.querySelector(`label[for="${cb.id}"]`);
                return label ? label.textContent : cb.value;
            });
            // Очищаем контейнер после нажатия Готово
            optionsContainer.innerHTML = "";
            // Исправлено: передаём объект с values и labels
            selectOption(
                JSON.stringify({ values: values, labels: labels }),
                labels.join(", "),
            );
        };
        optionsContainer.appendChild(doneBtn);
    } else if (question.type === "textarea") {
        if (sendBtn) sendBtn.style.display = "inline-block";

        if (textarea) {
            textarea.style.display = "block";
            textarea.value = "";
            textarea.focus();
        } else {
            const newTextarea = document.createElement("textarea");
            newTextarea.id = "user-textarea";
            newTextarea.placeholder = "Введите подробное описание...";
            newTextarea.rows = 4;
            optionsContainer.appendChild(newTextarea);
            newTextarea.focus();
        }

        // Добавляем кнопку отправки для textarea
        const sendBtn = document.createElement("button");
        sendBtn.className = "option-btn send-textarea-btn";
        sendBtn.textContent = "📤 Отправить";
        sendBtn.onclick = () => {
            const textareaValue =
                document.getElementById("user-textarea")?.value ||
                optionsContainer.querySelector("textarea")?.value ||
                "";
            if (textareaValue) {
                optionsContainer.innerHTML = "";
                selectOption(textareaValue);
            } else {
                addMessage("bot", "Пожалуйста, введите описание.");
            }
        };
        optionsContainer.appendChild(sendBtn);
    } else if (
        question.type === "boolean" ||
        question.type === "boolean_with_na"
    ) {
        if (sendBtn) sendBtn.style.display = "none";

        // Кнопки ДА/НЕТ (и возможно НЕ ТРЕБУЕТСЯ)
        optionsContainer.innerHTML = "";
        userInput.style.display = "none";

        const yesBtn = document.createElement("button");
        yesBtn.className = "option-btn yes-btn";
        yesBtn.textContent = "Да";
        yesBtn.onclick = () => {
            optionsContainer.innerHTML = "";
            selectOption("true", "Да");
        };
        optionsContainer.appendChild(yesBtn);

        const noBtn = document.createElement("button");
        noBtn.className = "option-btn no-btn";
        noBtn.textContent = "Нет";
        noBtn.onclick = () => {
            optionsContainer.innerHTML = "";
            selectOption("false", "Нет");
        };
        optionsContainer.appendChild(noBtn);

        if (question.type === "boolean_with_na") {
            const naBtn = document.createElement("button");
            naBtn.className = "option-btn na-btn";
            naBtn.textContent = "Не требуется";
            naBtn.onclick = () => {
                optionsContainer.innerHTML = "";
                selectOption("na", "Не требуется");
            };
            optionsContainer.appendChild(naBtn);
        }
    } else {
        if (sendBtn) sendBtn.style.display = "inline-block";

        // Обычное текстовое поле
        if (userInput) {
            userInput.style.display = "block";
            userInput.value = "";
            userInput.focus();
        }
    }
}

let currentAnswerValue = null;
let currentAnswerLabel = null;

function selectOption(value, label) {
    currentAnswerValue = value;
    currentAnswerLabel = label;
    sendAnswer();
}

function sendAnswer() {
    let answer = currentAnswerValue;
    let displayAnswer = currentAnswerLabel;

    if (!answer) {
        answer = document.getElementById("user-input").value;
        displayAnswer = answer;
        if (!answer) {
            const textarea = document.getElementById("user-textarea");
            if (textarea) {
                answer = textarea.value;
                displayAnswer = answer;
            }
        }
    }

    // Для multiple choice — исправлено
    if (typeof answer === "string" && answer.startsWith("{")) {
        try {
            const parsed = JSON.parse(answer);
            if (parsed.values && parsed.labels) {
                displayAnswer = parsed.labels.join(", ");
                answer = JSON.stringify(parsed.values);
            }
        } catch (e) {}
    }

    if (!answer && answer !== 0) {
        addMessage("bot", "Пожалуйста, введите ответ.");
        return;
    }

    // Показываем понятный ответ пользователю (label)
    addMessage("user", displayAnswer || answer);

    if (
        currentQuestionObject &&
        (answer === "false" || answer === "no" || answer === "нет")
    ) {
        if (currentQuestionObject.advice) {
            addMessage(
                "bot",
                "💡 Совет по доработке:\n\n" + currentQuestionObject.advice,
            );
        }
    }

    // Очищаем всё перед отправкой
    clearQuestionArea();

    // Отправляем на сервер value (для логики)
    fetch("/assets/ajax/bot.php", {
        method: "POST",
        headers: { "Content-Type": "application/x-www-form-urlencoded" },
        body:
            "bot_action=answer&session_id=" +
            currentSessionId +
            "&question_id=" +
            currentQuestionId +
            "&answer=" +
            encodeURIComponent(answer),
    })
        .then((res) => res.json())
        .then((data) => {
            if (data.success && data.data.completed) {
                currentResult = data.data.result;
                displayResult(currentResult);
            } else if (data.success && data.data.question) {
                showQuestion(data.data.question);
            } else {
                addMessage("bot", "❌ Ошибка");
            }
        })
        .catch((error) => {
            addMessage("bot", "❌ Ошибка: " + error);
        });

    currentAnswerValue = null;
    currentAnswerLabel = null;
}

function clearQuestionArea() {
    // Очищаем текст вопроса
    const questionText = document.getElementById("question-text");
    if (questionText) {
        questionText.innerHTML = "";
    }

    // Очищаем контейнер с опциями
    const optionsContainer = document.getElementById("options-container");
    if (optionsContainer) {
        optionsContainer.innerHTML = "";
    }

    // Прячем и очищаем текстовое поле
    const userInput = document.getElementById("user-input");
    if (userInput) {
        userInput.style.display = "none";
        userInput.value = "";
    }

    // Прячем и очищаем textarea
    const textarea = document.getElementById("user-textarea");
    if (textarea) {
        textarea.style.display = "none";
        textarea.value = "";
    }
}

function displayResult(result) {
    // Скрываем кнопку отправки
    const sendBtn = document.querySelector(".send-btn");
    if (sendBtn) sendBtn.style.display = "none";

    if (result.type === "plan") {
        addMessage("bot", formatPlanResult(result));
    } else if (result.type === "evaluation") {
        addMessage("bot", formatEvaluationResult(result));
    } else if (result.type === "constructor") {
        addMessage("bot", formatConstructorResult(result));
    } else if (result.type === "expert") {
        addMessage("bot", formatExpertResult(result));
    } else {
        addMessage("bot", JSON.stringify(result));
    }

    showExportButtons();
}

function formatPlanResult(plan) {
    let structureHtml = "";
    for (let i = 0; i < plan.structure.length; i++) {
        structureHtml += "• " + plan.structure[i] + "<br>";
    }

    let recommendationsHtml = "";
    for (let i = 0; i < plan.recommendations.length; i++) {
        recommendationsHtml += "• " + plan.recommendations[i] + "<br>";
    }

    let checklistHtml = "";
    for (let i = 0; i < plan.checklist.length; i++) {
        checklistHtml += "✓ " + plan.checklist[i] + "<br>";
    }

    return `
        <div class="result-card" id="result-content">
            <h3>📋 ПЛАН МЕРОПРИЯТИЯ</h3>
            <h2>"${plan.title}"</h2>

            <div class="info-block">
                <strong>👥 Аудитория:</strong> ${plan.audience}<br>
                <strong>🎯 Цель:</strong> ${plan.goal}<br>
                <strong>⏱ Длительность:</strong> ${plan.duration}<br>
                <strong>📊 Рекомендуемые форматы:</strong> ${plan.recommended_formats}<br>
                <strong>🧠 Особенности возраста:</strong> ${plan.age_features}
            </div>

            <div class="info-block">
                <strong>📝 СТРУКТУРА МЕРОПРИЯТИЯ:</strong><br>
                ${structureHtml}
            </div>

            <div class="info-block">
                <strong>💡 РЕКОМЕНДАЦИИ:</strong><br>
                ${recommendationsHtml}
            </div>

            <div class="info-block">
                <strong>✅ ЧЕК-ЛИСТ ПОДГОТОВКИ:</strong><br>
                ${checklistHtml}
            </div>

            <div class="info-block">
                <strong>🌤 СЕЗОННЫЕ СОВЕТЫ:</strong><br>
                • ${plan.seasonal_tips}
            </div>
        </div>
    `;
}

// ✅ Стало (правильно)
function formatEvaluationResult(evaluationData) {
    let strengthsHtml = "";
    for (let i = 0; i < evaluationData.strengths.length; i++) {
        strengthsHtml += "✓ " + evaluationData.strengths[i] + "<br>";
    }

    let weaknessesHtml = "";
    for (let i = 0; i < evaluationData.weaknesses.length; i++) {
        weaknessesHtml += "⚠ " + evaluationData.weaknesses[i] + "<br>";
    }

    let recommendationsHtml = "";
    for (let i = 0; i < evaluationData.recommendations.length; i++) {
        recommendationsHtml +=
            "• " + evaluationData.recommendations[i] + "<br>";
    }

    let nextStepsHtml = "";
    for (let i = 0; i < evaluationData.next_steps.length; i++) {
        nextStepsHtml += i + 1 + ". " + evaluationData.next_steps[i] + "<br>";
    }

    return `
        <div class="result-card" id="result-content">
            <h3>⭐ ОЦЕНКА МЕРОПРИЯТИЯ</h3>

            <div class="score-block">
                <strong>Общая оценка:</strong> ${evaluationData.score} / 100
            </div>

            <div class="info-block strengths">
                <strong>✅ СИЛЬНЫЕ СТОРОНЫ:</strong><br>
                ${strengthsHtml}
            </div>

            <div class="info-block weaknesses">
                <strong>⚠ ЗОНЫ РОСТА:</strong><br>
                ${weaknessesHtml}
            </div>

            <div class="info-block">
                <strong>💡 РЕКОМЕНДАЦИИ ПО УЛУЧШЕНИЮ:</strong><br>
                ${recommendationsHtml}
            </div>

            <div class="info-block">
                <strong>📌 СЛЕДУЮЩИЕ ШАГИ:</strong><br>
                ${nextStepsHtml}
            </div>
        </div>
    `;
}

function formatExpertResult(data) {
    let advicesHtml = "";

    if (data.has_issues) {
        for (let i = 0; i < data.advices.length; i++) {
            advicesHtml += `
                <div class="advice-item">
                    <div class="advice-icon">⚠️</div>
                    <div class="advice-text">${data.advices[i].replace(/\n/g, "<br>")}</div>
                </div>
            `;
        }

        return `
            <div class="result-card" id="result-content">
                <h3>📋 РЕЗУЛЬТАТ ЭКСПЕРТИЗЫ</h3>

                <div class="expert-verdict warning">
                    <strong>Вы хорошо поработали, но для идеального результата стоит обратить внимание на несколько моментов.</strong>
                </div>

                <div class="info-block">
                    <strong>⚠️ СОВЕТЫ ПО ДОРАБОТКЕ:</strong>
                    <div class="advices-list">
                        ${advicesHtml}
                    </div>
                </div>

                <div class="info-block">
                    <strong>💡 ВАЖНЫЕ ЗАМЕЧАНИЯ:</strong>
                    <ul>
                        ${data.general_advices.map((a) => `<li>${a}</li>`).join("")}
                    </ul>
                </div>
            </div>
        `;
    } else {
        return `
            <div class="result-card" id="result-content">
                <h3>📋 РЕЗУЛЬТАТ ЭКСПЕРТИЗЫ</h3>

                <div class="expert-verdict success">
                    <strong>✅ Отлично! Вы всё продумали. Мероприятие готово к проведению.</strong>
                </div>

                <div class="info-block">
                    <strong>💡 ВАЖНЫЕ СОВЕТЫ:</strong>
                    <ul>
                        ${data.general_advices.map((a) => `<li>${a}</li>`).join("")}
                    </ul>
                </div>
            </div>
        `;
    }
}

function formatConstructorResult(constructor) {
    let formatsHtml = "";
    for (let i = 0; i < constructor.suitable_formats.length; i++) {
        formatsHtml += "• " + constructor.suitable_formats[i] + "<br>";
    }

    let ideasHtml = "";
    for (let i = 0; i < constructor.ideas.length; i++) {
        ideasHtml += "✨ " + constructor.ideas[i] + "<br>";
    }

    let audienceTipsHtml = "";
    for (let i = 0; i < constructor.audience_tips.length; i++) {
        audienceTipsHtml += "• " + constructor.audience_tips[i] + "<br>";
    }

    let budgetTipsHtml = "";
    for (let i = 0; i < constructor.budget_tips.length; i++) {
        budgetTipsHtml += "💰 " + constructor.budget_tips[i] + "<br>";
    }

    let structureHtml = "";
    for (let i = 0; i < constructor.structure_template.length; i++) {
        structureHtml +=
            i + 1 + ". " + constructor.structure_template[i] + "<br>";
    }

    let nextStepsHtml = "";
    for (let i = 0; i < constructor.next_steps.length; i++) {
        nextStepsHtml += i + 1 + ". " + constructor.next_steps[i] + "<br>";
    }

    return `
        <div class="result-card" id="result-content">
            <h3>🛠 КОНСТРУКТОР ФОРМАТА</h3>

            <div class="info-block">
                <strong>🎯 РЕКОМЕНДУЕМЫЕ ФОРМАТЫ:</strong><br>
                ${formatsHtml}
            </div>

            <div class="info-block">
                <strong>💡 ИДЕИ ДЛЯ МЕРОПРИЯТИЯ:</strong><br>
                ${ideasHtml}
            </div>

            <div class="info-block">
                <strong>👥 СОВЕТЫ ПО АУДИТОРИИ:</strong><br>
                ${audienceTipsHtml}
            </div>

            <div class="info-block">
                <strong>💰 СОВЕТЫ ПО БЮДЖЕТУ:</strong><br>
                ${budgetTipsHtml}
            </div>

            <div class="info-block">
                <strong>📋 ПРИМЕРНАЯ СТРУКТУРА:</strong><br>
                ${structureHtml}
            </div>

            <div class="info-block">
                <strong>📌 СЛЕДУЮЩИЕ ШАГИ:</strong><br>
                ${nextStepsHtml}
            </div>
        </div>
    `;
}

// Функции для отображения кнопок экспорта после получения результата

function showExportButtons() {
    const messagesDiv = document.getElementById("chat-messages");
    const exportDiv = document.createElement("div");
    exportDiv.className = "export-buttons";
    exportDiv.innerHTML = `
        <button onclick="exportToPDF()" class="export-btn pdf-btn">📄 Сохранить в PDF</button>
        <button onclick="printResult()" class="export-btn print-btn">🖨 Распечатать</button>
        <button onclick="copyToClipboard()" class="export-btn copy-btn">📋 Копировать</button>
    `;
    messagesDiv.appendChild(exportDiv);
    messagesDiv.scrollTop = messagesDiv.scrollHeight;
}

function exportToPDF() {
    // Подключаем библиотеку html2pdf
    if (typeof html2pdf === "undefined") {
        const script = document.createElement("script");
        script.src =
            "https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js";
        script.onload = () => {
            generatePDF();
        };
        document.head.appendChild(script);
    } else {
        generatePDF();
    }
}

function generatePDF() {
    const element = document.getElementById("result-content");
    const opt = {
        margin: [10, 10, 10, 10],
        filename: "biblioplan.pdf",
        image: { type: "jpeg", quality: 0.98 },
        html2canvas: { scale: 2, letterRendering: true },
        jsPDF: { unit: "mm", format: "a4", orientation: "portrait" },
    };
    html2pdf().set(opt).from(element).save();
}

function printResult() {
    const printContent = document
        .getElementById("result-content")
        .cloneNode(true);
    const printWindow = window.open("", "_blank");
    printWindow.document.write(`
        <html>
            <head>
                <title>План мероприятия</title>
                <style>
                    body { font-family: Arial, sans-serif; padding: 20px; }
                    .result-card { max-width: 800px; margin: 0 auto; }
                    .info-block { margin: 15px 0; padding: 10px; background: #f5f5f5; border-radius: 5px; }
                    h2 { color: #4a6fa5; }
                    h3 { color: #333; }
                </style>
            </head>
            <body>${printContent.innerHTML}</body>
        </html>
    `);
    printWindow.document.close();
    printWindow.print();
    printWindow.close();
}

function copyToClipboard() {
    const content = document.getElementById("result-content").innerText;
    navigator.clipboard.writeText(content).then(() => {
        addMessage("bot", "✅ Текст скопирован в буфер обмена!");
    });
}

function addMessage(sender, text) {
    // Если текст содержит \n, заменяем на <br>
    if (typeof text === "string") {
        text = text.replace(/\n/g, "<br>");
    }

    const messagesDiv = document.getElementById("chat-messages");
    const messageDiv = document.createElement("div");
    messageDiv.className = "message " + sender;
    messageDiv.innerHTML = '<div class="message-content">' + text + "</div>";
    messagesDiv.appendChild(messageDiv);
    messagesDiv.scrollTop = messagesDiv.scrollHeight;
}

function resetChat() {
    currentSessionId = null;
    currentResult = null;

    // Очищаем область вопроса
    clearQuestionArea();

    // Показываем выбор режима
    document.getElementById("mode-selector").style.display = "flex";
    document.getElementById("input-area").style.display = "none";

    // Сбрасываем чат
    document.getElementById("chat-messages").innerHTML =
        '<div class="message bot">' +
        '<div class="message-content">' +
        "Я помогу оценить готовность вашего мероприятия. При ответе на мои вопросы нажимайте на кнопки «да» или «нет». Если вы что-то упустили, я дам совет, как доработать этот пункт. Начнём." +
        "</div>" +
        "</div>";

    // Показываем кнопку отправки
    const sendBtn = document.querySelector(".send-btn");
    if (sendBtn) sendBtn.style.display = "inline-block";
}
