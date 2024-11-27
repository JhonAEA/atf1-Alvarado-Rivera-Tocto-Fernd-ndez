package com.mycompany.urbansoul.models;

import jakarta.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
public class Producto implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idProducto;

    @Column(nullable = false)
    private String nombre;

    @Column(length = 255)
    private String descripcion;

    @Column(nullable = false)
    private String talla;

    @Column(nullable = false)
    private String color;

    @Column(nullable = false)
    private Double precio;

    @Column(nullable = false)
    private String urlImagen;
    
    @Column(nullable = false)
    private int activo;
    
    @OneToMany(mappedBy = "producto", cascade = CascadeType.ALL)
    private List<DetalleVenta> detalles;

    
    
    public Producto() {
    }

    public Producto(Long idProducto, String nombre, String descripcion, String talla, String color, Double precio, String urlImagen, int activo, List<DetalleVenta> detalles) {
        this.idProducto = idProducto;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.talla = talla;
        this.color = color;
        this.precio = precio;
        this.urlImagen = urlImagen;
        this.activo = activo;
        this.detalles = detalles;
    }

    public String getUrlImagen() {
        return urlImagen;
    }

    public void setUrlImagen(String urlImagen) {
        this.urlImagen = urlImagen;
    }
  

    public Long getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(Long idProducto) {
        this.idProducto = idProducto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getTalla() {
        return talla;
    }

    public void setTalla(String talla) {
        this.talla = talla;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public Double getPrecio() {
        return precio;
    }

    public void setPrecio(Double precio) {
        this.precio = precio;
    }

    public int getActivo() {
        return activo;
    }

    public void setActivo(int activo) {
        this.activo = activo;
    }

    public List<DetalleVenta> getDetalles() {
        return detalles;
    }

    public void setDetalles(List<DetalleVenta> detalles) {
        this.detalles = detalles;
    }
    
    }
