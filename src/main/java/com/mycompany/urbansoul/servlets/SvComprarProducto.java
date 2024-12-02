/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.urbansoul.servlets;

import com.mycompany.urbansoul.models.DetalleVenta;
import com.mycompany.urbansoul.models.Producto;
import com.mycompany.urbansoul.models.Usuario;
import com.mycompany.urbansoul.models.Venta;
import com.mycompany.urbansoul.models.controladores.ControladorDetalleVenta;
import com.mycompany.urbansoul.models.controladores.ControladorProducto;
import com.mycompany.urbansoul.models.controladores.ControladorUsuario;
import com.mycompany.urbansoul.models.controladores.ControladorVenta;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet(name = "SvComprarProducto", urlPatterns = {"/SvComprarProducto"})
public class SvComprarProducto extends HttpServlet {

    private EntityManagerFactory emf;
    private ControladorProducto controlPro;
    private ControladorUsuario controlUsu;
    private ControladorVenta controlVen;
    private ControladorDetalleVenta controlDet;

    @Override
    public void init() throws ServletException {
        super.init();
        // Inicializar EntityManagerFactory
        emf = Persistence.createEntityManagerFactory("UrbanSoulPU");
        controlUsu = new ControladorUsuario(emf);
        controlVen = new ControladorVenta(emf);
        controlDet = new ControladorDetalleVenta(emf);
        controlPro = new ControladorProducto(emf);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Obtener todas las ventas desde el controlador
            if (controlVen == null) {
                controlVen = new ControladorVenta(emf);  // Asegúrate de que el controlador esté inicializado
            }
            
            List<Venta> listaVentas = controlVen.traerVentas();  // Método que obtiene todas las ventas

            // Establecer la lista de ventas como atributo en el request
            HttpSession sesion = request.getSession();
            sesion.setAttribute("listaVentas", listaVentas);

            // Redirigir a la página Admin/Ventas.jsp
            response.sendRedirect("Admin/Ventas.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al obtener las ventas: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        EntityTransaction transaction = null;  // Para gestionar la transacción
        try {
            // Obtener parámetros del formulario
            Long idProducto = Long.valueOf(request.getParameter("idProducto"));
            int cantidad = Integer.parseInt(request.getParameter("cantidad"));
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String email = request.getParameter("email");
            String telefono = request.getParameter("telefono");
            String direccion = request.getParameter("direccion");
            String codigoPostal = request.getParameter("codigoPostal");

            // Instanciar controladores si no están inicializados
            if (controlUsu == null) {
                controlUsu = new ControladorUsuario(emf);
            }
            if (controlVen == null) {
                controlVen = new ControladorVenta(emf);
            }
            if (controlDet == null) {
                controlDet = new ControladorDetalleVenta(emf);
            }

            // Verificar si el usuario existe por su email
            Usuario usuario = controlUsu.buscarUsuarioPorEmail(email);
            if (usuario == null) {
                // Si no existe, crear un nuevo usuario
                usuario = new Usuario();
                usuario.setNombre(nombre);
                usuario.setApellido(apellido);
                usuario.setEmail(email);
                usuario.setTelefono(telefono);
                usuario.setDireccion(direccion);
                usuario.setCodigoPostal(codigoPostal);
                controlUsu.crearUsuario(usuario); // Guardar el usuario en la base de datos
            }

            // Crear el detalle de venta
            Producto producto = controlPro.buscarProductoPorId(idProducto);
            if (producto == null) {
                throw new IllegalArgumentException("El producto con ID " + idProducto + " no existe.");
            }

            double precioProducto = producto.getPrecio();
            double totalDetalle = precioProducto * cantidad;

            // Crear la venta
            Venta venta = new Venta();
            venta.setFechaVenta(new Date());
            venta.setUsuario(usuario);
            venta.setTotal(totalDetalle);

            // Iniciar transacción
            EntityManager em = emf.createEntityManager();
            transaction = em.getTransaction();
            transaction.begin();

            // Persistir la venta
            em.persist(venta);  // Guardar la venta para obtener su ID

            DetalleVenta detalleVenta = new DetalleVenta();
            detalleVenta.setProducto(producto);
            detalleVenta.setCantidad(cantidad);
            detalleVenta.setPrecio(precioProducto);
            detalleVenta.setVenta(venta);  // Asociar con la venta

            // Persistir el detalle de venta
            em.persist(detalleVenta);  // Guardar el detalle de venta

            // Confirmar la transacción
            transaction.commit();

            // Redirigir con un mensaje de compra exitosa
            request.setAttribute("mensajeExito", "Compra realizada con éxito!");
            request.getRequestDispatcher("Productos.jsp").forward(request, response);

            // Redirigir a la página de productos
            response.sendRedirect("Productos.jsp");

        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();  // Si algo falla, revertir la transacción
            }
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al procesar la compra: " + e.getMessage());
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
