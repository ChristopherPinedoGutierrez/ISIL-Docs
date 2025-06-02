
package pe.isil.dae_01_pa2.AccesoData;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Date;
import java.sql.ResultSet;
import java.util.ArrayList;
import pe.isil.dae_01_pa2.Modelo.Contacto;

public class AD_Contacto {

    private PreparedStatement pst = null; //Objeto que permite ejecutar sentencias o querys SQL con o sin parametros.
    private ResultSet rst; // Conjunto de datos, SELECT equivalente del resultado en filas.

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
    
    public ArrayList<Contacto> getAll() {
        ArrayList<Contacto> contactos = new ArrayList<>();
        Contacto contacto;
        Connection conexion = null;

        try {
            // 1. Abrir conexión
            conexion = ConexionDB.getInstancia().getConexion();
            if (conexion != null) {
                // 2. Crear sentencia SQL
                String SQL = "SELECT * FROM contacto";
                pst = conexion.prepareStatement(SQL);

                // 3. Ejecutar sentencia y guardar resultado
                rst = pst.executeQuery();

                // 4. Recorrer resultado y asignar valores al objeto contacto
                while (rst.next()) {
                    contacto = new Contacto();
                    contacto.setId(rst.getInt("id"));
                    contacto.setNombres(rst.getString("nombres"));
                    contacto.setApellidos(rst.getString("apellidos"));
                    contacto.setEmpresa(rst.getString("empresa"));
                    contacto.setTelefono(rst.getString("telefono"));
                    contacto.setCorreo(rst.getString("correo"));
                    contacto.setCumpleaños(rst.getDate("cumpleaños"));
                    contacto.setDireccion(rst.getString("direccion"));

                    // 5. Agregar el contacto al listado
                    contactos.add(contacto);
                }
            } else {
                System.out.println("Error en la conexión a la base de datos");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            ConexionDB.getInstancia().close(conexion);
        }
        return contactos;
    }
    
    public Contacto getById(int id) {
        Contacto contacto = null;
        Connection conexion = null;

        try {
            // 1. Abrir conexión
            conexion = ConexionDB.getInstancia().getConexion();

            if (conexion != null) {
                // 2. Crear sentencia SQL con parámetro
                String SQL = "SELECT * FROM contacto WHERE id = ?";
                pst = conexion.prepareStatement(SQL);
                pst.setInt(1, id);

                // 3. Ejecutar sentencia y obtener resultado
                rst = pst.executeQuery();

                // 4. Si existe registro, crear objeto y asignar valores
                if (rst.next()) {
                    contacto = new Contacto();
                    contacto.setId(rst.getInt("id"));
                    contacto.setNombres(rst.getString("nombres"));
                    contacto.setApellidos(rst.getString("apellidos"));
                    contacto.setEmpresa(rst.getString("empresa"));
                    contacto.setTelefono(rst.getString("telefono"));
                    contacto.setCorreo(rst.getString("correo"));
                    contacto.setCumpleaños(rst.getDate("cumpleaños"));
                    contacto.setDireccion(rst.getString("direccion"));
                }
            } else {
                System.out.println("Error en la conexión a la base de datos");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            ConexionDB.getInstancia().close(conexion);
        }

        return contacto;
    }
}

