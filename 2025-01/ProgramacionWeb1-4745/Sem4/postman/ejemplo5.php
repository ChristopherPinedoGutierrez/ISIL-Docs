<?php
header('Content-Type: application/json');

$nombre = $_POST['nombre'] ?? '';
$email = $_POST['email'] ?? '';
$mensaje = $_POST['mensaje'] ?? '';

if (!$nombre || !$email || !$mensaje) {
    http_response_code(400);
    echo json_encode(['error' => 'Todos los campos son obligatorios.']);
    exit;
}

if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    echo json_encode(['error' => 'El correo no es válido.']);
    exit;
}

echo json_encode([
    'status' => 'ok',
    'mensaje' => 'Gracias por tu mensaje: '.$mensaje.', gracias: ' . $nombre
]);