<?php
// servicio.php

// Verificamos que sea una petición POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Recibimos los datos
    $nombre = $_POST['nombre'] ?? '';
    $email = $_POST['email'] ?? '';

    // Devolvemos una respuesta en formato JSON
    echo json_encode([
        'mensaje' => 'Datos recibidos correctamente',
        'nombre' => $nombre,
        'email' => $email
    ]);
} else {
    echo json_encode(['error' => 'Método no permitido']);
}