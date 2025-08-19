
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
    
    //1. CREAR EL INSERTAR O AGREGAR PRODUCTO (UN INSERT EN LA TABLA DE PRODUCTO)
    public boolean add(Producto producto)
    {
        boolean resultado = false; //Resultado de la ejecucion del insert
        Connection conexion = null; //Creo un objeto conexion        
        try {
            //1. Creamos la conexion a la base de datos
            conexion = ConexionDB.getInstancia().getConexion();
            //Validar que la conexion exista
            if(conexion != null){
                //2. Crear el query a ejecutar
                String SQL = "INSERT INTO producto(nombre, categoria, precio, stock) VALUES(?, ?, ?, ?)";
                pst = conexion.prepareStatement(SQL);
                //2.1 agregar los parametros y sus valores
                pst.setString(1, producto.getNombre());
                pst.setString(2, producto.getCategoria());
                pst.setDouble(3, producto.getPrecio());
                pst.setDouble(4, producto.getStock());
                
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
    
    
    public boolean update(Producto producto)
    {
        boolean resultado = false; //Resultado de la ejecucion del insert
        Connection conexion = null; //Creo un objeto conexion        
        try {
            //1. Creamos la conexion a la base de datos
            conexion = ConexionDB.getInstancia().getConexion();
            //Validar que la conexion exista
            if(conexion != null){
                //2. Crear el query a ejecutar
                String SQL = "UPDATE producto SET nombre = ?, categoria = ?, precio = ?, stock = ? WHERE Id = ?";
                pst = conexion.prepareStatement(SQL);
                //2.1 agregar los parametros y sus valores
                pst.setString(1, producto.getNombre());
                pst.setString(2, producto.getCategoria());
                pst.setDouble(3, producto.getPrecio());
                pst.setDouble(4, producto.getStock());
                pst.setInt(5, producto.getId());
                
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
    
    public Producto getById(Integer id)
    {
        Producto producto = new Producto();
        Connection conexion = null;
        try {
            //1. abrir conexion
            conexion = ConexionDB.getInstancia().getConexion();
            if(conexion != null)
            {
                //2. crear la sentencia SQL
                String SQL = "SELECT * FROM producto WHERE id = ?";
                pst = conexion.prepareStatement(SQL);
                pst.setInt(1, id);
                
                //3. Ejecutar la sentencia SQL y guardar el resultado
                rst = pst.executeQuery();
                
                //4.Recorrer el rst y asignar los valores al obj Curso
                while(rst.next())
                {
                    producto.setId(rst.getInt("id"));
                    producto.setNombre(rst.getString("nombre"));
                    producto.setCategoria(rst.getString("categoria"));
                    producto.setPrecio(rst.getDouble("precio"));
                    producto.setStock(rst.getDouble("stock"));
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
        return producto;
    }
    
}
