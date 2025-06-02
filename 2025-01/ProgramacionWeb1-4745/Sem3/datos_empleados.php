<?php
require_once 'conexion.php';

$stmt = $pdo->query("SELECT puesto, COUNT(*) as total, AVG(salario) as salario_promedio FROM empleados GROUP BY puesto");
$data = $stmt->fetchAll();

$puestos = [];
$totales = [];
$salarios = [];

foreach ($data as $row) {
    $puestos[] = $row['puesto'];
    $totales[] = $row['total'];
    $salarios[] = round($row['salario_promedio'], 2); // Redondear a 2 decimales
}

echo json_encode([
    'puestos' => $puestos,
    'totales' => $totales,
    'salarios' => $salarios
]);