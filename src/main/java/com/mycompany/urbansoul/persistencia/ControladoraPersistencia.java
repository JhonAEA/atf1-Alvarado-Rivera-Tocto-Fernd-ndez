package com.mycompany.urbansoul.persistencia;

import java.util.List;
import com.mycompany.urbansoul.models.Contacto;

public class ControladoraPersistencia {
    
    ContactoJpaController contacJpa = new ContactoJpaController();
    
    //Operacion CREATE
    public void crearContacto(Contacto cont){
        
        contacJpa.create(cont);
    
    }
    
    //Operacion READ
    public List<Contacto> traerContactos (){
        
        return contacJpa.findContactoEntities();
    
    }
    
}
