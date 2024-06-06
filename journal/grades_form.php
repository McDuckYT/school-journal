<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Оценки по математике</title>
    <link rel="stylesheet" href="css/styles.css"> <!-- Подключаем файл стилей из папки css -->
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
    echo '<form method="post" action="save_grades">'; // Форма отправляет данные на save_grades.php
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
            echo '<td class="fixed-column">' . $student_name . '</td>';

            $total_grades = 0;
            $grades_count = 0;

            // Добавляем поля для ввода оценок для каждого дня в текущем месяце
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

                // Добавляем класс в зависимости от значения оценки
                $grade_class = '';
                switch ($existing_grade) {
                    case '5':
                        $grade_class = 'lime-grade'; // Зеленый цвет для оценки 5
                        break;
                    case '4':
                        $grade_class = 'green-grade'; // Зеленый цвет для оценки 4
                        break;
                    case '3':
                        $grade_class = 'orange-grade'; // Оранжевый цвет для оценки 3
                        break;
                    case '2':
                        $grade_class = 'red-grade'; // Красный цвет для оценки 2
                        break;
                    default:
                        $grade_class = '';
                        break;
                }

                // Добавляем класс к ячейке в зависимости от оценки
                $cell_class = 'grade-cell ' . $grade_class;

                echo '<td class="' . $cell_class . '">';
                echo '<input type="number" name="grades[' . $student_id . '][' . $formatted_day . ']" value="' . $existing_grade . '" placeholder="" min="1" max="5" class="no-border">';
                echo '</td>';
            }

            // Выводим средний балл студента за месяц
            $average_grade = ($grades_count > 0) ? round($total_grades / $grades_count, 2) : '-';
            echo '<td>' . $average_grade . '</td>';

            echo '</tr>';
            $counter++;
        }

        // Добавляем кнопку сохранения оценок
        echo '<button type="submit">Сохранить оценки</button>'; // Кнопка для сохранения оценок
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
