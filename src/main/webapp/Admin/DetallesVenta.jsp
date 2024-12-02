<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.mycompany.urbansoul.models.Venta" %>
<%@ page import="com.mycompany.urbansoul.models.DetalleVenta" %>
<%@ page import="com.mycompany.urbansoul.models.Producto" %>
<%@ page import="com.mycompany.urbansoul.models.Usuario" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalles de Venta</title>
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
                            <a class="nav-link" href="../index.jsp">Página Web</a>
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

        <%
String ventaId = request.getParameter("id");
Venta ventaSeleccionada = null;
if (ventaId != null) {
    Long idBuscado = Long.parseLong(ventaId);  // Convierte el ID de la venta a Long

    // Buscar la venta en la lista de ventas
    List<Venta> listaVentas = (List<Venta>) request.getSession().getAttribute("listaVentas");
        
    if (listaVentas != null) {
        for (Venta venta : listaVentas) {
            if (venta.getIdVenta().equals(idBuscado)) {
                ventaSeleccionada = venta;  // Si encontramos la venta, la asignamos
                break;  // Salimos del bucle una vez encontramos la venta
            }
        }
    }

    if (ventaSeleccionada != null) {
        // Aquí continúa el código para mostrar los detalles de la venta seleccionada
        Usuario usuario = ventaSeleccionada.getUsuario();  // Obtener el usuario asociado a la venta
        List<DetalleVenta> detalles = ventaSeleccionada.getDetalles();  // Obtener los detalles de la venta
        %>
        <!-- Código para mostrar los detalles de la venta -->
        <div class="container-md">
            <h1 class="text-center">Detalles de la Venta</h1>
            <div class="mb-4">
                <h3>Información de la Venta</h3>
                <p><strong>ID Venta:</strong> <%= ventaSeleccionada.getIdVenta() %></p>
                <p><strong>Fecha de la Venta:</strong> <%= new SimpleDateFormat("dd/MM/yyyy HH:mm").format(ventaSeleccionada.getFechaVenta()) %></p>
                <p><strong>Total de la Venta:</strong> S/. <%= ventaSeleccionada.getTotal() %></p>
                <p><strong>Usuario:</strong> <%= usuario != null ? usuario.getNombre() + " " + usuario.getApellido() : "Desconocido" %></p>
                <p><strong>Email:</strong> <%= usuario != null ? usuario.getEmail() : "No disponible" %></p>
                <p><strong>Dirección:</strong> <%= usuario != null ? usuario.getDireccion() : "No disponible" %></p>
            </div>

            <h5>Detalles de los Productos</h5>
            <table class="table table-striped">
                <thead class="table-dark">
                    <tr>
                        <th scope="col">Imagen del Producto</th>
                        <th scope="col">Producto</th>
                        <th scope="col">Cantidad</th>
                        <th scope="col">Precio Unitario</th>
                        <th scope="col">Total</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        double totalVenta = 0;
                        for (DetalleVenta detalle : detalles) {
                            Producto producto = detalle.getProducto();  // Obtener el producto de cada detalle
                            double totalProducto = detalle.getCantidad() * detalle.getPrecio();
                            totalVenta += totalProducto;
                    %>
                    <tr>
                        <td style="width: 200px; text-align: center;">
                            <img src="<%= producto.getUrlImagen() %>" class="figure-img img-fluid rounded" style="width: 100px; height: 100px; object-fit: cover" alt="...">
                        </td>
                        <td><%= producto != null ? producto.getNombre() : "Producto desconocido" %></td>
                        <td><%= detalle.getCantidad() %></td>
                        <td>S/. <%= detalle.getPrecio() %></td>
                        <td>S/. <%= totalProducto %></td>
                    </tr>
                    <% 
                        }
                    %>
                </tbody>
            </table>

            <div class="text-end">
                <h5>Total Final: S/. <%= totalVenta %></h5>
            </div>
        </div>
        <%
                } else {
        %>
        <p>Venta no encontrada.</p>
        <%
                }
            }
        %>

    </body>
</html>
