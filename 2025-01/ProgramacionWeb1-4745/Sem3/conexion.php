<?php
$host = 'localhost';
$db   = 'empresa';
$user = 'root';
$pass = ''; // Cambia si tu MySQL tiene contraseña
$charset = 'utf8';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";

$options = [

    // :: Operador de ámbito  Para acceder a constantes y métodos estáticos de una clase
    // =>  Clave flecha valor  Para definir pares clave → valor en arrays asociativos
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
];

try {
    $pdo = new PDO($dsn, $user, $pass, $options);
} catch (PDOException $e) {
    echo "Error de conexión: " . $e->getMessage();
    exit;
}
?>