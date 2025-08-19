package pe.isil.appwebmarte.logica_negocio;

import java.sql.SQLException;
import pe.isil.appwebmarte.model.beans.Usuario;
import pe.isil.appwebmarte.model.data_access.AD_Usuario;


public class LN_Usuario {

    AD_Usuario aD_Usuario = new AD_Usuario();
    
    public Integer add(Usuario usuario) throws SQLException
    {
        Integer resultado = 3; //1: existe el usuario por el email, 2: Registro exitoso, 3: Error al registrar
        
        //1. Validar que el correo no exista
        if(aD_Usuario.existe_email(usuario.getEmail()))
        {
            resultado = 1;
            return resultado;
        }
        
        //2. Registar usuario en la base de datos
        if (aD_Usuario.add(usuario)) {
            resultado = 2;
        }else{
            resultado = 3;
        }
        
        return resultado;
    }
    
    public Usuario login(String email) throws SQLException
    {
        return aD_Usuario.login(email);
    }
    
}
