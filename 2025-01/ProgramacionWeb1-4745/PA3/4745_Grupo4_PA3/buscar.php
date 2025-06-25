<?php
$conexion = new mysqli("localhost", "root", "", "libreria");
if ($conexion->connect_error) {
  die("Error de conexión: " . $conexion->connect_error);
}

function limpiar($dato, $conexion) {
  return $conexion->real_escape_string(trim($dato));
}

// Recibir parámetros
$categoria = limpiar($_POST['id_categoria'] ?? '', $conexion);
$autor = limpiar($_POST['autor'] ?? '', $conexion);
$titulo = limpiar($_POST['titulo'] ?? '', $conexion);
$stock = limpiar($_POST['stock'] ?? '', $conexion);
$fecha_inicio = limpiar($_POST['fecha_inicio'] ?? '', $conexion);
$fecha_fin = limpiar($_POST['fecha_fin'] ?? '', $conexion);
$precio_min = limpiar($_POST['precio_min'] ?? '', $conexion);
$precio_max = limpiar($_POST['precio_max'] ?? '', $conexion);
$columna = limpiar($_POST['columna'] ?? 'titulo', $conexion);
$orden = limpiar($_POST['orden'] ?? 'ASC', $conexion);
$pagina = intval($_POST['pagina'] ?? 1);
$por_pagina = 5;
$inicio = ($pagina - 1) * $por_pagina;

// WHERE
$where = "1";
if ($categoria != '') $where .= " AND libros.id_categoria = '$categoria'";
if ($autor != '') $where .= " AND libros.autor LIKE '%$autor%'";
if ($titulo != '') $where .= " AND libros.titulo LIKE '%$titulo%'";
if ($stock != '') $where .= " AND libros.stock >= '$stock'";
if ($fecha_inicio != '') $where .= " AND libros.fecha_publicacion >= '$fecha_inicio'";
if ($fecha_fin != '') $where .= " AND libros.fecha_publicacion <= '$fecha_fin'";
if ($precio_min != '') $where .= " AND libros.precio >= '$precio_min'";
if ($precio_max != '') $where .= " AND libros.precio <= '$precio_max'";

// Conteo
$total_sql = "SELECT COUNT(*) as total FROM libros WHERE $where";
$total_result = $conexion->query($total_sql);
$total = $total_result->fetch_assoc()['total'];
$paginas_totales = ceil($total / $por_pagina);

// Consulta
$sql = "SELECT libros.*, categorias.nombre as categoria 
        FROM libros 
        LEFT JOIN categorias ON libros.id_categoria = categorias.id_categoria
        WHERE $where 
        ORDER BY $columna $orden 
        LIMIT $inicio, $por_pagina";
$resultado = $conexion->query($sql);

// Tabla
echo "<table class='table table-striped'>";
echo "<thead><tr>
<th onclick=\"cambiarOrden('titulo')\">Título</th>
<th onclick=\"cambiarOrden('autor')\">Autor</th>
<th onclick=\"cambiarOrden('fecha_publicacion')\">Fecha</th>
<th>Categoría</th>
<th onclick=\"cambiarOrden('precio')\">Precio</th>
<th onclick=\"cambiarOrden('stock')\">Stock</th>
</tr></thead><tbody>";

if ($resultado->num_rows > 0) {
  while ($fila = $resultado->fetch_assoc()) {
    echo "<tr>
      <td>{$fila['titulo']}</td>
      <td>{$fila['autor']}</td>
      <td>{$fila['fecha_publicacion']}</td>
      <td>{$fila['categoria']}</td>
      <td>S/. {$fila['precio']}</td>
      <td>{$fila['stock']}</td>
    </tr>";
  }
} else {
  echo "<tr><td colspan='6'>No se encontraron resultados</td></tr>";
}
echo "</tbody></table>";

// Paginación
echo "<nav><ul class='pagination'>";
for ($i = 1; $i <= $paginas_totales; $i++) {
  $active = ($i == $pagina) ? "active" : "";
  echo "<li class='page-item $active'><a class='page-link' href='#' onclick='cambiarPagina($i)'>$i</a></li>";
}
echo "</ul></nav>";

$conexion->close();
?>

