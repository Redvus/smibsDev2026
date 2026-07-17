<div class="librarian-chat" id="librarian-chat">
    <div class="chat-header">
        <h3>🤖 Помощник библиотекаря</h3>
        <button onclick="resetChat()" class="reset-btn">Начать заново</button>
    </div>

    <div class="chat-messages" id="chat-messages">
        <div class="message bot">
            <div class="message-content">
                Здравствуйте! Я помогу вам разработать мероприятие или проверить его качество. Выберите режим работы:
            </div>
        </div>
    </div>

    <div class="chat-input-area">
        <div class="mode-selector" id="mode-selector">
            <button onclick="startChat('planner')" class="mode-btn" id="plannerButton">
                📝 Планировщик
            </button>
            <button onclick="startChat('expert')" class="mode-btn" id="expertButton">
                ⭐ Эксперт
            </button>
            <button onclick="startChat('constructor')" class="mode-btn" id="constructorButton">
                🛠 Конструктор
            </button>
        </div>

        <div class="input-area" id="input-area" style="display:none;">
            <div id="question-text"></div>
            <div id="options-container"></div>
            <input type="text" id="user-input" placeholder="Введите ответ..." style="display:none;">
            <button onclick="sendAnswer()" class="send-btn">Отправить</button>
        </div>
    </div>
</div>