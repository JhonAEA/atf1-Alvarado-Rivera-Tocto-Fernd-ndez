<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.urbansoul.models.Producto" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Productos - Admin</title>
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
                            <a class="nav-link" aria-current="page" href="../index.jsp">Pagina Web</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="../SvProductoAdmin">Productos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../SvContacto">Contactos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Ventas.jsp">Ventas</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <br>



        <div class="container-md">
            <h4 class="text-center">Lista de Productos</h4>
            <div class="d-flex justify-content-end mb-3">
                <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#agregar-producto">Agregar Producto</button>
            </div>
            <table class="table align-middle">
                <thead class="table-dark">
                    <tr>
                        <th scope="col">ID Producto</th>
                        <th scope="col">Imagen</th>
                        <th scope="col">Nombre del Producto</th>
                        <th scope="col">Descripción</th>
                        <th scope="col">Color</th>
                        <th scope="col">Precio</th>
                        <th scope="col">Activo (0-1)</th>
                        <th scope="col">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        // Obtener la lista de productos desde la sesión
                        List<Producto> listaProductos = (List<Producto>) request.getSession().getAttribute("listaProductos");
                        if (listaProductos == null || listaProductos.isEmpty()) {
                    %>
                    <tr>
                        <td colspan="8" class="text-center">No hay productos disponibles</td>
                    </tr>
                    <%
                        } else {
                            for (Producto producto : listaProductos) {
                    %>
                    <tr>
                        <th scope="row"><%= producto.getIdProducto() %></th>
                        <td>
                            <img src="<%= producto.getUrlImagen() %>" class="figure-img img-fluid rounded" style="width: 100px; height: 100px; object-fit: cover" alt="...">
                        </td>
                        <td><%= producto.getNombre() %></td>
                        <td><%= producto.getDescripcion() %></td>
                        <td><%= producto.getColor() %></td>
                        <td>S/. <%= producto.getPrecio() %></td>
                        <td><%= producto.getActivo() %></td>
                        <td>
                            <form method="post" action="../SvCambiarActivo">
                                <input type="hidden" name="idProducto" value="<%= producto.getIdProducto() %>">
                                <button type="submit" class="btn <%= producto.getActivo() == 1 ? "btn-danger" : "btn-success" %>">
                                    <%= producto.getActivo() == 1 ? "Desactivar" : "Activar" %>
                                </button>
                            </form>
                        </td>
                    </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>


            <br>



            <!-- Modal -->
            <div class="modal fade" id="agregar-producto" tabindex="-1" aria-labelledby="agregar-producto-label" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h5 class="modal-title" id="agregar-producto-label">Agregar producto</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form action="../SvProductoAdmin" method="POST">
                            <!-- Modal Body -->
                            <div class="modal-body">

                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="nombreProducto" name="nombre" required>
                                    <label for="nombreProducto">Nombre del producto</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="descripcionProducto" name="descripcion" required>
                                    <label for="descripcionProducto">Descripción</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="colorProducto" name="color" required>
                                    <label for="colorProducto">Color</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="text" step="0.01" class="form-control" id="tallaProducto" name="talla" required>
                                    <label for="precioProducto">Talla</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="number" step="0.01" class="form-control" id="precioProducto" name="precio" required>
                                    <label for="precioProducto">Precio (S/.)</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="urlImagen" name="urlImagen">
                                    <label for="urlImagen">Url de imagen</label>
                                </div>

                            </div>

                            <!-- Modal Footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                                <button type="submit" class="btn btn-primary">Guardar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>


    </body>
</html>