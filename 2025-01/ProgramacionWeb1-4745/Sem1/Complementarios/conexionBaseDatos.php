<?php
function conectar($dbname) { 
    $dsn = "mysql:host=localhost;dbname=$dbname;charset=utf8";
    $username = "root";
    $password = "";

    try {

        $pdo = new PDO($dsn, $username, $password);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $pdo;
        echo "Conexion Exitosa";
        
    } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
        return null;
    }
}
?>