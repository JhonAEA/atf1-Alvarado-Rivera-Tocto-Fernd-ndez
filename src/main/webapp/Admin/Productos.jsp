<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.urbansoul.models.Producto" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Productos - Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
              rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
              crossorigin="anonymous">
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
                            <a class="nav-link active" href="../SvProducto">Productos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Contactos.jsp">Contactos</a>
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
                    </tr>
                </thead>
                <tbody>

                    <%
                        // Obtener la lista de productos desde la sesión
                        List<Producto> listaProductos = (List<Producto>) request.getSession().getAttribute("listaProductos");
                        int cont = 1; // Contador para enumerar los productos
                        if (listaProductos == null || listaProductos.isEmpty()) {
        
                        } else {
                        
                        for (Producto producto : listaProductos) {
                    %>
                    <tr>
                        <th scope="row"><%= producto.getIdProducto() %></th>
                        <td>
                            <img src="<%= producto.getUrlImagen() %>" class="figure-img img-fluid rounded" style="width: 100px; height: 100px;" alt="...">
                        </td>
                        <td><%= producto.getNombre() %></td>
                        <td><%= producto.getDescripcion() %></td>
                        <td><%= producto.getColor() %></td>
                        <td><%= producto.getPrecio() %></td>
                        <td><%= producto.getActivo() %></td>
                    </tr>
                    <%  
                        } 
                    }
                    %>
                </tbody>
            </table> 
        </div>


        <!-- FORMS -->

        <div class="container-md">
            <form action="../SvProducto" method="POST">
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
                <br>
                <button type="submit" class="btn btn-primary">Agregar Producto</button>
            </form>
        </div>


    </body>
</html>