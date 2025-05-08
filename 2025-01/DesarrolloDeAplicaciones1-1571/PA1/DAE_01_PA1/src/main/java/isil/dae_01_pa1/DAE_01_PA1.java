
package isil.dae_01_pa1;

import isil.dae_01_pa1.AccessData.AD_Contacto;
import isil.dae_01_pa1.Model.Contacto;
import isil.dae_01_pa1.AccessData.ConexionDB;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

public class DAE_01_PA1 {

    public static void main(String[] args) throws SQLException {
        System.out.println("Sistema de gestión de contactos");
        Connection conexion = ConexionDB.getInstancia().getConexion();

        if (conexion == null) {
            System.out.println("No se pudo establecer la conexión.");
            return;
        }

        AD_Contacto ad_contacto = new AD_Contacto();
        boolean resultado;

//        // --- INSERTAR NUEVO CONTACTO ---
//        Contacto nuevoContacto = new Contacto();
//        nuevoContacto.setNombres("Jose");
//        nuevoContacto.setApellidos("Fernandez");
//        nuevoContacto.setEmpresa("TechSistemas");
//        nuevoContacto.setTelefono("987654321");
//        nuevoContacto.setCorreo("jose.fernandez@techsistemas.com");
//        try {
//            nuevoContacto.setCumpleaños(new SimpleDateFormat("yyyy-MM-dd").parse("1990-08-25"));
//        } catch (Exception e) {
//            System.out.println("Error al parsear la fecha");
//        }
//        nuevoContacto.setDireccion("Av. Arequipa 1234, Lima");
//
//        resultado = ad_contacto.add(nuevoContacto);
//        if (resultado) {
//            System.out.println("Nuevo contacto registrado correctamente");
//        } else {
//            System.out.println("Error al registrar el contacto");
//        }


//        // --- ACTUALIZAR CONTACTO EXISTENTE ---
//        Contacto actualizarContacto = new Contacto();
//        actualizarContacto.setId(1); // ID del contacto a actualizar
//        actualizarContacto.setNombres("Carlos Eduardo");
//        actualizarContacto.setApellidos("Ramírez Quispe");
//        actualizarContacto.setEmpresa("TechPeru SAC");
//        actualizarContacto.setTelefono("912345678");
//        actualizarContacto.setCorreo("carlos.eq@techperu.com");
//        try {
//            actualizarContacto.setCumpleaños(new SimpleDateFormat("yyyy-MM-dd").parse("1990-08-25"));
//        } catch (Exception e) {
//            System.out.println("Error al parsear la fecha");
//        }
//        actualizarContacto.setDireccion("Av. Salaverry 4321, Lima");
//
//        resultado = ad_contacto.update(actualizarContacto);
//        if (resultado) {
//            System.out.println("Contacto actualizado correctamente");
//        } else {
//            System.out.println("Error al actualizar el contacto");
//        }


        // --- ELIMINAR CONTACTO POR ID ---
        resultado = ad_contacto.delete(1); // ID del contacto a eliminar
        if (resultado) {
            System.out.println("Contacto eliminado correctamente");
        } else {
            System.out.println("Error al eliminar el contacto");
        }
    }
}


























