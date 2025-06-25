<?php

if($_SERVER["REQUEST_METHOD"]== "POST"){
    // verificamos si los campos son enviados
    if(isset($_POST['name']) && isset($_POST['age'])){
    $name = htmlspecialchars($_POST['name']); // evitar inyecciones de codigo
    $age = htmlspecialchars($_POST['age']); // limpiar el input

    echo "<div class='container mt-5'>";
    echo "<h3> Datos recibidos (Metodo GET):</h3>";
    echo "<p><strong> Nombre: </strong> $name</p>";
    echo "<p><strong> Edad: </strong> $age</p>";
    echo "</div>";
    }else{
        echo "<div clas='container mt-5'> Por favor, completa el formulario</div>";
    }

}else{
    echo "<div class='container mt-5'><p>Acceso no permitido</p></div>";
}

?>