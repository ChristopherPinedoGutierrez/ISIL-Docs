<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Verificar si los campos existen
    if (isset($_POST['name']) && isset($_POST['email']) && isset($_POST['age']) 
    && isset($_POST['gender']) && isset($_POST['message'])) {
        $name = htmlspecialchars($_POST['name']);
        $email = htmlspecialchars($_POST['email']);
        $age = htmlspecialchars($_POST['age']);
        $gender = htmlspecialchars($_POST['gender']);
        $message = htmlspecialchars($_POST['message']);
        
        // Verificar si los checkboxes fueron marcados
        $newsletter = isset($_POST['newsletter']) ? "Sí" : "No";
        $updates = isset($_POST['updates']) ? "Sí" : "No";

        echo "<div class='container mt-5'>";
        echo "<h3>Datos Recibidos (Método POST):</h3>";
        echo "<p><strong>Nombre:</strong> $name</p>";
        echo "<p><strong>Correo Electrónico:</strong> $email</p>";
        echo "<p><strong>Edad:</strong> $age</p>";
        echo "<p><strong>Género:</strong> $gender</p>";
        echo "<p><strong>Mensaje:</strong> $message</p>";
        echo "<p><strong>Suscripción al boletín:</strong> $newsletter</p>";
        echo "<p><strong>Actualizaciones:</strong> $updates</p>";
        echo "</div>";
    } else {
        echo "<div class='container mt-5'><p>Por favor, completa todos los campos del formulario.</p></div>";
    }
} else {
    echo "<div class='container mt-5'><p>Acceso no permitido.</p></div>";
}
?>