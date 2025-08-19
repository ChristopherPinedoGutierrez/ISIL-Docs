
package pe.isil.dae_01_pa4.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pe.isil.dae_01_pa4.business_logic.BL_Academia;
import pe.isil.dae_01_pa4.business_logic.BL_Karateca;
import pe.isil.dae_01_pa4.model.beans.Academia;
import pe.isil.dae_01_pa4.model.beans.Karateca;

@WebServlet(name = "KaratecaController", urlPatterns = {"/karateca"})
public class KaratecaController extends HttpServlet {

    BL_Karateca bl_karateca = new BL_Karateca();
    BL_Academia bl_academia = new BL_Academia();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action == null || action.equals("listar")) {
            ArrayList<Karateca> lista = bl_karateca.getAll();
            ArrayList<Academia> academias = bl_academia.getAll();

            request.setAttribute("listaKaratecas", lista);
            request.setAttribute("listaAcademias", academias);

            request.getRequestDispatcher("pages/karatecas.jsp").forward(request, response);
        } else {
            response.sendRedirect("index.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("registrar".equals(action)) {
            try {
                
                String dni = request.getParameter("dni");
                String nombreCompleto = request.getParameter("nombre_completo");
                String edadStr = request.getParameter("edad");
                String pesoStr = request.getParameter("peso");
                String sexo = request.getParameter("sexo").toUpperCase();
                String rangoStr = request.getParameter("rango");
                String idLigaStr = request.getParameter("id_liga");

                
                if (dni == null || dni.trim().isEmpty() ||
                    nombreCompleto == null || nombreCompleto.trim().isEmpty() ||
                    edadStr == null || pesoStr == null || rangoStr == null ||
                    sexo == null || idLigaStr == null ||
                    edadStr.trim().isEmpty() || pesoStr.trim().isEmpty() ||
                    rangoStr.trim().isEmpty() || idLigaStr.trim().isEmpty()) {

                    request.setAttribute("mensaje", "❌ Todos los campos son obligatorios.");
                    reenviarFormulario(request, response);
                    return;
                }

                
                int edad = Integer.parseInt(edadStr);
                double peso = Double.parseDouble(pesoStr);
                int rango = Integer.parseInt(rangoStr);
                int idLiga = Integer.parseInt(idLigaStr);

                if (!(sexo.equals("M") || sexo.equals("F"))) {
                    request.setAttribute("mensaje", "❌ El valor de sexo debe ser 'M' o 'F'.");
                    reenviarFormulario(request, response);
                    return;
                }

                if (rango < 1 || rango > 10) {
                    request.setAttribute("mensaje", "❌ El rango debe estar entre 1 y 10.");
                    reenviarFormulario(request, response);
                    return;
                }

              
                Karateca karateca = new Karateca();
                karateca.setDni(dni);
                karateca.setNombreCompleto(nombreCompleto);
                karateca.setEdad(edad);
                karateca.setPeso(peso);
                karateca.setSexo(sexo);
                karateca.setRango(rango);
                karateca.setModalidad("KUMITE");
                karateca.setIdLiga(idLiga);

                boolean insertado = bl_karateca.add(karateca);
                if (insertado) {
                    request.setAttribute("mensaje", "✅ Karateca registrado correctamente.");
                } else {
                    request.setAttribute("mensaje", "❌ Error al registrar el karateca (verifica si el DNI ya existe o si la academia es válida).");
                }

            } catch (NumberFormatException e) {
                e.printStackTrace();
                request.setAttribute("mensaje", "❌ Error en el formato de número: " + e.getMessage());
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("mensaje", "❌ Error inesperado: " + e.getMessage());
            }

            reenviarFormulario(request, response);

        } else {
            response.sendRedirect("index.jsp");
        }
    }

    private void reenviarFormulario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<Karateca> lista = bl_karateca.getAll();
        ArrayList<Academia> academias = bl_academia.getAll();

        request.setAttribute("listaKaratecas", lista);
        request.setAttribute("listaAcademias", academias);
        request.getRequestDispatcher("pages/karatecas.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Controlador de Karatecas";
    }
}
