<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Verificamos si los campos fueron enviados
    if (isset($_POST['name']) && isset($_POST['age'])) {
        $name = htmlspecialchars($_POST['name']);  // Limpieza de datos
        $age = htmlspecialchars($_POST['age']);    // Limpieza de datos

        echo "<div class='container mt-5'>";
        echo "<h3>Datos Recibidos (Método POST):</h3>";
        echo "<p><strong>Nombre:</strong> $name</p>";
        echo "<p><strong>Edad:</strong> $age</p>";
        echo "</div>";
    } else {
        echo "<div class='container mt-5'><p>Por favor, completa el formulario.</p></div>";
    }
} else {
    echo "<div class='container mt-5'><p>Acceso no permitido.</p></div>";
}
?>