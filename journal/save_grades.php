<?php
// Подключение к базе данных
require_once('db_connect.php');

// Обработка отправленных оценок
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['grades'])) {
    $grades = $_POST['grades'];

    try {
        // Начало транзакции
        $conn->begin_transaction();

        // Перебор оценок для каждого студента и даты
        foreach ($grades as $student_id => $grade_list) {
            foreach ($grade_list as $formatted_day => $grade) {
                // Преобразование в целое число
                $grade = intval($grade);

                // Подготовка данных для запроса
                $student_id_safe = $conn->real_escape_string($student_id);
                $formatted_date = '2024-04-' . sprintf("%02d", $formatted_day);

                // Проверка диапазона оценки
                if ($grade >= 1 && $grade <= 5) {
                    // Проверка существования записи
                    $check_sql = "SELECT * FROM grades_math WHERE student_id = '$student_id_safe' AND date = '$formatted_date'";
                    $check_result = $conn->query($check_sql);

                    if ($check_result->num_rows > 0) {
                        // Обновление существующей записи
                        $update_sql = "UPDATE grades_math SET grade = $grade WHERE student_id = '$student_id_safe' AND date = '$formatted_date'";
                        $conn->query($update_sql);
                    } else {
                        // Вставка новой записи
                        $insert_sql = "INSERT INTO grades_math (student_id, date, grade) VALUES ('$student_id_safe', '$formatted_date', $grade)";
                        $conn->query($insert_sql);
                    }
                }
            }
        }

        // Фиксация транзакции
        $conn->commit();
        echo "Оценки успешно сохранены. ";

        // Перенаправление на страницу grades_form.php после сохранения оценок
        header("Location: grades_form");
        exit(); // Важно завершить выполнение скрипта после перенаправления
    } catch (Exception $e) {
        // Ошибка, откат транзакции
        $conn->rollback();
        echo "Ошибка при сохранении оценок: " . $e->getMessage();
    }
}

// Закрытие соединения с базой данных
$conn->close();
?>
