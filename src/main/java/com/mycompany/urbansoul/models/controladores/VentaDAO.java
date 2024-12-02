package com.mycompany.urbansoul.models.controladores;

import com.mycompany.urbansoul.models.Venta;
import com.mycompany.urbansoul.persistencia.VentaJpaController;
import com.mycompany.urbansoul.persistencia.exceptions.NonexistentEntityException;
import jakarta.persistence.EntityManagerFactory;
import java.util.List;

public class VentaDAO {

    private VentaJpaController venJpa;

    public VentaDAO(EntityManagerFactory emf) {
        this.venJpa = new VentaJpaController(emf);
    }

    // Create - Crear una nueva venta
    public void crearVenta(Venta venta) {
        venJpa.create(venta);
    }

    // Read - Obtener todas las ventas
    public List<Venta> traerVentas() {
        return venJpa.findVentaEntities();
    }

    // Read - Obtener una venta por ID
    public Venta buscarVentaPorId(Long id) {
        return venJpa.findVenta(id);
    }

    // Update - Actualizar una venta existente
    public void actualizarVenta(Venta venta) throws Exception {
        try {
            venJpa.edit(venta);
        } catch (NonexistentEntityException e) {
            throw new Exception("Error: Venta no encontrada para actualizar.");
        } catch (Exception e) {
            throw new Exception("Error al actualizar la venta: " + e.getMessage());
        }
    }

    // Delete - Eliminar una venta por ID
    public void eliminarVenta(Long id) throws Exception {
        try {
            venJpa.destroy(id);
        } catch (NonexistentEntityException e) {
            throw new Exception("Error: Venta no encontrada para eliminar.");
        } catch (Exception e) {
            throw new Exception("Error al eliminar la venta: " + e.getMessage());
        }
    }
}
