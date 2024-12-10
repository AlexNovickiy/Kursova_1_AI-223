<?php
// контроллер
include_once SITE_ROOT . "/app/database/db.php";
$commentsForAdm = selectAll('comments');

$page = isset($_GET['post']) ? $_GET['post'] : ''; // Призначити значення по замовчуванню, якщо параметр відсутній
$errMsg = [];
$status = 0;
$comments = [];


// Код для створення коментарів
if($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['goComment'])){


    $email = trim($_POST['email']);
    $comment = trim($_POST['comment']);


    if($email === '' || $comment === ''){
        $errMsg[] = "Не всі поля заповнені!";
    }elseif (mb_strlen($comment, 'UTF8') < 10){
        $errMsg[] = "Коментар повинен бути довше 50 символів";
    }else{
        $user = selectOne('users', ['email' => $email]);
        if ($user['email'] == $email && $user['admin'] == 1){
            $status = 1;
        }

        $comment = [
            'status' => $status,
            'page' => $page,
            'email' => $email,
            'comment' => $comment
        ];

        $comment = insert('comments', $comment);
        $comments = selectAll('comments', ['page' => $page, 'status' => 1] );

    }
}else{
    $email = '';
    $comment = '';
    $comments = selectAll('comments', ['page' => $page, 'status' => 1] );

}
// Видалення коментаря
if($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['delete_id'])){
    $id = $_GET['delete_id'];
    delete('comments', $id);
    header('location: ' . BASE_URL . 'admin/comments/index.php');
}

// Статус опублікувати чи зняти з публікації
if($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['pub_id'])){
    $id = $_GET['pub_id'];
    $publish = $_GET['publish'];

    update('comments', $id, ['status' => $publish]); // Оновлюємо статус коментаря

    header('location: ' . BASE_URL . 'admin/comments/index.php');
    exit();
}


// АПДЕЙТ СТАТТІ
if($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['id'])){
    $oneComment = selectOne('comments', ['id' => $_GET['id']]);
    $id =  $oneComment['id'];
    $email =  $oneComment['email'];
    $text1 = $oneComment['comment'];
    $pub = $oneComment['status'];
}


if($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['edit_comment'])){
    $id =  $_POST['id'];
    $text = trim($_POST['content']);
    $publish = isset($_POST['publish']) ? 1 : 0;

    if($text === ''){
        $errMsg[] = "Коментар не має вмісту тексту";
    }elseif (mb_strlen($text, 'UTF8') < 50){
        $errMsg[] = "Кількість символів всередині коментаря менше 50";
    }else{
        $com = [
            'comment' => $text,
            'status' => $publish
        ];

        update('comments', $id, $com); // Оновлюємо коментар в базі
        header('location: ' . BASE_URL . 'admin/comments/index.php');
    }
}else{
    if (isset($_POST['content'])) {
        $text = trim($_POST['content']);
    } else {
        $text = '';
    }

    if (isset($_POST['publish'])) {
        $publish = 1;
    } else {
        $publish = 0;
    }
}

function getCommentsByPostId($postId) {
    global $pdo; // Використовуємо $pdo для підключення до бази даних
    $stmt = $pdo->prepare("SELECT * FROM comments WHERE page = ? ORDER BY created_date DESC");
    $stmt->execute([$postId]);
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}


