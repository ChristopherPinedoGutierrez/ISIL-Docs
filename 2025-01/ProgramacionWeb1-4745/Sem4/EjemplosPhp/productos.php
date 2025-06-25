<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $producto = $_POST['producto'] ?? '';
    $cantidad = $_POST['cantidad'] ?? 1;

    $precios = [
        'Camisa' => 20,
        'Pantalón' => 35,
        'Zapatos' => 50
    ];

    $precio = $precios[$producto] ?? 0;
    $total = $precio * $cantidad;

    echo json_encode([
        'producto' => $producto,
        'cantidad' => $cantidad,
        'total' => $total
    ]);
}