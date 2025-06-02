<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Empleados Activos</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
  <div class="container mt-5">
    <h2 class="mb-4">Lista de Empleados Activos</h2>
    <table class="table table-striped table-bordered">
      <thead class="table-dark">
        <tr>
          <th>ID</th>
          <th>Nombre</th>
          <th>Edad</th>
          <th>Puesto</th>
          <th>Salario</th>
          <th>Status</th>
        </tr>
      </thead>
      <tbody>
        <?php
        require_once 'conexion.php';

        $stmt = $pdo->query("SELECT * FROM empleados WHERE status = 'activo'");

        foreach ($stmt as $row) {
            echo "<tr>";
            echo "<td>{$row['id']}</td>";
            echo "<td>{$row['nombre']}</td>";
            echo "<td>{$row['edad']}</td>";
            echo "<td>{$row['puesto']}</td>";
            echo "<td>\${$row['salario']}</td>";
            echo "<td>{$row['status']}</td>";
            echo "</tr>";
        }
        ?>
      </tbody>
    </table>
  </div>
</body>
</html>