<?php
$host = 'localhost';
$db = 'libreria';
$user = 'root';
$pass = '';
$charset = 'utf8';

$options = [
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
];

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db;charset=$charset", $user, $pass, $options);
    echo "Conexion exitosa";
} catch (PDOException $e) {
    exit("Error de conexión: " . $e->getMessage());
    echo "Error en el conexion";
}
?>
