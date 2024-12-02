package com.mycompany.urbansoul.models.controladores;

import com.mycompany.urbansoul.models.DetalleVenta;
import com.mycompany.urbansoul.persistencia.DetalleVentaJpaController;
import com.mycompany.urbansoul.persistencia.exceptions.NonexistentEntityException;
import jakarta.persistence.EntityManagerFactory;
import java.util.List;

public class DetalleVentaDAO {

    private DetalleVentaJpaController detaJpa;

    public DetalleVentaDAO(EntityManagerFactory emf) {
        this.detaJpa = new DetalleVentaJpaController(emf);
    }

    // Create - Crear un nuevo detalle de venta
    public void crearDetalleVenta(DetalleVenta detalleVenta) {
        detaJpa.create(detalleVenta);
    }

    // Read - Obtener todos los detalles de venta
    public List<DetalleVenta> traerDetallesVenta() {
        return detaJpa.findDetalleVentaEntities();
    }

    // Read - Obtener un detalle de venta por ID
    public DetalleVenta buscarDetalleVentaPorId(Long id) {
        return detaJpa.findDetalleVenta(id);
    }

    // Update - Actualizar un detalle de venta existente
    public void actualizarDetalleVenta(DetalleVenta detalleVenta) throws Exception {
        try {
            detaJpa.edit(detalleVenta);
        } catch (NonexistentEntityException e) {
            throw new Exception("Error: Detalle de venta no encontrado para actualizar.");
        } catch (Exception e) {
            throw new Exception("Error al actualizar el detalle de venta: " + e.getMessage());
        }
    }

    // Delete - Eliminar un detalle de venta por ID
    public void eliminarDetalleVenta(Long id) throws Exception {
        try {
            detaJpa.destroy(id);
        } catch (NonexistentEntityException e) {
            throw new Exception("Error: Detalle de venta no encontrado para eliminar.");
        } catch (Exception e) {
            throw new Exception("Error al eliminar el detalle de venta: " + e.getMessage());
        }
    }

}
