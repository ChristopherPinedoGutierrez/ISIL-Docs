
package isil.dae_01_pa1.Model;

import java.util.Date;

public class Contacto {
    
    private Integer id;
    private String nombres;
    private String apellidos;
    private String empresa;
    private String telefono;
    private String correo;
    private Date cumpleaños;
    private String direccion;

    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }


    public String getNombres() {
        return nombres;
    }
    public void setNombres(String nombres) {
        this.nombres = nombres;
    }


    public String getApellidos() {
        return apellidos;
    }
    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }


    public String getEmpresa() {
        return empresa;
    }
    public void setEmpresa(String empresa) {
        this.empresa = empresa;
    }


    public String getTelefono() {
        return telefono;
    }
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }


    public String getCorreo() {
        return correo;
    }
    public void setCorreo(String correo) {
        this.correo = correo;
    }


    public Date getCumpleaños() {
        return cumpleaños;
    }
    public void setCumpleaños(Date cumpleaños) {
        this.cumpleaños = cumpleaños;
    }


    public String getDireccion() {
        return direccion;
    }
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

}
