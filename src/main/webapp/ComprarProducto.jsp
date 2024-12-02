<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.urbansoul.models.Producto" %>
<%
    // Obtener el ID del producto desde la URL
    String idProducto = request.getParameter("id");
    List<Producto> listaProductos = (List<Producto>) request.getSession().getAttribute("listaProductos");
    Producto productoSeleccionado = null;
    
    // Buscar el producto en la lista
    if (listaProductos != null) {
        for (Producto producto : listaProductos) {
        Long idBuscado = Long.parseLong(idProducto);
            if (producto.getIdProducto().equals(idBuscado)) {
                productoSeleccionado = producto;
                break;
            }
        }
    }
%>


<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Formulario de Compra</title>
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

        <script>
            function actualizarCosto() {
                const cantidad = document.getElementById('cantidad').value;
                const precio = <%= productoSeleccionado.getPrecio() %>;
                document.getElementById('costoTotal').textContent = (cantidad * precio).toFixed(2);
            }
        </script>
    </head>

    <body class="bg-light">

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
        <% if (productoSeleccionado != null) { %>

        <main class="py-5" style="background-color: #F6F4F3;">
            <div class="container">
                <h1 class="card-title text-center mb-4">Formulario de Compra</h1>
                <div class="row">
                    <div class="col-md-6 text-center mb-4 d-flex flex-column justify-content-center align-items-center">
                        <img src="<%= productoSeleccionado.getUrlImagen() %>"
                             alt="<%= productoSeleccionado.getNombre() %>"
                             class="card-img-top img-fluid"
                             style="max-height: 250px; width: 50%; object-fit: cover; border-radius: 4px; border: 1px solid gray">
                        <h2 class="mt-3"><%= productoSeleccionado.getNombre() %></h2>
                        <h5 class="mt-3"><%= productoSeleccionado.getDescripcion()%></h5>
                        <h5 class="mt-3">Talla Disponible: <%= productoSeleccionado.getTalla()%></h5>
                        <h5 class="mt-3">Color: <%= productoSeleccionado.getColor()%></h5>
                        <h3 class="mt-3">Precio unitario: S/. <%= productoSeleccionado.getPrecio() %></h3>
                    </div>

                    <!-- Columna del formulario -->
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <form action="SvComprarProducto" method="POST">
                                    <!-- Producto seleccionado -->
                                    <input type="hidden" name="idProducto" value="<%= productoSeleccionado.getIdProducto() %>">

                                    <div class="row mb-3">
                                        <!-- Campo Cantidad -->
                                        <div class="col-md-6">
                                            <label for="cantidad" class="form-label">Cantidad</label>
                                            <input type="number" id="cantidad" name="cantidad" class="form-control" value="1" min="1" onchange="actualizarCosto()">
                                        </div>

                                        <!-- Campo Costo Total -->
                                        <div class="col-md-6">
                                            <label class="form-label">Costo total</label>
                                            <p class="form-control-plaintext">S/. <span id="costoTotal"><%= productoSeleccionado.getPrecio() %></span></p>
                                        </div>
                                    </div>


                                    <h5 class="mb-3">Datos del Usuario</h5>
                                    <div class="mb-3">
                                        <label for="nombre" class="form-label">Nombre</label>
                                        <input type="text" id="nombre" name="nombre" class="form-control" required>
                                    </div>

                                    <div class="mb-3">
                                        <label for="apellido" class="form-label">Apellido</label>
                                        <input type="text" id="apellido" name="apellido" class="form-control" required>
                                    </div>

                                    <div class="mb-3">
                                        <label for="email" class="form-label">Email</label>
                                        <input type="email" id="email" name="email" class="form-control" required>
                                    </div>

                                    <div class="mb-3">
                                        <label for="telefono" class="form-label">Teléfono</label>
                                        <input type="tel" id="telefono" name="telefono" class="form-control" required>
                                    </div>

                                    <div class="mb-3">
                                        <label for="direccion" class="form-label">Dirección</label>
                                        <input type="text" id="direccion" name="direccion" class="form-control" required>
                                    </div>

                                    <div class="mb-3">
                                        <label for="codigoPostal" class="form-label">Código Postal</label>
                                        <input type="text" id="codigoPostal" name="codigoPostal" class="form-control" required>
                                    </div>

                                    <button type="submit" class="btn btn-primary w-100">Confirmar compra</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <% } %>

        <!-- Footer -->
        <footer class="text-light py-4">
            <div class="container text-center">
                <p class="mb-3" style="color: black">&copy; 2024 Urban Soul. Todos los derechos reservados.</p>
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

    </body>

</html>
