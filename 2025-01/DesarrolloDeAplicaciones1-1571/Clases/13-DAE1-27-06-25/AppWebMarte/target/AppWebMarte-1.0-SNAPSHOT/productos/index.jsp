<%@page import="pe.isil.appwebmarte.model.beans.Producto"%>
<%@page import="java.util.ArrayList"%>
<%
    ArrayList<Producto> productos = new ArrayList<>();
    productos = (ArrayList<Producto>)request.getAttribute("productos");
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestión de Productos</title>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" 
              crossorigin="anonymous">
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" 
              integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        
        <div class="container mt-5">
            <h3>Gestión de productos</h3>

            <div class="text-end">
                <a href="/marte/admin/productos/nuevo" class="btn btn-primary">Nuevo producto</a>
            </div>
            
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>NOMBRE</th>
                        <th>CATEGORIA</th>
                        <th>PRECIO</th>
                        <th>STOCK</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for(Producto item:productos)
                        {
                    %>
                    <tr>
                        <td><%=item.getNombre() %></td>
                        <td><%=item.getCategoria() %> </td>
                        <td><%=item.getPrecio() %></td>
                        <td><%=item.getStock() %></td>
                        <td class="text-end">
                            <div class="btn-group btn-group-sm">
                                <a href="/marte/admin/productos/editar/<%=item.getId() %>" class="btn btn-primary" title="Editar">
                                    <i class="fa fa-edit"></i>
                                </a>
                                
                                <a href="#" class="btn btn-danger" title="eliminar">
                                    <i class="fa fa-trash"></i>
                                </a>
                            </div>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
                
        </div>
                
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" 
        crossorigin="anonymous"></script>
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/js/all.min.js" 
        integrity="sha512-b+nQTCdtTBIRIbraqNEwsjB6UvL3UEMkXnhzd8awtCYh0Kcsjl9uEgwVFVbhoj3uu1DO1ZMacNvLoyJJiNfcvg==" 
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        
    </body>
</html>
