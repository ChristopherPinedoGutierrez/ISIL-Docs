<%
    String mensaje_exito = "", mensaje_error = "", mensaje_advertencia = "";
    
    if (request.getAttribute("mensaje_exito") != null) {
        mensaje_exito = request.getAttribute("mensaje_exito").toString();
        request.removeAttribute("mensaje_exito");
    }
    
    if (request.getAttribute("mensaje_error") != null) {
        mensaje_error = request.getAttribute("mensaje_error").toString();
        request.removeAttribute("mensaje_error");
    }
    
    if (request.getAttribute("mensaje_advertencia") != null) {
        mensaje_advertencia = request.getAttribute("mensaje_advertencia").toString();
        request.removeAttribute("mensaje_advertencia");
    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de usuario</title>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" 
              crossorigin="anonymous">
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" 
              integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6 col-lg-4">
                    <div class="bg-white shadow rounded p-5">
                        <h3>Registro de usuario</h3>
                        
                        <%
                            if (mensaje_exito != "") {
                        %>
                                <div class="alert alert-success">
                                    <%=mensaje_exito %>
                                </div>
                        <%       
                            }
                        %>
                        
                        <%
                            if (mensaje_advertencia != "") {
                        %>
                                <div class="alert alert-warning">
                                    <%=mensaje_advertencia %>
                                </div>
                        <%       
                            }
                        %>
                        
                        <%
                            if (mensaje_error != "") {
                        %>
                                <div class="alert alert-danger">
                                    <%=mensaje_error %>
                                </div>
                        <%       
                            }
                        %>
                        
                        
                        <form action="" method="post" class="mt-5" autocomplete="off">
                            <div class="mb-2">
                                <label>Email</label>
                                <input id="email" name="email" type="email" class="form-control"/>
                            </div>
                            <div class="mb-2">
                                <label>Password</label>
                                <input id="password" name="password" type="password" class="form-control"/>
                            </div>
                            <div class="mb-2">
                                <label>Repite password</label>
                                <input id="repite_password" name="repite_password" type="password" class="form-control"/>
                            </div>
                            <div class="mb-2">
                                <label>Nombres y Apellidos</label>
                                <input id="nombres_apellidos" name="nombres_apellidos" type="text" class="form-control"/>
                            </div>
                            
                            <div class="text-end">
                                <button type="submit" class="btn btn-primary">Registrar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
                
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" 
        crossorigin="anonymous"></script>
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/js/all.min.js" 
        integrity="sha512-b+nQTCdtTBIRIbraqNEwsjB6UvL3UEMkXnhzd8awtCYh0Kcsjl9uEgwVFVbhoj3uu1DO1ZMacNvLoyJJiNfcvg==" 
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        
    </body>
</html>
