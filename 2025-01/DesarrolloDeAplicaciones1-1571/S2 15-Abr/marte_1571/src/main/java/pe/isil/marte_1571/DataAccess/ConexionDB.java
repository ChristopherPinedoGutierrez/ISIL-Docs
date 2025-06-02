package pe.isil.marte_1571.DataAccess;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ConexionDB {
    //Atributos de conexion
    private String username = "root";
    private String password = "root";
    private String database = "marte_1571";
    private String host = "localhost"; //instalacion o la base de datos y la aplicacion estan en el mismo server
    private String puerto = "3306";
    
    //Atributos adicionales
    private Connection conexion;
    private static ConexionDB instancia;
    
    //Constructor
    public ConexionDB() {
       
        try {
            //Driver o controlador de conexion a la base de datos (MYSQL)
            Class.forName("com.mysql.cj.jdbc.Driver");
        
            
            //Creamos la cadena de conexion
            String url;
            url = "jdbc:mysql://" + host + ":" + puerto + "/" + database + "?ServerTimezone=America/Lima";
            
            //Obtenemos la conexion a la bd
            conexion = DriverManager.getConnection(url, username, password);
            
            //Imprime mensaje
            System.out.println("Conexión exitosa a la base de datos");
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ConexionDB.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }

    //Obtener conexion
    public Connection getConexion()
    {
        if(conexion == null)
        {
            instancia = new ConexionDB();
        }
        return conexion;
    }
    
    //Obtiene la instancia
    public static ConexionDB getInstancia()
    {
        if(instancia != null)
        {
            return instancia;
        }
        instancia = new ConexionDB();
        return instancia;
    }
    
    //Cerrar conexion
    private void close(Connection conexion)
    {
        try {
            conexion.close(); //cerramos la conexion
            instancia = null; //inicializamos a null la instancia
            if(conexion.isClosed())
            {
                System.out.println("Conexión cerrada a la base de datos");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ConexionDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
