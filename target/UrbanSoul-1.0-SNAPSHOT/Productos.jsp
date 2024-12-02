<%-- 
    Document   : Productos
    Created on : Sep 8, 2024, 11:50:45 PM
    Author     : USUARIO
--%>
<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.urbansoul.models.Producto" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Urban Soul - Productos</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/stylesProductos.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
              rel="stylesheet" 
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
              crossorigin="anonymous">

        <style>
            html, body {
                height: 100%;
                margin: 0;
                display: flex;
                flex-direction: column;
            }

            main {
                flex: 1; /* Toma el espacio restante entre el header y el footer */
            }
        </style>

    </head>

    <body style="background-color: #F6F4F3">


        <!-- Header -->
        <header style="position: static;">
            <div class="header-logo">
                <img src="images/logos/logoUrbanSoul.png" alt="Urban Soul">
            </div>
            <nav class="nav-menu">
                <a href="index.jsp">Inicio</a>
                <a href="Nosotros.jsp">Nosotros</a>
                <a href="SvProducto">Productos</a>
                <a href="Contactos.jsp">Contacto</a>
            </nav>
        </header>

        <!-- Main Section -->
        <main class="container my-5">
            <!-- Título de la Página -->
            <section class="text-center mb-4">
                <h1>TIENDA EN LÍNEA</h1>
                <p class="lead">
                    Urban Soul es una marca de moda que se destaca por su enfoque en la venta de polos over-size. 
                    Fundada con la visión de ofrecer prendas que fusionan estilo urbano y comodidad.
                </p>
            </section>

            <!-- Productos -->
            <section class="productos">
                <div class="row g-4">
                    <%
                        // Obtener la lista de productos desde la sesión
                        List<Producto> listaProductos = (List<Producto>) request.getSession().getAttribute("listaProductos");
                        boolean hayProductosActivos = false;

                        if (listaProductos != null && !listaProductos.isEmpty()) {
                            // Comprobar si hay al menos un producto activo
                            for (Producto producto : listaProductos) {
                                if (producto.getActivo() == 1) {
                                    hayProductosActivos = true;
                                    break;
                                }
                            }
                        }

                        if (listaProductos == null || listaProductos.isEmpty() || !hayProductosActivos) {
                    %>
                    <!-- Mensaje cuando no hay productos activos -->
                    <div class="col-12">
                        <div class="alert alert-warning text-center py-5">
                            <h4>No hay productos disponibles en este momento</h4>
                            <p class="mb-0">Por favor, vuelva más tarde para ver nuestros productos.</p>
                        </div>
                    </div>
                    <%
                        }

                        if (listaProductos != null && !listaProductos.isEmpty()) {
                            for (Producto producto : listaProductos) {
                                if (producto.getActivo() == 1) { // Mostrar solo productos activos
                    %>
                    <!-- Producto activo -->
                    <div class="col-md-4">
                        <div class="card h-100">
                            <img src="<%= producto.getUrlImagen() %>" class="card-img-top img-fixed img-fluid" alt="Foto Producto" style="height: 250px; object-fit: cover">
                            <div class="card-body text-center">
                                <h5 class="card-title"><%= producto.getNombre() %></h5>
                                <p class="card-text">S/. <%= producto.getPrecio() %></p>
                            </div>
                            <div class="card-footer text-center">
                                <a href="#viewBuy" class="btn btn-primary">Comprar ahora</a>
                            </div>
                        </div>
                    </div>
                    <%
                                }
                            }
                        }
                    %>
                </div>
            </section>






        </main>

        <!-- Footer -->
        <footer class="text-light py-4">
            <div class="container text-center">
                <!-- Texto del footer -->
                <p class="mb-3" style="color: black">&copy; 2024 Urban Soul. Todos los derechos reservados.</p>
                <!-- Iconos del footer -->
                <div class="d-flex justify-content-center gap-4">
                    <a href="https://www.facebook.com/?locale=es_LA">
                        <img src="images/logos/face.png" alt="Facebook" class="img-fluid" style="width: 40px;">
                    </a>
                    <a href="#">
                        <img src="images/logos/correo.png" alt="Correo" class="img-fluid" style="width: 40px;">
                    </a>
                    <a href="https://www.instagram.com/urbansoul.pe/">
                        <img src="images/logos/insta.png" alt="Instagram" class="img-fluid" style="width: 40px;">
                    </a>
                    <a href="https://web.whatsapp.com/">
                        <img src="images/logos/wsp.png" alt="Whatsapp" class="img-fluid" style="width: 40px;">
                    </a>
                    <a href="Admin/Home.jsp">
                        <img src="images/logos/admin.png" alt="Admin" class="img-fluid" style="width: 40px;">
                    </a>
                </div>
            </div>
        </footer>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-LHfZ26jvjFRhEZFn+EmESZufQmDEjiS4Em7dsDbCSPI3G9Fepwtn9ow5lz65a4fh" 
        crossorigin="anonymous"></script>
    </body>

</html>
