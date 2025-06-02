
package pe.isil.dae_01_pa2.LogicaNegocio;

import java.util.ArrayList;
import pe.isil.dae_01_pa2.AccesoData.AD_Contacto;
import pe.isil.dae_01_pa2.Modelo.Contacto;

/**
 *
 * @author chris
 */ 
public class LN_Contacto {

    private AD_Contacto ad_contacto = new AD_Contacto();

    public boolean add(Contacto contacto) {
        return ad_contacto.add(contacto);
    };

    public boolean update(Contacto contacto) {
        return ad_contacto.update(contacto);
    };

    public boolean delete(Integer id) {
        return ad_contacto.delete(id);
    };

    public Contacto getById(Integer id) {
        return ad_contacto.getById(id);
    };

    public ArrayList<Contacto> getAll() {
        return ad_contacto.getAll();
    };
}
