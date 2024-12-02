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
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet para manejar productos.
 */
@WebServlet(name = "SvProducto", urlPatterns = {"/SvProducto"})
public class SvProducto extends HttpServlet {

    private EntityManagerFactory emf;
    private ProductoDAO control;

    @Override
    public void init() throws ServletException {
        // Inicializa el EntityManagerFactory una sola vez
        emf = Persistence.createEntityManagerFactory("UrbanSoulPU");
        control = new ProductoDAO(emf);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtener todos los productos y enviarlos a la sesión
        List<Producto> listaProductos = new ArrayList<>();
        listaProductos = control.traerProductos();

        HttpSession sesion = request.getSession();
        sesion.setAttribute("listaProductos", listaProductos);

        // Redirigir a la página de productos
        response.sendRedirect("Productos.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Servlet para manejo de productos";
    }
}
