
package pe.isil.appwebmarte.model.data_access;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import pe.isil.appwebmarte.model.beans.Producto;


public class AD_Producto {
    
    private PreparedStatement pst = null; //Objeto me permite ejecutar sentencias o querys SQL con o sin parametros
    private ResultSet rst; //Conjunto de datos, SELECT equivalente del resultado en filas.
    
    //obtiene todos los productos
    public ArrayList<Producto> getAll()
    {
        ArrayList<Producto> productos = new ArrayList<>();
        Producto producto;
        Connection conexion = null;
        try {
            //1. abrir conexion
            conexion = ConexionDB.getInstancia().getConexion();
            if(conexion != null)
            {
                //2. crear la sentencia SQL
                String SQL = "SELECT * FROM producto";
                pst = conexion.prepareStatement(SQL);
                 //3. Ejecutar la sentencia SQL y guardar el resultado
                rst = pst.executeQuery();
                //4.Recorrer el rst y asignar los valores al obj Producto
                while(rst.next())
                {
                    producto = new Producto(); //instanciamos el obj Producto, es decir en cada recorrido se genera un nueva estructura
                    producto.setId(rst.getInt("id"));
                    producto.setNombre(rst.getString("nombre"));
                    producto.setCategoria(rst.getString("categoria"));
                    producto.setPrecio(rst.getDouble("precio"));
                    producto.setStock(rst.getDouble("stock"));
                    //5. agregamos el curso al array o listado de productos
                    productos.add(producto);
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
        return productos;
    }
    
}
