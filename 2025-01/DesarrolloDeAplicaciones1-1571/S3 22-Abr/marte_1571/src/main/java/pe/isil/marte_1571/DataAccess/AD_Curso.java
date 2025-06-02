package pe.isil.marte_1571.DataAccess;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import pe.isil.marte_1571.model.Curso;

public class AD_Curso 
{
    private PreparedStatement pst = null; //Objeto me permite ejecutar sentencias o querys SQL con o sin parametros
    private ResultSet rst; //Conjunto de datos, SELECT equivalente del resultado en filas.
    
    //1. CREAR EL INSERTAR O AGREGAR CURSO (UN INSERT EN LA TABLA DE CURSO)
    public boolean add(Curso curso)
    {
        boolean resultado = false; //Resultado de la ejecucion del insert
        Connection conexion = null; //Creo un objeto conexion        
        try {
            //1. Creamos la conexion a la base de datos
            conexion = ConexionDB.getInstancia().getConexion();
            //Validar que la conexion exista
            if(conexion != null){
                //2. Crear el query a ejecutar
                String SQL = "INSERT INTO curso(nombre, descripcion, precio) VALUES(?, ?, ?)";
                pst = conexion.prepareStatement(SQL);
                //2.1 agregar los parametros y sus valores
                pst.setString(1, curso.getNombre());
                pst.setString(2, curso.getDescripcion());
                pst.setDouble(3, curso.getPrecio());
                
                //3. Ejecutar el query o statement                
                if( pst.executeUpdate() > 0){
                    resultado = true;
                }
            }else{
                System.out.println("Error en la conexion a la base de datos");
            }                        
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            ConexionDB.getInstancia().close(conexion);
        }
        return resultado;
    }
    
    public boolean update(Curso curso)
    {
        boolean resultado = false;
        Connection conexion = null;      
        try {
            conexion = ConexionDB.getInstancia().getConexion();
            if(conexion != null)
            {
                String SQL = "UPDATE Curso SET nombre = ?, descripcion = ?, precio = ? WHERE id = ?";
                pst = conexion.prepareStatement(SQL);
                
                pst.setString(1, curso.getNombre());
                pst.setString(2, curso.getDescripcion());
                pst.setDouble(3, curso.getPrecio());
                pst.setInt(4, curso.getId());
                
                if(pst.executeUpdate() > 0)
                {
                    resultado = true;
                }
            }
            else
            {
                System.out.println("Error en la conexión a la base de datos");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            ConexionDB.getInstancia().close(conexion);
        }
        return resultado;
    }
    
    public boolean delete(Integer id_curso)
    {
        boolean resultado = false;
        Connection conexion = null;
        try {
            conexion = ConexionDB.getInstancia().getConexion();
            if(conexion != null)
            {
                String SQL = "DELETE FROM curso WHERE id = ?";
                pst = conexion.prepareStatement(SQL);
                pst.setInt(1, id_curso);
                
                if(pst.executeUpdate() > 0)
                {
                    resultado = true;
                }
            }
            else
            {
                System.out.println("Error en la conexion a la base de datos");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            ConexionDB.getInstancia().close(conexion);
        }
        return resultado;
    }
}
