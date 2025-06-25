<?php
if(isset($_GET['name']) && isset($_GET['age'])){
 $name = htmlspecialchars($_GET['name']); // evitar inyecciones de codigo
 $age = htmlspecialchars($_GET['age']); // limpiar el input

 echo "<div class='container mt-5'>";
 echo "<h3> Datos recibidos (Metodo GET):</h3>";
 echo "<p><strong> Nombre: </strong> $name</p>";
 echo "<p><strong> Edad: </strong> $age</p>";
 echo "</div>";
}else{
    echo "<div clas='container mt-5'> Por favor, completa el formulario</div>";
}



?>