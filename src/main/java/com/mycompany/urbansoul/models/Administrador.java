package com.mycompany.urbansoul.models;

import jakarta.persistence.*;
import java.io.Serializable;
import java.util.List;



@Entity
@Table(name = "administradores")
public class Administrador implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idAdmin;

    @Column(nullable = false)
    private String username;

    @Column(nullable = false)
    private String password;

    // Relación con productos
    @OneToMany(mappedBy = "administrador", cascade = CascadeType.ALL)
    private List<Producto> productos;

    public Administrador() {
    }

    public Administrador(Long idAdmin, String username, String password, List<Producto> productos) {
        this.idAdmin = idAdmin;
        this.username = username;
        this.password = password;
        this.productos = productos;
    }

    public Long getIdAdmin() {
        return idAdmin;
    }

    public void setIdAdmin(Long idAdmin) {
        this.idAdmin = idAdmin;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public List<Producto> getProductos() {
        return productos;
    }

    public void setProductos(List<Producto> productos) {
        this.productos = productos;
    }
    
    

}
