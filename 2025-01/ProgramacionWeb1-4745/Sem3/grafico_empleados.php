<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Gráfico de Empleados</title>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">
  <h2>Gráfico: Empleados y Salario por Puesto</h2>

  <canvas id="graficoPuestos" width="600" height="300"></canvas>

  <script>
    fetch('datos_empleados.php')
      .then(response => response.json())
      .then(data => {
        const ctx = document.getElementById('graficoPuestos').getContext('2d');
        new Chart(ctx, {
          type: 'bar',
          data: {
            labels: data.puestos,
            datasets: [
              {
                label: 'Cantidad de empleados',
                data: data.totales,
                backgroundColor: 'rgba(54, 162, 235, 0.5)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1,
                yAxisID: 'y1'
              },
              {
                label: 'Salario promedio',
                data: data.salarios,
                backgroundColor: 'rgba(255, 99, 132, 0.5)',
                borderColor: 'rgba(255, 99, 132, 1)',
                borderWidth: 1,
                yAxisID: 'y2'
              }
            ]
          },
          options: {
            responsive: true,
            scales: {
              y1: {
                type: 'linear',
                position: 'left',
                title: {
                  display: true,
                  text: 'Cantidad'
                },
                beginAtZero: true
              },
              y2: {
                type: 'linear',
                position: 'right',
                title: {
                  display: true,
                  text: 'Salario ($)'
                },
                beginAtZero: true,
                grid: {
                  drawOnChartArea: false
                }
              }
            }
          }
        });
      });
  </script>
</body>
</html>