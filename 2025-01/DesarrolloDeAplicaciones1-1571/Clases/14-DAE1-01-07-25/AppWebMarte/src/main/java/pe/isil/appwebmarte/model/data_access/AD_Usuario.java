package pe.isil.appwebmarte.model.data_access;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import pe.isil.appwebmarte.model.beans.Usuario;

public class AD_Usuario {
    private PreparedStatement pst = null; //Objeto me permite ejecutar sentencias o querys SQL con o sin parametros
    private ResultSet rst; //Conjunto de datos, SELECT equivalente del resultado en filas.

    //1. CREAR EL INSERTAR O AGREGAR USUARIO (UN INSERT EN LA TABLA DE USUARIO)
    public boolean add(Usuario usuario)
    {
        boolean resultado = false; //Resultado de la ejecucion del insert
        Connection conexion = null; //Creo un objeto conexion        
        try {
            //1. Creamos la conexion a la base de datos
            conexion = ConexionDB.getInstancia().getConexion();
            //Validar que la conexion exista
            if(conexion != null){
                //2. Crear el query a ejecutar
                String SQL = "INSERT INTO usuario(email, password, nombres_apellidos) VALUES(?, ?, ?)";
                pst = conexion.prepareStatement(SQL);
                //2.1 agregar los parametros y sus valores
                pst.setString(1, usuario.getEmail());
                pst.setString(2, usuario.getPassword());
                pst.setString(3, usuario.getNombres_apellidos());
                
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
    
    
    //valida la existencia de un email
    public boolean existe_email(String email) throws SQLException{
        boolean existe = false;
        Connection Conexion = null;        
        try {
            Conexion = ConexionDB.getInstancia().getConexion();
            if (Conexion != null) {
                //1.CREAMOS EL QUERY
                String SQL = "SELECT * FROM usuario WHERE email = ?";                
                //2. asignamos Conexion y parametros
                pst = Conexion.prepareStatement(SQL);
                pst.setString(1, email);
                //3. guardar el resultado en un resulset
                rst = pst.executeQuery();
                //4. recorremos el resulset
                while (rst.next()) {                    
                    if (rst.getInt("id") > 0) {
                        existe = true;
                        return existe;
                    }
                }                
            } else {
                System.out.println("Error en la conexión a la base de datos");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            ConexionDB.getInstancia().close(Conexion);
        }
        return existe;
    }
    
    public Usuario login(String email) throws SQLException
    {
        Usuario usuario = null;
        Connection Conexion = null;        
        try {
            Conexion = ConexionDB.getInstancia().getConexion();
            if (Conexion != null) {
                //1.CREAMOS EL QUERY
                String SQL = "SELECT * FROM usuario WHERE email = ?";                
                //2. asignamos Conexion y parametros
                pst = Conexion.prepareStatement(SQL);
                pst.setString(1, email);
                //3. guardar el resultado en un resulset
                rst = pst.executeQuery();
                //4. recorremos el resulset
                while (rst.next()) {                    
                    if (rst.getInt("id") > 0) {
                        usuario = new Usuario();
                        usuario.setId(rst.getInt("id"));
                        usuario.setEmail(rst.getString("email"));
                        usuario.setNombres_apellidos(rst.getString("nombres_apellidos"));
                        usuario.setPassword(rst.getString("password"));
                    }
                }                
            } else {
                System.out.println("Error en la conexión a la base de datos");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            ConexionDB.getInstancia().close(Conexion);
        }
        return usuario;
    }
    
}
