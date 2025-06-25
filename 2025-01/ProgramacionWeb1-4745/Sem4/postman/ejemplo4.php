<?php
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(['error' => 'Método no permitido']);
    exit;
}

$nombre = trim($_POST['nombre'] ?? '');
$email = trim($_POST['email'] ?? '');
$password = $_POST['password'] ?? '';

$errores = [];

if ($nombre === '') $errores[] = 'El nombre es obligatorio.';
//filter_var: Filtra (valida o limpia) una variable usando un filtro específico.
if (!filter_var($email, FILTER_VALIDATE_EMAIL)) $errores[] = 'Correo inválido.';
if (strlen($password) < 6) $errores[] = 'La contraseña debe tener al menos 6 caracteres.';

if ($errores) {
    http_response_code(400);
    echo json_encode(['errores' => $errores]);
} else {
    echo json_encode([
        'status' => 'ok',
        'mensaje' => 'Registro exitoso',
        'usuario' => [
            'nombre' => $nombre,
            'email' => $email
        ]
    ]);
}