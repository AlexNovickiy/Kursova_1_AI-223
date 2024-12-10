<?php
require  'db.php';

// Установка заголовків
header("Content-Type: application/json");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");

// Отримання методу запиту
$method = $_SERVER['REQUEST_METHOD'];

switch ($method) {
    case 'GET':
        if (isset($_GET['id'])) {
            // Отримати конкретний запис за ID
            $id = intval($_GET['id']);
            $data = selectOne('comments', ['id' => $id]);
        } else {
            // Отримати всі записи
            $data = selectAll('comments');
        }
        echo json_encode($data);
        break;

    case 'POST':
        // Додати новий запис
        $input = json_decode(file_get_contents('php://input'), true);
        if ($input) {
            $newId = insert('comments', $input);
            echo json_encode(['message' => 'Record created', 'id' => $newId]);
        }
        break;

    case 'PUT':
        // Оновити запис
        if (isset($_GET['id'])) {
            $id = intval($_GET['id']);
            $input = json_decode(file_get_contents('php://input'), true);
            update('comments', $id, $input);
            echo json_encode(['message' => 'Record updated']);
        }
        break;

    case 'DELETE':
        // Видалити запис
        if (isset($_GET['id'])) {
            $id = intval($_GET['id']);
            delete('comments', $id);
            echo json_encode(['message' => 'Record deleted']);
        }
        break;

    default:
        echo json_encode(['message' => 'Invalid request method']);
        break;
}
