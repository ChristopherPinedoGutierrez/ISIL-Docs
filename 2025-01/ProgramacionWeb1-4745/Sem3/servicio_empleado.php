<?php
require_once 'conexion.php';

$id = $_GET['id'] ?? 1;

$stmt = $pdo->prepare("SELECT * FROM empleados WHERE id = ?");
$stmt->execute([$id]);
$empleado = $stmt->fetch();

if ($empleado) {
    echo json_encode($empleado);
} else {
    echo json_encode(['error' => 'Empleado no encontrado']);
}