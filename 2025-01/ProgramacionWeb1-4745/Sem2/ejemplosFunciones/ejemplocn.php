<?php
require_once 'conexion.php'; // Si guardaste la función en otro archivo
$conexion = conectar();
if ($conexion) {
    $consulta = $conexion->query("SELECT * FROM usuarios");
    $usuarios = $consulta->fetchAll(PDO::FETCH_ASSOC);

    foreach ($usuarios as $usuario) {
        echo $usuario['email'] . "<br>";
    }
}
?>