
package pe.isil.dae_01_pa2.AccesoData;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ConexionDB {
    
    //Atributos de conexión
    private String username = "root";
    private String password = "Qwerty123_";
    private String database = "dae_01_pa1";
    private String host = "localhost";
    private String puerto = "3309";
    
    //Atributos adicionales
    private Connection conexion;
    private static ConexionDB instancia;

    //Constructor
    public ConexionDB() {
        try{
            //Driver o controlador de conexión a la base de datos (MYSQL)
            Class.forName("com.mysql.cj.jdbc.Driver");
            //Creamos la cadena de conexión
            String url;
            url = "jdbc:mysql://" + host + ":" + puerto + "/" + database + "?ServerTimezone=America/Lima";
            //Obtenemos la conexión a la BD
            conexion = DriverManager.getConnection(url, username, password);
            //Imprime mensaje
            System.out.println("Conexión exitosa a la base de datos");
        } catch(ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ConexionDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    //Obtener conexion
    public Connection getConexion() {
        if(conexion == null) {
            instancia = new ConexionDB();
        }
        return conexion;
    }
    
    //Obtiene la instancia
    public static ConexionDB getInstancia() {
        if(instancia != null) {
            return instancia;
        }
        instancia = new ConexionDB();
        return instancia;
    }
    
    //Cerrar conexion
    public void close(Connection conexion) {
        try {
            conexion.close(); //cerramos la conexion
            instancia = null; //inicializamos a null la instancia
            if(conexion.isClosed()) {
                System.out.println("Conexión cerrada a la base de datos");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ConexionDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}