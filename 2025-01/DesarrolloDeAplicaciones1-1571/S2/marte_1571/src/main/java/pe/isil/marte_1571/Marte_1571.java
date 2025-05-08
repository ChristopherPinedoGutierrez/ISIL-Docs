/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package pe.isil.marte_1571;

import java.sql.Connection;
import java.sql.SQLException;
import pe.isil.marte_1571.DataAccess.ConexionDB;

/**
 *
 * @author fercho
 */
public class Marte_1571 {

    public static void main(String[] args) throws SQLException {
        System.out.println("Hello World!" + " ISIL Aprende haciendo");
        
        Connection conexion = null;
        
        conexion = ConexionDB.getInstancia().getConexion();
        
    }
}
