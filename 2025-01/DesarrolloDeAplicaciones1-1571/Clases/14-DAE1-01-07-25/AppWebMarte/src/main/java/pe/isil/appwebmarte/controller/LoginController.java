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
import javax.servlet.http.HttpSession;
import org.jasypt.util.password.StrongPasswordEncryptor;
import pe.isil.appwebmarte.logica_negocio.LN_Usuario;
import pe.isil.appwebmarte.model.beans.Usuario;

/**
 *
 * @author fercho
 */
@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

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
            out.println("<title>Servlet LoginController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginController at " + request.getContextPath() + "</h1>");
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
        //Redireccione o carga la pagin de inicio de sesion o login.jsp
        request.getRequestDispatcher("/login.jsp").forward(request, response);
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
        try {
            //codificar
            request.setCharacterEncoding("UTF-8");
            
            //Obtenemos el email y password enviados desde el formulario de login
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            //Crear el objeto de logica de negocio
            LN_Usuario ln_usuario = new LN_Usuario();
            Usuario usuario = new Usuario();
            
            usuario = ln_usuario.login(email);
            
            if (usuario == null) {
                HttpSession sesion_actual = request.getSession(true);
                sesion_actual.setAttribute("mensaje", "Usuario no existe con el email ingresado");
                response.sendRedirect(request.getContextPath() + "/login");
            }else{
                StrongPasswordEncryptor encriptador = new StrongPasswordEncryptor();
                if (encriptador.checkPassword(password, usuario.getPassword())) {
                    HttpSession sesion = request.getSession(true);
                    sesion.setAttribute("usuario", usuario);
                    response.sendRedirect(request.getContextPath() + "/admin/productos");
                }else{
                    HttpSession sesion_actual = request.getSession(true);
                    sesion_actual.setAttribute("mensaje", "Password incorrecto");
                    response.sendRedirect(request.getContextPath() + "/login");
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
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
