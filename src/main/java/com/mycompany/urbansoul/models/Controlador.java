package com.mycompany.urbansoul.models;

import com.mycompany.urbansoul.persistencia.ControladoraPersistencia;
import java.util.List;

public class Controlador {
    
    ControladoraPersistencia controlPersis = new ControladoraPersistencia();
    
    public void crearContacto(Contacto cont){
        controlPersis.crearContacto(cont);
    }
    
    public List<Contacto> traerContactos(){
        return controlPersis.traerContactos();
    }
    
}
