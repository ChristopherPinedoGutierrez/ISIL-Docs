<?php
header('Content-Type: application/json');
require '../db.php';

$nombre = trim($_POST['nombre'] ?? '');
$ciudad = $_POST['ciudad'] ?? '';
$sexo = $_POST['sexo'] ?? '';

$pdo = getPDO();

$sql = "SELECT u.id, u.nombre, u.edad, u.ciudad, u.sexo, u.email, u.telefono, u.fecha_registro, u.activo,
               d.nombre AS departamento, d.ubicacion, d.presupuesto_anual,
               r.nombre AS rol, r.nivel_acceso, r.descripcion
        FROM usuarios u
        INNER JOIN departamentos d ON u.departamento_id = d.id
        INNER JOIN roles r ON u.rol_id = r.id
        WHERE 1=1";

$params = [];

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

$stmt = $pdo->prepare($sql);
$stmt->execute($params);

$resultados = $stmt->fetchAll();

echo json_encode($resultados);
?>