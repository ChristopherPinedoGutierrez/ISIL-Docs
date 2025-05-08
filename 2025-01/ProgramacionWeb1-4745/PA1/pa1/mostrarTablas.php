<?php
// Incluir conexión a la base de datos
require_once "conexion.php";

$encabezado = <<<HTML
    <nav class="navbar bg-secondary text-white">
        <div class="container-fluid">
            <div class='container mt-2 mb-2'>
                <h3> Christopher Pinedo | Programación web 1 - Proceso de aprendizaje 1</h2>
            </div>
        </div>
    </nav>
    <div class='container mt-5 mb-5'>
        <h3>Resultados de Consulta al Inventario de Componentes de PC</h2>
    </div>
HTML;

// Función auxiliar para imprimir una tabla Bootstrap
function mostrarTabla($titulo, $consulta, $pdo) {
    echo "<div class='container my-4'>";
    echo "<h4 class='mb-3'>$titulo</h4>";
    echo "<table class='table table-striped table-bordered'>";
    echo "<thead class='table-dark'><tr><th>ID</th><th>Nombre</th><th>Tipo</th><th>Marca</th><th>Precio</th><th>Stock</th></tr></thead>";
    echo "<tbody>";

    try {
        $stmt = $pdo->query($consulta);
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            echo "<tr>";
            echo "<td>{$row['id']}</td>";
            echo "<td>{$row['nombre']}</td>";
            echo "<td>{$row['tipo']}</td>";
            echo "<td>{$row['marca']}</td>";
            echo "<td>{$row['precio']}</td>";
            echo "<td>{$row['stock']}</td>";
            echo "</tr>";
        }
    } catch (PDOException $e) {
        echo "<tr><td colspan='6'>Error: " . $e->getMessage() . "</td></tr>";
    }

    echo "</tbody></table></div>";
}

echo $encabezado;

// 1. Mostrar todos los resultados sin operadores lógicos
mostrarTabla("1. Todos los componentes (sin operador lógico)", "SELECT * FROM componentes", $pdo);

// 2. Utilizando BETWEEN (precio entre 500 y 1000)
mostrarTabla("2. Componentes con precio entre 500 y 1000 (BETWEEN)", 
             "SELECT * FROM componentes WHERE precio BETWEEN 500 AND 1000", $pdo);

// 3. Utilizando LIKE en diferentes posiciones
mostrarTabla("3.1 LIKE - Nombre que empieza con 'R'", 
             "SELECT * FROM componentes WHERE nombre LIKE 'R%'", $pdo);

mostrarTabla("3.2. LIKE - Nombre que contiene '50'", 
             "SELECT * FROM componentes WHERE nombre LIKE '%50%'", $pdo);

mostrarTabla("3.3. LIKE - Nombre que termina en 'X'", 
             "SELECT * FROM componentes WHERE nombre LIKE '%X'", $pdo);

// 4. Utilizando >= (precio mayor o igual a 900)
mostrarTabla("4. Componentes con precio >= 900", 
             "SELECT * FROM componentes WHERE precio >= 900", $pdo);

// 5. Utilizando <= (precio menor o igual a 800)
mostrarTabla("5. Componentes con precio <= 800", 
             "SELECT * FROM componentes WHERE precio <= 800", $pdo);

// 6. Utilizando < (stock menor a 10)
mostrarTabla("6. Componentes con stock < 10", 
             "SELECT * FROM componentes WHERE stock < 10", $pdo);

// 7. Utilizando > (stock mayor a 15)
mostrarTabla("7. Componentes con stock > 15", 
             "SELECT * FROM componentes WHERE stock > 15", $pdo);
?>