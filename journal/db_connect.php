<?php
// Параметры подключения к базе данных
$servername = "localhost";
$username = "mcduckuz_user";
$password = "zLylR;3M8vzc";
$dbname = "mcduckuz_db";

// Создание подключения к базе данных
$conn = new mysqli($servername, $username, $password, $dbname);

// Проверка соединения
if ($conn->connect_error) {
    die("Ошибка подключения к базе данных: " . $conn->connect_error);
}
?>
