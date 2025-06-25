<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $num1 = $_POST['numero1'] ?? 0;
    $num2 = $_POST['numero2'] ?? 0;
    $suma = $num1 + $num2;

    echo json_encode([
        'numero1' => $num1,
        'numero2' => $num2,
        'resultado' => $suma
    ]);
} else {
    echo json_encode(['error' => 'Método no permitido']);
}