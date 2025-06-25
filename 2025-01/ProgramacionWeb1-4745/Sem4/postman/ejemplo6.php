<?php
header('Content-Type: application/json');

$nombre = $_POST['nombre'] ?? '';
$fecha = $_POST['fecha'] ?? '';
$hora = $_POST['hora'] ?? '';
$motivo = $_POST['motivo'] ?? '';

$errores = [];

if (!$nombre) $errores[] = 'El nombre es obligatorio.';
if (!$fecha) $errores[] = 'Debe elegir una fecha.';
if (!$hora) $errores[] = 'Debe elegir una hora.';

if (!in_array($motivo, ['consulta', 'control', 'urgencia'])) {
    $errores[] = 'Motivo no válido.';
}

if ($errores) {
    http_response_code(400);
    echo json_encode(['errores' => $errores]);
    exit;
}

echo json_encode([
    'status' => 'ok',
    'mensaje' => "Cita registrada para $nombre el $fecha a las $hora por motivo de $motivo."
]);