/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package pe.isil.appwebmarte.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jasypt.util.password.StrongPasswordEncryptor;
import pe.isil.appwebmarte.logica_negocio.LN_Usuario;
import pe.isil.appwebmarte.model.beans.Usuario;

/**
 *
 * @author fercho
 */
@WebServlet(name = "UsuarioRegistroController", urlPatterns = {"/registro_usuario"})
public class UsuarioRegistroController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UsuarioRegistroController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UsuarioRegistroController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //Cargar la pagina JSP de registro de usuario
        request.getRequestDispatcher("/registro_usuario.jsp").forward(request, response);
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       //1. Codificar en UTF-8
       request.setCharacterEncoding("UTF-8");
       
       //2. Obtener los inputs o valores de los campos enviados del formulario o vista
       String nombres_apellidos = request.getParameter("nombres_apellidos");
       String email = request.getParameter("email");
       String password = request.getParameter("password");
       String repite_password = request.getParameter("repite_password");
       
       //3. Regsistar al usuario
       //3.1 Validar la entrada de datos
        if (nombres_apellidos.isEmpty() || nombres_apellidos.isBlank() || password.isBlank() 
                || password.isEmpty() || email.isBlank() || email.isEmpty()) {
            request.setAttribute("mensaje_error", "Todos los datos son obligatorios");
            request.getRequestDispatcher("/registro_usuario.jsp").forward(request, response);
        }
        
        if (password.length() < 5) {
            request.setAttribute("mensaje_error", "El password debe tener como mínimo 5 caracteres");
            request.getRequestDispatcher("/registro_usuario.jsp").forward(request, response);
        }
        
        //3.2 Validamos si el password es igual al repite password
        if (password.equals(repite_password) == false) {
            request.setAttribute("mensaje_error", "El password ingresados no coinciden");
            request.getRequestDispatcher("/registro_usuario.jsp").forward(request, response);
        }else{
           try {
               //3.3 Crear un objeto de usuario y lo registramos
               Usuario usuario = new Usuario();
               usuario.setEmail(email);
               usuario.setNombres_apellidos(nombres_apellidos);
               //3.4 Encriptamos el password
               StrongPasswordEncryptor encriptador = new StrongPasswordEncryptor();
               password = encriptador.encryptPassword(password);
               //asignamos el password encriptado al objeto usuario
               usuario.setPassword(password);
               
               //3.5 crear un objeto de logica de negocio
               LN_Usuario ln_usuario = new LN_Usuario();
               Integer resultado = 0;
               
               resultado = ln_usuario.add(usuario);
               
               if (resultado == 2) {
                   request.setAttribute("mensaje_exito", "Usuario registrado correctamente");
                   request.getRequestDispatcher("/registro_usuario.jsp").forward(request, response);
               }else{
                   if (resultado == 1) {
                       request.setAttribute("mensaje_advertencia", "El email ya existe");
                       request.getRequestDispatcher("/registro_usuario.jsp").forward(request, response);
                   }
                   
                   if (resultado == 3) {
                        request.setAttribute("mensaje_error", "Error al registrar al usuario");
                        request.getRequestDispatcher("/registro_usuario.jsp").forward(request, response);
                   }
               }  
           } catch (SQLException ex) {
               Logger.getLogger(UsuarioRegistroController.class.getName()).log(Level.SEVERE, null, ex);
           }
            
        }
       
       
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
