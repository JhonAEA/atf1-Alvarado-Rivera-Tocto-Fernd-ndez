<%-- 
    Document   : Admin
    Created on : 26 nov 2024, 13:56:14
    Author     : USER
--%>
<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.urbansoul.models.Contacto" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
              rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
              crossorigin="anonymous">
    </head>
    <body style="background-color: #F6F4F3">
        <!-- NAV BAR -->
        <nav class="navbar navbar-expand-lg bg-dark border-bottom border-body" data-bs-theme="dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="Home.jsp">UrbanSoul Admin</a>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav nav-underline">
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="../index.jsp">Pagina Web</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../SvProducto">Productos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="#">Contactos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Ventas.jsp">Ventas</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <br>
        
        <!-- Tabla Contactos-->

        <div class="container-md">
            <table class="table align-middle">
                <thead class="table-dark">
                    <tr>
                        <th scope="col">ID Contacto</th>
                        <th scope="col">Nombre del contacto</th>
                        <th scope="col">Email</th>
                        <th scope="col">Asunto</th>
                        <th scope="col">Mensaje</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th scope="row">1</th>
                        <td>Jhon</td>
                        <td>jhon@example.com</td>
                        <td>Reclamo</td>
                        <td>Mensaje de Reclamo</td>
                    </tr>
                </tbody>
            </table> 
        </div>
        
        <!-- Ver solicitudes -->
                    <div class="col-lg-6 mt-4 mt-lg-0">
                        <form action="../SvContacto" method="GET" class="p-4 bg-white rounded shadow-sm">
                            <button type="submit" name="Ver" class="btn btn-secondary w-100 mb-3">Ver solicitudes de contacto</button>
                            <% 
                                List<Contacto> listaContactos = (List) request.getSession().getAttribute("listaContactos");
                                if (listaContactos != null && !listaContactos.isEmpty()) { 
                            %>
                            <h5 class="text-center">Lista de Contactos</h5>
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Nombre</th>
                                        <th>E-mail</th>
                                        <th>Asunto</th>
                                        <th>Mensaje</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        int cont = 1;
                                        for (Contacto contacto : listaContactos) {
                                    %>
                                    <tr>
                                        <td><%= cont++ %></td>
                                        <td><%= contacto.getNombre() %></td>
                                        <td><%= contacto.getEmail() %></td>
                                        <td><%= contacto.getAsunto() %></td>
                                        <td><%= contacto.getMensaje() %></td>
                                    </tr>
                                    <% } %>
                                </tbody>
                            </table>
                            <% } else { %>
                            <p class="text-center text-muted">No hay solicitudes de contacto registradas.</p>
                            <% } %>
                        </form>
                    </div>

        <br>

    </body>
</html>
