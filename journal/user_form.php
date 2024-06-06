<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Оценки по математике</title>
    <link rel="stylesheet" href="css/styles.css"> <!-- Подключаем основной файл стилей -->
    <link rel="stylesheet" href="css/user_style.css"> <!-- Подключаем пользовательский файл стилей -->
</head>
<body>
    <h1>Таблица Оценок по математике</h1>

    <?php
    // Подключение к базе данных
    require_once('db_connect.php');

    // Получение количества дней в текущем месяце
    $days_in_month = date('t'); // 't' возвращает количество дней в текущем месяце

    // SQL запрос для выбора имен из группы '1vtn1'
    $sql = "SELECT `id`, `name` FROM `users` WHERE `group` = '1vtn1'";
    $result = $conn->query($sql);

    // Строим таблицу HTML для отображения имен и оценок
    echo '<form method="post" action="save_student_grades.php">'; // Форма отправляет данные на save_student_grades.php
    echo '<table>';

    // Добавляем столбцы для каждого дня в текущем месяце
    echo '<tr><th>№</th><th class="fixed-column">Фамилия Имя</th>'; // Заголовки столбцов для номера и имени
    for ($day = 1; $day <= $days_in_month; $day++) {
        $formatted_day = sprintf("%02d", $day); // Форматируем день, чтобы иметь двузначное число
        echo '<th>' . $formatted_day . '</th>'; // Добавляем заголовок с номером дня
    }
    echo '<th>Средний балл</th></tr>'; // Заголовок для столбца со средним баллом

    if ($result->num_rows > 0) {
        $counter = 1;
        while ($row = $result->fetch_assoc()) {
            $student_id = $row['id'];
            $student_name = $row['name'];
            $row_class = ($counter % 2 == 0) ? 'grey-row' : 'white-row'; // Определяем класс строки для чередования цвета фона

            echo '<tr class="' . $row_class . '">';
            echo '<td>' . $counter . '</td>';
            echo '<td class="fixed-column"><a href="student.php?student_id=' . $student_id . '">' . $student_name . '</a></td>';

            $total_grades = 0;
            $grades_count = 0;

            // Добавляем поля для отображения оценок для каждого дня в текущем месяце
            for ($day = 1; $day <= $days_in_month; $day++) {
                $formatted_day = sprintf("%02d", $day); // Форматируем день, чтобы иметь двузначное число

                // Получаем оценку студента за конкретный день (если есть)
                $formatted_date = '2024-04-' . $formatted_day;
                $grade_sql = "SELECT `grade` FROM `grades_math` WHERE `student_id` = '$student_id' AND `date` = '$formatted_date'";
                $grade_result = $conn->query($grade_sql);

                $existing_grade = '';
                if ($grade_result->num_rows > 0) {
                    $existing_row = $grade_result->fetch_assoc();
                    $existing_grade = $existing_row['grade'];
                    $total_grades += intval($existing_grade);
                    $grades_count++;
                }

                // Определяем класс ячейки в зависимости от значения оценки
                $cellClass = '';
                switch ($existing_grade) {
                    case '5':
                        $cellClass = 'lime';
                        break;
                    case '4':
                        $cellClass = 'green';
                        break;
                    case '3':
                        $cellClass = 'orange';
                        break;
                    case '2':
                        $cellClass = 'red';
                        break;
                    case '1':
                        $cellClass = 'black';
                        break;
                    default:
                        $cellClass = '';
                        break;
                }

                echo '<td class="' . $cellClass . '">' . $existing_grade . '</td>';
            }

            // Выводим средний балл студента за месяц
            $average_grade = ($grades_count > 0) ? round($total_grades / $grades_count, 2) : '-';
            echo '<td>' . $average_grade . '</td>';

            echo '</tr>';
            $counter++;
        }

    } else {
        echo '<tr><td colspan="' . ($days_in_month + 2) . '">Нет данных для отображения</td></tr>';
    }

    echo '</table>';
    echo '</form>';

    // Закрытие соединения с базой данных
    $conn->close();
    ?>
</body>
</html>
