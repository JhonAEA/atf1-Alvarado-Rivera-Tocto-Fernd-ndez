package com.mycompany.urbansoul.models.controladores;

import com.mycompany.urbansoul.models.Contacto;
import com.mycompany.urbansoul.persistencia.ContactoJpaController;
import jakarta.persistence.EntityManagerFactory;
import java.util.List;

public class ControladorContacto {
    
    private ContactoJpaController contacJpa;
    
    public ControladorContacto(EntityManagerFactory emf) {
        this.contacJpa = new ContactoJpaController(emf);
    }
    
    //Operacion CREATE
    public void crearContacto(Contacto cont){
        
        contacJpa.create(cont);
    
    }
    
    //Operacion READ
    public List<Contacto> traerContactos (){
        
        return contacJpa.findContactoEntities();
    
    }
    
}


  
