document.addEventListener('DOMContentLoaded', function() {
    const gradeCells = document.querySelectorAll('table td:nth-child(2)');

    gradeCells.forEach(cell => {
        cell.addEventListener('click', () => {
            const newGrade = prompt('Введите новую оценку:');
            
            if (newGrade !== null && !isNaN(newGrade)) {
                cell.textContent = newGrade;
            } else {
                alert('Пожалуйста, введите корректную оценку.');
            }
        });
    });
});
