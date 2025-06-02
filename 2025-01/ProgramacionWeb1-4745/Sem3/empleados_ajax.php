<?php require_once 'conexion.php'; ?>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>AJAX Detalle</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
  <h2>Seleccionar empleado (AJAX)</h2>
  <table class="table table-hover" id="tablaAjax">
    <thead class="table-dark">
      <tr><th>ID</th><th>Nombre</th><th>Puesto</th></tr>
    </thead>
    <tbody>
      <?php
      $stmt = $pdo->query("SELECT id, nombre, puesto FROM empleados");
      foreach ($stmt as $row) {
          echo "<tr data-id='{$row['id']}'><td>{$row['id']}</td><td>{$row['nombre']}</td><td>{$row['puesto']}</td></tr>";
      }
      ?>
    </tbody>
  </table>

  <div id="detalle" class="mt-4" style="display:none;">
    <h4>Detalle:</h4>
    <ul class="list-group">
      <li class="list-group-item"><strong>Nombre:</strong> <span id="dNombre"></span></li>
      <li class="list-group-item"><strong>Edad:</strong> <span id="dEdad"></span></li>
      <li class="list-group-item"><strong>Puesto:</strong> <span id="dPuesto"></span></li>
      <li class="list-group-item"><strong>Salario:</strong> $<span id="dSalario"></span></li>
      <li class="list-group-item"><strong>Status:</strong> <span id="dStatus"></span></li>
    </ul>
  </div>
</div>

<script>
document.querySelectorAll("#tablaAjax tbody tr").forEach(fila => {
  fila.addEventListener("click", () => {
    const id = fila.dataset.id;
    fetch("get_empleado.php?id=" + id)
      .then(response => response.json())
      .then(data => {
        document.getElementById("dNombre").textContent = data.nombre;
        document.getElementById("dEdad").textContent = data.edad;
        document.getElementById("dPuesto").textContent = data.puesto;
        document.getElementById("dSalario").textContent = data.salario;
        document.getElementById("dStatus").textContent = data.status;
        document.getElementById("detalle").style.display = 'block';
      });
  });
});
</script>
</body>
</html>