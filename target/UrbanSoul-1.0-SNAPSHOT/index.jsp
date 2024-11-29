<%-- 
    Document   : index
    Created on : Sep 8, 2024, 11:28:31 PM
    Author     : USUARIO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Urban Soul</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
              rel="stylesheet" 
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
              crossorigin="anonymous">
        <link rel="stylesheet" href="css/stylesInicio.css" />
    </head>

    <body>
        <header>
            <div class="header-logo">
                <img src="images/logos/logoUrbanSoul.png" alt="Urban Soul">
            </div>
            <nav class="nav-menu">
                <a href="#">Inicio</a>
                <a href="Nosotros.jsp">Nosotros</a>
                <a href="Productos.jsp">Productos</a>
                <a href="Contactos.jsp">Contacto</a>
            </nav>
        </header>

        <!-- Main Content -->
        <main class="container my-5">
            <!-- Section: Inicio -->
            <section class="inicio text-center mb-5">
                <div class="row align-items-center">
                    <div class="col-lg-6">
                        <img src="images/logos/imagen_grande.jpg" class="img-fluid rounded" alt="Imagen grande">
                    </div>
                    <div class="col-lg-6">
                        <h1 class="mb-3">Urban Soul</h1>
                        <p>
                            Urban Soul desea liderar la transformación hacia una moda más sostenible y accesible,
                            ofreciendo productos contemporáneos de alta calidad que reflejen las últimas tendencias sin
                            comprometer el respeto por el medio ambiente.
                        </p>
                        <a href="#" class="btn btn-primary mt-3">Comprar ahora</a>
                    </div>
                </div>
                <div class="row mt-4">
                    <div class="col-4">
                        <img src="images/intro1.png" class="img-fluid rounded" alt="Imagen 1">
                    </div>
                    <div class="col-4">
                        <img src="images/intro2.png" class="img-fluid rounded" alt="Imagen 2">
                    </div>
                    <div class="col-4">
                        <img src="images/intro3.png" class="img-fluid rounded" alt="Imagen 3">
                    </div>
                </div>
            </section>

            <!-- Section: Productos -->
            <section id="productos" class="productos">
                <h2 class="text-center mb-4">Nuestros productos</h2>
                <div class="row g-4">
                    <!-- Producto 1 -->
                    <div class="col-md-4">
                        <div class="card h-100">
                            <img src="images/polo.jpg" class="card-img-top" alt="Producto 1">
                            <div class="card-body">
                                <h5 class="card-title">Polos</h5>
                                <p class="card-text">
                                    Urban Soul ofrece una variedad de prendas de vestir contemporáneas
                                    en este apartado presentaremos los polos en tendencia.
                                </p>
                            </div>
                            <div class="card-footer text-center">
                                <a href="#" class="btn btn-primary">Ver más</a>
                            </div>
                        </div>
                    </div>
                    <!-- Producto 2 -->
                    <div class="col-md-4">
                        <div class="card h-100">
                            <img src="images/pantalon.jpg" class="card-img-top" alt="Producto 2">
                            <div class="card-body">
                                <h5 class="card-title">Pantalones</h5>
                                <p class="card-text">
                                    Urban Soul ofrece una variedad de prendas de vestir contemporáneas
                                    en este apartado presentaremos pantalones en tendencia.
                                </p>
                            </div>
                            <div class="card-footer text-center">
                                <a href="#" class="btn btn-primary">Ver más</a>
                            </div>
                        </div>
                    </div>
                    <!-- Producto 3 -->
                    <div class="col-md-4">
                        <div class="card h-100">
                            <img src="images/gorro.jfif.jpg" class="card-img-top" alt="Producto 3">
                            <div class="card-body">
                                <h5 class="card-title">Accesorios</h5>
                                <p class="card-text">
                                    La tienda ofrece una selección de accesorios eco-friendly como sombreros,
                                    fabricados con materiales sostenibles.
                                </p>
                            </div>
                            <div class="card-footer text-center">
                                <a href="#" class="btn btn-primary">Ver más</a>
                            </div>
                        </div>
                    </div>
                    <!-- Repite el mismo formato para los demás productos -->
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


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-LHfZ26jvjFRhEZFn+EmESZufQmDEjiS4Em7dsDbCSPI3G9Fepwtn9ow5lz65a4fh" 
        crossorigin="anonymous"></script>
    </body>

</html>
