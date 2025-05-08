<?php
// Parámetros de conexión
$host = "localhost";
$dbname = "pa1_db";
$username = "root";
$password = "";
$dsn = "mysql:host=$host;dbname=$dbname;charset=utf8";

try {
    // Crear conexión PDO
    $pdo = new PDO($dsn, $username, $password);
    // Establecer el modo de errores para excepciones
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $toast_mensaje = "Conexión exitosa a la base de datos '$dbname'";
    $toast_tipo_mensaje = "success"; // para usar en el toast
} catch (PDOException $e) {
    // Capturar errores de conexión
    $toast_mensaje = "Error en la conexión: " . $e->getMessage();
    $toast_tipo_mensaje = "danger";
}
?>
