<?php
function conectar() {
    $host = 'localhost';               // Servidor MySQL local
    $dbname = 'ejemplo1';      // ← Cambia esto por el nombre de tu base de datos
    $usuario = 'root';                 // Usuario por defecto en XAMPP
    $clave = '';                       // Contraseña vacía por defecto

    $dsn = "mysql:host=$host;dbname=$dbname;charset=utf8";

    try {
        $pdo = new PDO($dsn, $usuario, $clave);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
      //  echo "Conexión exitosa a la base de datos";
        return $pdo;
    } catch (PDOException $e) {
        echo "Error de conexión: " . $e->getMessage();
        return null;
    }
}

// funcion simple:
// se llama a la funcion
//conectar();
?>