<?php
header('Content-Type: application/json');
require '../db.php';

$pdo = getPDO();

// Recibir parámetros (pueden ser opcionales)
$nombre = trim($_POST['nombre'] ?? '');
$ciudad = $_POST['ciudad'] ?? '';
$sexo = $_POST['sexo'] ?? '';
$departamento = $_POST['departamento'] ?? '';
$rol = $_POST['rol'] ?? '';

$sql = "SELECT u.id, u.nombre, u.edad, u.ciudad, u.sexo, u.email, u.telefono, 
               d.nombre AS departamento, r.nombre AS rol
        FROM usuarios u
        INNER JOIN departamentos d ON u.departamento_id = d.id
        INNER JOIN roles r ON u.rol_id = r.id
        WHERE 1=1";

$params = [];

// Añadir filtros dinámicos:
if ($nombre != '') {
    $sql .= " AND u.nombre LIKE :nombre";
    $params[':nombre'] = "%$nombre%";
}

if ($ciudad != '') {
    $sql .= " AND u.ciudad = :ciudad";
    $params[':ciudad'] = $ciudad;
}

if ($sexo != '') {
    $sql .= " AND u.sexo = :sexo";
    $params[':sexo'] = $sexo;
}

if ($departamento != '') {
    $sql .= " AND d.nombre = :departamento";
    $params[':departamento'] = $departamento;
}

if ($rol != '') {
    $sql .= " AND r.nombre = :rol";
    $params[':rol'] = $rol;
}

$stmt = $pdo->prepare($sql);
$stmt->execute($params);

$resultados = $stmt->fetchAll();

echo json_encode($resultados);
?>
