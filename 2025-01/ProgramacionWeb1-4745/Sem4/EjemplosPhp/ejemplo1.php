<?php
if (isset($_GET['name']) && isset($_GET['age'])) {
    $name = htmlspecialchars($_GET['name']);  // Evita inyecciones de código
    $age = htmlspecialchars($_GET['age']);    // Limpia el input

    echo "<div class='container mt-5'>";
    echo "<h3>Datos Recibidos (Método GET):</h3>";
    echo "<p><strong>Nombre:</strong> $name</p>";
    echo "<p><strong>Edad:</strong> $age</p>";
    echo "</div>";
} else {
    echo "<div class='container mt-5'><p>Por favor, completa el formulario.</p></div>";
}
?>