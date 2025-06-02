package pe.isil.marte_1571;

import java.sql.SQLException;
import pe.isil.marte_1571.DataAccess.AD_Curso;
import pe.isil.marte_1571.model.Curso;

public class Marte_1571 {

    public static void main(String[] args) throws SQLException {
       /* 
        //INSERTAR O AGREGAR UN NUEVO CURSO EN LA BASE DE DATOS
        
        //1. Instanciar un objeto de la clase Curso
        Curso nuevo_curso = new Curso();
        
        //2. Asignar o llenar los valores del obj Nuevo_Curso
        nuevo_curso.setNombre("Base de datos");
        nuevo_curso.setDescripcion("Base de datos");
        nuevo_curso.setPrecio(1000.00);

        //3. Instanciar un objeto de la clase AD_Curso (clase encargada de realizar las transacciones hacia la base de datos)
        AD_Curso ad_curso = new AD_Curso();
        
        //4. Llamar al metodo add, para insertar un nuevo curso
        ad_curso.add(nuevo_curso);
        
        //5. Mensaje de confirmacion
        System.out.println("Nuevo curso registrado correctamente");

        */
       
       /*
       //ACTUALIZAR UN REGISTRO
        Curso curso_actualizar = new Curso();
        
        curso_actualizar.setNombre("Programación de base de datos");
        curso_actualizar.setDescripcion("Programacion de base de datos MYSQL y JAVA");
        curso_actualizar.setPrecio(550.50);
        curso_actualizar.setId(2);
        
        boolean resultado = false;
        
        AD_Curso ad_curso = new AD_Curso();
        resultado = ad_curso.update(curso_actualizar);
        
        if(resultado == true)
        {
            System.out.println("Curso actualizado");
        }
        else
        {
            System.out.println("Error en actualizar el curso");
        }
        */
       
       //ELIMINAR CURSO X ID
       AD_Curso ad_curso = new AD_Curso();
       boolean resultado = false;
       resultado = ad_curso.delete(2);
       if(resultado == true)
        {
            System.out.println("Curso eliminad0");
        }
        else
        {
            System.out.println("Error en eliminar el curso");
        }
       
    }
}
