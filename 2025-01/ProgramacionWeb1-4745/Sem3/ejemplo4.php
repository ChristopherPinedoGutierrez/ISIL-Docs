<?php require_once 'conexion.php'; ?>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Filtrar por Puesto</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
  <h2>Filtrar empleados por puesto</h2>

  <!-- Select de puestos -->
  <form method="GET">
    <div class="mb-3">
      <label for="puesto" class="form-label">Selecciona un puesto:</label>
      <select name="puesto" id="puesto" class="form-select" onchange="this.form.submit()">
        <option value="">-- Todos --</option>
        <?php
        $puestos = $pdo->query("SELECT DISTINCT puesto FROM empleados")->fetchAll();
        foreach ($puestos as $p) {
            $selected = ($_GET['puesto'] ?? '') == $p['puesto'] ? 'selected' : '';
            echo "<option value='{$p['puesto']}' $selected>{$p['puesto']}</option>";
        }
        ?>
      </select>
    </div>
  </form>

  <!-- Tabla filtrada -->
  <table class="table table-striped">
    <thead class="table-dark">
      <tr><th>ID</th><th>Nombre</th><th>Puesto</th><th>Salario</th></tr>
    </thead>
    <tbody>
      <?php
      $filtro = $_GET['puesto'] ?? '';
      $query = $filtro ? $pdo->prepare("SELECT * FROM empleados WHERE puesto = ?") : $pdo->query("SELECT * FROM empleados");
      if ($filtro) {
          $query->execute([$filtro]);
      }
      $resultados = $filtro ? $query->fetchAll() : $query->fetchAll();

      foreach ($resultados as $e) {
          echo "<tr><td>{$e['id']}</td><td>{$e['nombre']}</td><td>{$e['puesto']}</td><td>\${$e['salario']}</td></tr>";
      }
      ?>
    </tbody>
  </table>
</div>
</body>
</html>