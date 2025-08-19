
package pe.isil.appwebmarte.logica_negocio;

import java.util.ArrayList;
import pe.isil.appwebmarte.model.beans.Producto;
import pe.isil.appwebmarte.model.data_access.AD_Producto;


public class LN_Producto {
    
    AD_Producto ad_producto = new AD_Producto();
    
    //obtiene todos los productos
    public ArrayList<Producto> getAll()
    {
        return ad_producto.getAll();
    }
    
}
