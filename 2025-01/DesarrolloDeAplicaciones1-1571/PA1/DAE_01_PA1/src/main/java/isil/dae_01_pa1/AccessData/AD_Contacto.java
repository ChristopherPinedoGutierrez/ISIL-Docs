
package isil.dae_01_pa1.AccessData;

import isil.dae_01_pa1.Model.Contacto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Date;

public class AD_Contacto {

    private PreparedStatement pst = null;

    public boolean add(Contacto contacto) {
        boolean resultado = false;
        Connection conexion = null;

        try {
            conexion = ConexionDB.getInstancia().getConexion();

            if (conexion != null) {
                String SQL = "INSERT INTO contacto(nombres, apellidos, empresa, telefono, correo, cumpleaños, direccion) VALUES(?, ?, ?, ?, ?, ?, ?)";
                pst = conexion.prepareStatement(SQL);

                pst.setString(1, contacto.getNombres());
                pst.setString(2, contacto.getApellidos());
                pst.setString(3, contacto.getEmpresa());
                pst.setString(4, contacto.getTelefono());
                pst.setString(5, contacto.getCorreo());
                pst.setDate(6, new Date(contacto.getCumpleaños().getTime()));
                pst.setString(7, contacto.getDireccion());

                if (pst.executeUpdate() > 0) {
                    resultado = true;
                }
            } else {
                System.out.println("Error en la conexión a la base de datos");
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            ConexionDB.getInstancia().close(conexion);
        }

        return resultado;
    }

    public boolean update(Contacto contacto) {
        boolean resultado = false;
        Connection conexion = null;

        try {
            conexion = ConexionDB.getInstancia().getConexion();

            if (conexion != null) {
                String SQL = "UPDATE contacto SET nombres = ?, apellidos = ?, empresa = ?, telefono = ?, correo = ?, cumpleaños = ?, direccion = ? WHERE id = ?";
                pst = conexion.prepareStatement(SQL);

                pst.setString(1, contacto.getNombres());
                pst.setString(2, contacto.getApellidos());
                pst.setString(3, contacto.getEmpresa());
                pst.setString(4, contacto.getTelefono());
                pst.setString(5, contacto.getCorreo());
                pst.setDate(6, new Date(contacto.getCumpleaños().getTime()));
                pst.setString(7, contacto.getDireccion());
                pst.setInt(8, contacto.getId());

                if (pst.executeUpdate() > 0) {
                    resultado = true;
                }
            } else {
                System.out.println("Error en la conexión a la base de datos");
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            ConexionDB.getInstancia().close(conexion);
        }

        return resultado;
    }

    public boolean delete(Integer id_contacto) {
        boolean resultado = false;
        Connection conexion = null;

        try {
            conexion = ConexionDB.getInstancia().getConexion();

            if (conexion != null) {
                String SQL = "DELETE FROM contacto WHERE id = ?";
                pst = conexion.prepareStatement(SQL);
                pst.setInt(1, id_contacto);

                if (pst.executeUpdate() > 0) {
                    resultado = true;
                }
            } else {
                System.out.println("Error en la conexión a la base de datos");
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            ConexionDB.getInstancia().close(conexion);
        }

        return resultado;
    }
}

