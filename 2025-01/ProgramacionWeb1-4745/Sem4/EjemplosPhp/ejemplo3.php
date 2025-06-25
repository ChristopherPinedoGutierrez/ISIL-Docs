<?php
if (isset($_GET['name']) && isset($_GET['email']) && isset($_GET['age']) && isset($_GET['gender'])
 && isset($_GET['message'])) {
    $name = htmlspecialchars($_GET['name']);
    $email = htmlspecialchars($_GET['email']);
    $age = htmlspecialchars($_GET['age']);
    $gender = htmlspecialchars($_GET['gender']);
    $message = htmlspecialchars($_GET['message']);

    echo "<div class='container mt-5'>";
    echo "<h3>Datos Recibidos (Método GET):</h3>";
    echo "<p><strong>Nombre:</strong> $name</p>";
    echo "<p><strong>Correo Electrónico:</strong> $email</p>";
    echo "<p><strong>Edad:</strong> $age</p>";
    echo "<p><strong>Género:</strong> $gender</p>";
    echo "<p><strong>Mensaje:</strong> $message</p>";
    echo "</div>";
} else {
    echo "<div class='container mt-5'><p>Por favor, completa todos los campos del formulario.</p></div>";
}
?>