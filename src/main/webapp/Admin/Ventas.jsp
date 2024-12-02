<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.urbansoul.models.Venta" %>
<%@ page import="com.mycompany.urbansoul.models.Usuario" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ventas - Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <!-- NAV BAR -->
        <nav class="navbar navbar-expand-lg bg-dark border-bottom border-body" data-bs-theme="dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="Home.jsp">UrbanSoul Admin</a>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav nav-underline">
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="../index.jsp">Página Web</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../SvProductoAdmin">Productos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../SvContacto">Contactos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="../SvComprarProducto">Ventas</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <br>

        <div class="container-md">
            <h4 class="text-center">Ventas Realizadas</h4>
            <table class="table align-middle">
                <thead class="table-dark">
                    <tr>
                        <th scope="col">ID Venta</th>
                        <th scope="col">Fecha</th>
                        <th scope="col">Total</th>
                        <th scope="col">Usuario</th>
                        <th scope="col">Detalles</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        // Obtener la lista de ventas desde la sesión
                        List<Venta> listaVentas = (List<Venta>) request.getSession().getAttribute("listaVentas");
                        if (listaVentas == null || listaVentas.isEmpty()) {
                    %>
                    <tr>
                        <td colspan="5" class="text-center">No hay ventas realizadas</td>
                    </tr>
                    <%
                        } else {
                            for (Venta venta : listaVentas) {
                                Usuario usuario = venta.getUsuario(); // Obtener el usuario asociado a la venta
                    %>
                    <tr>
                        <th scope="row"><%= venta.getIdVenta() %></th>
                        <td><%= new SimpleDateFormat("dd/MM/yyyy").format(venta.getFechaVenta()) %></td>
                        <td>S/. <%= venta.getTotal() %></td>
                        <td><%= usuario != null ? usuario.getNombre() + " " + usuario.getApellido() : "Desconocido" %></td>
                        <td>
                            <a href="DetallesVenta.jsp?id=<%= venta.getIdVenta() %>" class="btn btn-info">Ver detalles</a>
                        </td>
                    </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>
        </div>
    </body>
</html>
