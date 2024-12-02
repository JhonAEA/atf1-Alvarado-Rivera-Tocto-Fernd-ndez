/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.urbansoul.servlets;

import com.mycompany.urbansoul.models.Producto;
import com.mycompany.urbansoul.models.controladores.ControladorProducto;
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
 *
 * @author USER
 */
@WebServlet(name = "SvProductoAdmin", urlPatterns = {"/SvProductoAdmin"})
public class SvProductoAdmin extends HttpServlet {

    private EntityManagerFactory emf;
    private ControladorProducto control;

    @Override
    public void init() throws ServletException {
        // Inicializa el EntityManagerFactory una sola vez
        emf = Persistence.createEntityManagerFactory("UrbanSoulPU");
        control = new ControladorProducto(emf);
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
        response.sendRedirect("Admin/Productos.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtener los datos del formulario
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        String talla = request.getParameter("talla");
        String color = request.getParameter("color");
        double precio = Double.parseDouble(request.getParameter("precio"));
        String url = request.getParameter("urlImagen");

        // Crear un nuevo producto
        Producto producto = new Producto();
        producto.setNombre(nombre);
        producto.setDescripcion(descripcion);
        producto.setTalla(talla);
        producto.setColor(color);
        producto.setPrecio(precio);
        producto.setUrlImagen(url);
        producto.setActivo(1);

        // Guardar el producto en la base de datos
        control.crearProducto(producto);

        // Redirigir a la página de productos
        response.sendRedirect("Admin/Productos.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
