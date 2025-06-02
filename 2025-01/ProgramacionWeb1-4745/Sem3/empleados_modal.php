<?php require_once 'conexion.php'; ?>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Detalles en Modal</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">
  <h2>Empleados</h2>
  <table class="table table-bordered">
    <thead class="table-dark"><tr><th>Nombre</th><th>Puesto</th><th>Ver</th></tr></thead>
    <tbody>
      <?php
      $stmt = $pdo->query("SELECT * FROM empleados");
      foreach ($stmt as $e) {
          echo "<tr>
                  <td>{$e['nombre']}</td>
                  <td>{$e['puesto']}</td>
                  <td><button class='btn btn-info btn-sm' onclick='verDetalle({$e['id']})' data-bs-toggle='modal' data-bs-target='#modalDetalle'>Ver</button></td>
                </tr>";
      }
      ?>
    </tbody>
  </table>

  <!-- Modal Bootstrap -->
  <div class="modal fade" id="modalDetalle" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Detalle del Empleado</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
        </div>
        <div class="modal-body">
          <p><strong>Nombre:</strong> <span id="modalNombre"></span></p>
          <p><strong>Edad:</strong> <span id="modalEdad"></span></p>
          <p><strong>Puesto:</strong> <span id="modalPuesto"></span></p>
          <p><strong>Salario:</strong> $<span id="modalSalario"></span></p>
          <p><strong>Status:</strong> <span id="modalStatus"></span></p>
        </div>
      </div>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    function verDetalle(id) {
      fetch(`get_empleado.php?id=${id}`)
        .then(res => res.json())
        .then(emp => {
          document.getElementById('modalNombre').textContent = emp.nombre;
          document.getElementById('modalEdad').textContent = emp.edad;
          document.getElementById('modalPuesto').textContent = emp.puesto;
          document.getElementById('modalSalario').textContent = emp.salario;
          document.getElementById('modalStatus').textContent = emp.status;
        });
    }
  </script>
</body>
</html>