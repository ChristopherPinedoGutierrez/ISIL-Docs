<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de Productos</title>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" 
              crossorigin="anonymous">
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" 
              integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        
        <div class="container mt-5">
            <h3>Registro de producto</h3>

            <form action="http://localhost:8080/marte/admin/productos/add" method="post" autocomplete="off">
                <div class="form-group">
                    <label>Nombre</label>
                    <input type="text" class="form-control" id="txtNombre" name="txtNombre"/>
                </div>
                <div class="form-group">
                    <label>Categoria</label>
                    <input type="text" class="form-control" id="txtCategoria" name="txtCategoria" />
                </div>
                <div class="form-group">
                    <label>Precio</label>
                    <input type="number" class="form-control" id="txtPrecio" name="txtPrecio" />
                </div>
                <div class="form-group">
                    <label>Stock</label>
                    <input type="number" class="form-control" id="txtStock" name="txtStock" />
                </div>
                
                <div class="text-end mt-3">
                    <button type="submit" class="btn btn-primary">Guardar</button>
                    <a href="http://localhost:8080/marte/admin/productos/listar" class="btn btn-secondary">Cancelar</a>
                </div>
            </form>
                
        </div>
                
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" 
        crossorigin="anonymous"></script>
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/js/all.min.js" 
        integrity="sha512-b+nQTCdtTBIRIbraqNEwsjB6UvL3UEMkXnhzd8awtCYh0Kcsjl9uEgwVFVbhoj3uu1DO1ZMacNvLoyJJiNfcvg==" 
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        
    </body>
</html>
