<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin - UrbanSoul</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
              rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
              crossorigin="anonymous">
    </head>
    <body>
        <!-- NAV BAR -->
        <nav class="navbar navbar-expand-lg bg-dark border-bottom border-body" data-bs-theme="dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">UrbanSoul Admin</a>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav nav-underline">
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="../index.jsp">Pagina Web</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../SvProductoAdmin">Productos</a>
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

        <!-- Vista Home -->
        <div class="container-md">
            <!-- Descripción de la empresa -->
            <div class="text-center mb-5">
                <h1>Bienvenido al Panel de Administración de UrbanSoul</h1>
                <p class="lead">
                    En UrbanSoul nos especializamos en ropa moderna y estilizada para todos. Este panel 
                    de administración te permite gestionar productos, revisar contactos, monitorear ventas 
                    y mucho más.
                </p>
            </div>

            <!-- Cartas de funcionalidades -->
            <div class="row row-cols-1 row-cols-md-3 g-4">
                <!-- Tarjeta de Productos -->
                <div class="col">
                    <div class="card h-100 shadow-sm">
                        <img src="../images/admin/GestionProductos.jpg" class="card-img-top img-fixed" alt="Productos" style="height: 250px">
                        <div class="card-body">
                            <h5 class="card-title">Gestión de Productos</h5>
                            <p class="card-text">
                                Administra todos los productos disponibles en tu tienda. Añade, edita o elimina productos según sea necesario.
                            </p>
                        </div>
                        <div class="card-footer text-center">
                            <a href="../SvProductoAdmin" class="btn btn-primary">Ir a Productos</a>
                        </div>
                    </div>
                </div>
                <!-- Tarjeta de Contactos -->
                <div class="col">
                    <div class="card h-100 shadow-sm">
                        <img src="../images/admin/GestionContactos.jpg" class="card-img-top img-fixed" alt="Contactos" style="height: 250px">
                        <div class="card-body">
                            <h5 class="card-title">Gestión de Contactos</h5>
                            <p class="card-text">
                                Revisa los mensajes de contacto enviados por tus clientes. Mantente en comunicación con ellos.
                            </p>
                        </div>
                        <div class="card-footer text-center">
                            <a href="../SvContacto" class="btn btn-primary">Ver Contactos</a>
                        </div>
                    </div>
                </div>
                <!-- Tarjeta de Ventas -->
                <div class="col">
                    <div class="card h-100 shadow-sm">
                        <img src="../images/admin/GestionVentas.jpg" class="card-img-top img-fixed" alt="Ventas" style="height: 250px">
                        <div class="card-body">
                            <h5 class="card-title">Gestión de Ventas</h5>
                            <p class="card-text">
                                Supervisa y analiza las ventas realizadas en tu tienda. Obtén reportes detallados.
                            </p>
                        </div>
                        <div class="card-footer text-center">
                            <a href="Ventas.jsp" class="btn btn-primary">Ir a Ventas</a>
                        </div>
                    </div>
                </div>
            </div>

            <style>
                /* Mantener las imágenes proporcionales y del mismo tamaño */
                .img-fixed {
                    height: 150px; /* Establece la altura deseada */
                    width: 100%; /* Asegura que ocupe todo el ancho de la tarjeta */
                    object-fit: cover; /* Recorta proporcionalmente para llenar el área */
                    object-position: center; /* Centra la imagen */
                }
            </style>

        </div>

        <br>
        <footer class="text-center mt-5">
            <p>&copy; 2024 UrbanSoul. Todos los derechos reservados.</p>
        </footer>
    </body>
</html>
