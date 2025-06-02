<?php
require_once 'conexion.php';

$q = $_GET['q'] ?? '';
$stmt = $pdo->prepare("SELECT * FROM empleados WHERE nombre LIKE ?");
$stmt->execute(["%$q%"]);

foreach ($stmt as $emp) {
    echo "
    <div class='col-md-4 mb-3'>
      <div class='card'>
        <div class='card-body'>
          <h5 class='card-title'>{$emp['nombre']}</h5>
          <p class='card-text'>Puesto: {$emp['puesto']}<br>Salario: \${$emp['salario']}</p>
        </div>
      </div>
    </div>";
}