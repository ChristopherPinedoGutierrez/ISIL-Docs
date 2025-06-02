package pe.isil.marte_1571.LogicaNegocio;

import pe.isil.marte_1571.DataAccess.AD_Curso;
import pe.isil.marte_1571.model.Curso;

public class LN_Curso {

    private AD_Curso ad_curso = new AD_Curso();
    
    public boolean add(Curso curso)
    {
        return ad_curso.add(curso);
    }
    
    public boolean update(Curso curso)
    {
        return ad_curso.update(curso);
    }
    
    public boolean delete(Integer id)
    {
        return ad_curso.delete(id);
    }
    
}
