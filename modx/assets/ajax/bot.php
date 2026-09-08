<?php
// assets/ajax/bot.php
$_SERVER['HTTP_HOST'] = $_SERVER['HTTP_HOST'] ?? 'localhost';
$_SERVER['DOCUMENT_ROOT'] = dirname(dirname(__DIR__));

require_once dirname(dirname(__DIR__)) . '/config.core.php';
require_once MODX_CORE_PATH . 'model/modx/modx.class.php';

$modx = new modX();
$modx->initialize('web');

// Включаем отладку для теста
$modx->setDebug(true);

// Получаем параметры
$bot_action = $_POST['bot_action'] ?? $_GET['bot_action'] ?? '';
$mode = $_POST['mode'] ?? $_GET['mode'] ?? '';
$session_id = $_POST['session_id'] ?? $_GET['session_id'] ?? '';
$question_id = $_POST['question_id'] ?? $_GET['question_id'] ?? '';
$answer = $_POST['answer'] ?? $_GET['answer'] ?? '';

// Вызываем сниппет
$response = $modx->runSnippet('LibrarianBot', [
    'bot_action' => $bot_action,
    'mode' => $mode,
    'session_id' => $session_id,
    'question_id' => $question_id,
    'answer' => $answer
]);

// Если сниппет ничего не вернул
if (empty($response)) {
    $response = json_encode(['success' => false, 'message' => 'Сниппет не вернул результат']);
}

header('Content-Type: application/json');
echo $response;