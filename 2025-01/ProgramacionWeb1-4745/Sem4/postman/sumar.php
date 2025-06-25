<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $a = $_POST['a'] ?? 0;
    $b = $_POST['b'] ?? 0;
    $resultado = $a + $b;
    echo json_encode([
        'a' => $a,
        'b' => $b,
        'resultado' => $resultado
    ]);
}