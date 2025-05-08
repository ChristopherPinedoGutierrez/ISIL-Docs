<?php require_once "conexion.php"; ?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Conexión BD</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .toast-container {
            position: fixed;
            top: 1rem;
            right: 1rem;
            z-index: 1080;
        }
    </style>
</head>
<body>
    <div class="toast-container">
    <div class="toast align-items-center text-white bg-<?= $toast_tipo_mensaje ?> border-0 show" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="d-flex">
        <div class="toast-body">
            <?= $toast_mensaje ?>
        </div>
        <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
    </div>
    </div>

    <?php require_once 'mostrarTablas.php'; ?>

    <!-- Scripts de Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
