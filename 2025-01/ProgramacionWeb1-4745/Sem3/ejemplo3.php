<?php require_once 'conexion.php'; ?>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Empleados - Tabla Maestra</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    tr:hover { cursor: pointer; background-color: #f0f0f0; }
  </style>
</head>
<body>
<div class="container mt-5">
  <h2>Tabla Maestra de Empleados</h2>
  <table class="table table-hover table-bordered" id="tablaEmpleados">
    <thead class="table-dark">
      <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>Puesto</th>
      </tr>
    </thead>
    <tbody>
      <?php
      $stmt = $pdo->query("SELECT * FROM empleados");
      foreach ($stmt as $row) {
          echo "<tr data-id='{$row['id']}' data-nombre='{$row['nombre']}' data-edad='{$row['edad']}' data-puesto='{$row['puesto']}' data-salario='{$row['salario']}' data-status='{$row['status']}'>";
          echo "<td>{$row['id']}</td>";
          echo "<td>{$row['nombre']}</td>";
          echo "<td>{$row['puesto']}</td>";
          echo "</tr>";
      }
      ?>
    </tbody>
  </table>

  <!-- Detalle al hacer clic -->
  <div id="detalleEmpleado" class="mt-4" style="display:none;">
    <h4>Detalle del Empleado Seleccionado</h4>
    <ul class="list-group">
      <li class="list-group-item"><strong>ID:</strong> <span id="detId"></span></li>
      <li class="list-group-item"><strong>Nombre:</strong> <span id="detNombre"></span></li>
      <li class="list-group-item"><strong>Edad:</strong> <span id="detEdad"></span></li>
      <li class="list-group-item"><strong>Puesto:</strong> <span id="detPuesto"></span></li>
      <li class="list-group-item"><strong>Salario:</strong> $<span id="detSalario"></span></li>
      <li class="list-group-item"><strong>Status:</strong> <span id="detStatus"></span></li>
    </ul>
  </div>
</div>

<script>
document.querySelectorAll("#tablaEmpleados tbody tr").forEach(fila => {
  fila.addEventListener("click", () => {
    // Obtener los atributos data- de la fila clicada
    document.getElementById("detId").innerText = fila.dataset.id;
    document.getElementById("detNombre").innerText = fila.dataset.nombre;
    document.getElementById("detEdad").innerText = fila.dataset.edad;
    document.getElementById("detPuesto").innerText = fila.dataset.puesto;
    document.getElementById("detSalario").innerText = fila.dataset.salario;
    document.getElementById("detStatus").innerText = fila.dataset.status;

    // Mostrar el bloque de detalles
    document.getElementById("detalleEmpleado").style.display = 'block';
  });
});
</script>
</body>
</html>