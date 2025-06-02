<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Lista de Empleados</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
  <div class="container mt-5">
    <h2 class="mb-4">Empleados</h2>
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
        try {
            $pdo = new PDO("mysql:host=localhost;dbname=empresa", "root", "");
            // SELECT * FROM empleados WHERE puesto IN ('Programador', 'Analista');
            // SELECT * FROM empleados WHERE nombre LIKE 'L%';
            // SELECT * FROM empleados WHERE edad BETWEEN 30 AND 40;
            $stmt = $pdo->query("SELECT * FROM empleados WHERE status != 'inactivo'");

            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                echo "<tr>";
                echo "<td>{$row['id']}</td>";
                echo "<td>{$row['nombre']}</td>";
                echo "<td>{$row['edad']}</td>";
                echo "<td>{$row['puesto']}</td>";
                echo "<td>\${$row['salario']}</td>";
                echo "<td>{$row['status']}</td>";
                echo "</tr>";
            }
        } catch (PDOException $e) {
            echo "<tr><td colspan='6'>Error: " . $e->getMessage() . "</td></tr>";
        }
        ?>
      </tbody>
    </table>
  </div>
</body>
</html>