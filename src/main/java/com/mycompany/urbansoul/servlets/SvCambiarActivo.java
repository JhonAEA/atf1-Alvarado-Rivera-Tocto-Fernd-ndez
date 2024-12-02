/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.urbansoul.servlets;

import com.mycompany.urbansoul.models.Producto;
import com.mycompany.urbansoul.models.controladores.ProductoDAO;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author USER
 */
@WebServlet(name = "SvCambiarActivo", urlPatterns = {"/SvCambiarActivo"})
public class SvCambiarActivo extends HttpServlet {

    private EntityManagerFactory emf;
    private ProductoDAO control;

    @Override
    public void init() throws ServletException {
        // Inicializa el EntityManagerFactory una sola vez
        emf = Persistence.createEntityManagerFactory("UrbanSoulPU");
        control = new ProductoDAO(emf);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Obtener el ID del producto desde el formulario
            Long idProducto = Long.valueOf(request.getParameter("idProducto"));

            // Buscar el producto y actualizar su estado
            Producto producto = control.buscarProductoPorId(idProducto);
            if (producto != null) {
                producto.setActivo(producto.getActivo() == 1 ? 0 : 1); // Cambiar estado
                control.actualizarProducto(producto); // Guardar cambios
            }

            // Redirigir de vuelta a la página de productos
            response.sendRedirect("SvProductoAdmin");
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al cambiar el estado del producto: " + e.getMessage());
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
