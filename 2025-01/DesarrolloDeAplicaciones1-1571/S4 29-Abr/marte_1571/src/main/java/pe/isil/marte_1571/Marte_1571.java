package pe.isil.marte_1571;

import java.sql.SQLException;
import javax.swing.JFrame;
import pe.isil.marte_1571.DataAccess.AD_Curso;
import pe.isil.marte_1571.model.Curso;
import pe.isil.marte_1571.view.frmCurso;

public class Marte_1571 {

    public static void main(String[] args) throws SQLException 
    {
        frmCurso form_curso = new frmCurso();//creo un objeto on instancia de la clase frmCurso (formulario JFrame)
        
        form_curso.setLocationRelativeTo(null); //Que muestre el formulario en el centro de la pantalla
        form_curso.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); //EXIT_ON_CLOSE cuando se cierra el formulario termina el programa
        form_curso.setVisible(true); //hace visible o presenta el formulario
       
    }
}
