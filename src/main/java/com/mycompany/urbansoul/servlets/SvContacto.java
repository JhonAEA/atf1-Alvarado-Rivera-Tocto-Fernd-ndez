/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.urbansoul.servlets;

import com.mycompany.urbansoul.models.Contacto;
import com.mycompany.urbansoul.models.controladores.ContactoDAO;
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
@WebServlet(name = "SvContacto", urlPatterns = {"/SvContacto"})
public class SvContacto extends HttpServlet {

    private EntityManagerFactory emf;
    private ContactoDAO control;

    @Override
    public void init() throws ServletException {
        // Inicializa el EntityManagerFactory una sola vez
        emf = Persistence.createEntityManagerFactory("UrbanSoulPU");
        control = new ContactoDAO(emf);
    }
        
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Contacto> listaContactos = new ArrayList<>();
        listaContactos = control.traerContactos();
        
        HttpSession misesion = request.getSession();
        misesion.setAttribute("listaContactos", listaContactos);
        
        response.sendRedirect("Admin/Contactos.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nombre = request.getParameter("nombre");
        String email = request.getParameter("email");
        String asunto = request.getParameter("asunto");
        String mensaje = request.getParameter("mensaje");
        
        Contacto cont = new Contacto();
        cont.setNombre(nombre);
        cont.setEmail(email);
        cont.setAsunto(asunto);
        cont.setMensaje(mensaje);
        
        control.crearContacto(cont);
        
        response.sendRedirect("Contactos.jsp");
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
