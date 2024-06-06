<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Оценки ученика</title>
    <link rel="stylesheet" href="css/styles.css"> <!-- Подключаем файл стилей из папки css -->
</head>
<body>
    <h1>Оценки ученика</h1>

    <?php
    // Подключение к базе данных
    require_once('db_connect.php');

    // Получение идентификатора ученика из параметра URL
    $student_id = $_GET['student_id'];

    // SQL запрос для выбора имени ученика
    $name_sql = "SELECT `name` FROM `users` WHERE `id` = '$student_id'";
    $name_result = $conn->query($name_sql);
    $row = $name_result->fetch_assoc();
    $student_name = $row['name'];

    // SQL запрос для выбора оценок ученика
    $grades_sql = "SELECT `date`, `grade` FROM `grades_math` WHERE `student_id` = '$student_id'";
    $grades_result = $conn->query($grades_sql);

    // Проверка наличия оценок
    if ($grades_result->num_rows > 0) {
        // Строим таблицу для отображения оценок
        echo '<table>';
        echo '<tr><th>Дата</th><th>Оценка</th></tr>';
        while ($row = $grades_result->fetch_assoc()) {
            $date = $row['date'];
            $grade = $row['grade'];
            echo '<tr>';
            echo '<td>' . $date . '</td>';
            echo '<td>' . $grade . '</td>';
            echo '</tr>';
        }
        echo '</table>';
    } else {
        echo '<p>У ученика нет оценок по математике.</p>';
    }

    // Закрытие соединения с базой данных
    $conn->close();
    ?>

    <p><a href="index.php">Вернуться к списку учеников</a></p>
</body>
</html>
