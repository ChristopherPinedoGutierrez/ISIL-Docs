<?php
header('Content-Type: application/json');
require '../db.php';

// Recibir parámetros por POST
$nombre = trim($_POST['nombre'] ?? '');
$ciudad = $_POST['ciudad'] ?? '';
$sexo = $_POST['sexo'] ?? '';

$pdo = getPDO();

if ($nombre != '') {
    $sql = "SELECT * FROM usuarios 
            WHERE nombre LIKE :nombre 
            AND (ciudad = :ciudad AND sexo = :sexo)";
    $params = [
        ':nombre' => "%$nombre%",
        ':ciudad' => $ciudad,
        ':sexo' => $sexo
    ];
} else {
    $sql = "SELECT * FROM usuarios 
            WHERE ciudad = :ciudad OR sexo = :sexo";
    $params = [
        ':ciudad' => $ciudad,
        ':sexo' => $sexo
    ];
}

$stmt = $pdo->prepare($sql);
$stmt->execute($params);

$resultados = $stmt->fetchAll();

echo json_encode($resultados);
?>