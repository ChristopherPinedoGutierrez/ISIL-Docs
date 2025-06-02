
package pe.isil.dae_01_pa2;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import javax.swing.JFrame;
import pe.isil.dae_01_pa2.AccesoData.AD_Contacto;
import pe.isil.dae_01_pa2.AccesoData.ConexionDB;
import pe.isil.dae_01_pa2.Modelo.Contacto;
import pe.isil.dae_01_pa2.Vista.frmContacto;

public class DAE_01_PA2 {

    public static void main(String[] args) throws SQLException {
        frmContacto form_contacto = new frmContacto();

        // Centrar el formulario en pantalla
        form_contacto.setLocationRelativeTo(null);

        // Cuando cierres el formulario, termina el programa
        form_contacto.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        // Cargar datos antes de mostrar la ventana (si tienes un método cargar_tabla)
        form_contacto.cargarTabla();

        // Mostrar la ventana
        form_contacto.setVisible(true);
        
    }
}
