<?php require_once 'conexion.php'; ?>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Empleados Cards</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
  <h2>Empleados Activos</h2>
  <div class="row">
    <?php
    $stmt = $pdo->query("SELECT * FROM empleados WHERE status = 'activo'");
    foreach ($stmt as $emp) {
        echo "
        <div class='col-md-4 mb-4'>
          <div class='card'>
            <div class='card-body'>
              <h5 class='card-title'>{$emp['nombre']}</h5>
              <p class='card-text'>
                Puesto: {$emp['puesto']}<br>
                Edad: {$emp['edad']}<br>
                Salario: \${$emp['salario']}
              </p>
              <span class='badge bg-success'>Activo</span>
            </div>
          </div>
        </div>";
    }
    ?>
  </div>
</div>
</body>
</html>