<?php
// Подключение к базе данных
require_once('db_connect.php');

$user = $_SERVER['PHP_AUTH_USER'];
$pass = $_SERVER['PHP_AUTH_PW'];

// Поиск пользователя в базе данных по логину и группе
$sql = "SELECT * FROM `users` WHERE `group` IN ('1vtn1', '1vtn2') AND `id` = ?";
$stmt = $conn->prepare($sql);

if (!$stmt) {
    header('HTTP/1.0 500 Internal Server Error');
    die("Database error: " . $conn->error);
}

$stmt->bind_param("s", $user);
$stmt->execute();
$result = $stmt->get_result();

if (!$result) {
    header('HTTP/1.0 500 Internal Server Error');
    die("Database error: " . $conn->error);
}

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $stored_password = $row['password']; // Получаем хэшированный пароль из базы данных

    // Добавим отладочный вывод для отладки
    echo "User: $user<br>";
    echo "Input Password: $pass<br>";
    echo "Stored Password: $stored_password<br>";

    // Проверка хэшированных паролей
    if (sha1($pass) === $stored_password) {
        $group = $row['group'];
        // Аутентификация успешна, осуществляем перенаправление на соответствующую страницу
        header("Location: grades_form_$group.php");
        exit();
    } else {
        // Неверный пароль
        header('WWW-Authenticate: Basic realm="My Realm"');
        header('HTTP/1.0 401 Unauthorized');
        die("Not authorized");
    }
} else {
    // Пользователь не найден
    header('WWW-Authenticate: Basic realm="My Realm"');
    header('HTTP/1.0 401 Unauthorized');
    die("Not authorized");
}

// Закрываем соединение с базой данных
$stmt->close();
$conn->close();
?>
