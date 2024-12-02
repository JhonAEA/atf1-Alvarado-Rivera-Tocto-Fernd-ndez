package com.mycompany.urbansoul.models.controladores;

import com.mycompany.urbansoul.models.Producto;
import com.mycompany.urbansoul.persistencia.ProductoJpaController;
import com.mycompany.urbansoul.persistencia.exceptions.NonexistentEntityException;
import jakarta.persistence.EntityManagerFactory;
import java.util.List;

public class ProductoDAO {

    private ProductoJpaController producJpa;

    public ProductoDAO(EntityManagerFactory emf) {
        this.producJpa = new ProductoJpaController(emf);
    }

    //Create
    public void crearProducto(Producto producto) {
        producJpa.create(producto);
    }

    // Read - Obtener todos los productos
    public List<Producto> traerProductos() {
        return producJpa.findProductoEntities();
    }

    // Read - Obtener un producto por ID
    public Producto buscarProductoPorId(Long id) {
        return producJpa.findProducto(id);
    }

    // Update
    public void actualizarProducto(Producto producto) throws Exception {
        try {
            producJpa.edit(producto);
        } catch (NonexistentEntityException e) {
            throw new Exception("Error: Producto no encontrado para actualizar.");
        } catch (Exception e) {
            throw new Exception("Error al actualizar el producto: " + e.getMessage());
        }
    }
    
    // Delete
    public void eliminarProducto(Long id) throws Exception {
        try {
            producJpa.destroy(id);
        } catch (NonexistentEntityException e) {
            throw new Exception("Error: Producto no encontrado para eliminar.");
        } catch (Exception e) {
            throw new Exception("Error al eliminar el producto: " + e.getMessage());
        }
    }

}
