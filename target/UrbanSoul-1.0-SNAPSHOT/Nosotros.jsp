<%-- 
    Document   : Nosotros
    Created on : Sep 8, 2024, 11:48:11 PM
    Author     : USUARIO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Urban Soul - Nosotros</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/stylesNosotros.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
          rel="stylesheet" 
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
          crossorigin="anonymous">
    <style>
        body {
            background-color: #F6F4F3;
            font-family: 'Inter', sans-serif;
        }

        .header-logo img {
            max-height: 70px;
        }

        .main-logo img {
            max-width: 150px;
            margin: auto;
            display: block;
        }

        .main-text {
            line-height: 1.8;
            text-align: justify;
        }

        h1, h2 {
            color: #343a40;
        }

        footer {
            background-color: #dcdcdc;
        }

        footer p, footer a img {
            color: white;
        }

        footer img {
            width: 40px;
        }
    </style>
</head>

<body>
    <header>
            <div class="header-logo">
                <img src="images/logos/logoUrbanSoul.png" alt="Urban Soul">
            </div>
            <nav class="nav-menu">
                <a href="index.jsp">Inicio</a>
                <a href="Nosotros.jsp">Nosotros</a>
                <a href="Productos.jsp">Productos</a>
                <a href="Contactos.jsp">Contacto</a>
            </nav>
        </header>

    <!-- Main Content -->
    <main class="container my-5">
        <!-- Título y Logo -->
        <div class="text-center mb-5">
            <div class="main-logo">
                <img src="images/logos/logoUrbanSoul.png" alt="Urban Soul">
            </div>
            <h1 class="mt-4">Acerca de Nosotros</h1>
        </div>

        <!-- Historia -->
        <section class="row align-items-center mb-5">
            <div class="col-md-6 mb-4 mb-md-0">
                <h2>Historia de Urban Soul</h2>
                <p>
                    Urban Soul nació en la vibrante ciudad de Lima, Perú en el año 2022, fruto de la visión de dos jóvenes emprendedores,
                    Genesis Palomares y Angel Porro. Ambos compartían una pasión por la moda y un fuerte compromiso con el medio ambiente.
                </p>
                <p>
                    Observando la creciente demanda de ropa asequible, pero conscientes de las repercusiones ecológicas de la industria de la moda,
                    decidieron crear una marca que no solo estuviera al día con las últimas tendencias, sino que también promoviera un enfoque sostenible 
                    en cada paso de su cadena de suministro.
                </p>
            </div>
            <div class="col-md-6 text-center">
                <img src="images/logos/logoUrbanSoul.png" class="img-fluid rounded" alt="Historia de Urban Soul">
            </div>
        </section>

        <!-- Esencia -->
        <section class="row align-items-center mb-5">
            <div class="col-md-6 text-center order-md-2">
                <img src="images/intro2.png" class="img-fluid rounded" alt="Nuestra Esencia">
            </div>
            <div class="col-md-6 order-md-1">
                <h2>Nuestra Esencia</h2>
                <p>
                    El nombre "URBAN SOUL" surge de la fusión de las palabras "URBAN" (Urbano) y "SOUL" (Alma), reflejando la esencia de la
                    marca: una mezcla de estilos urbanos y tendencias actuales, accesibles para todos y para amantes de la moda.
                </p>
            </div>
        </section>

        <!-- Logros -->
        <section class="row align-items-center">
            <div class="col-md-6 mb-4 mb-md-0">
                <h2>Nuestros Logros</h2>
                <p>
                    Los primeros diseños de Urban Soul fueron un éxito instantáneo. Su línea de lanzamiento, que incluía camisetas básicas y
                    oversize, jeans reciclados y vestidos hechos de fibras orgánicas, capturó la atención de un público joven y consciente
                    del impacto ambiental de sus compras.
                </p>
                <p>
                    A medida que la marca creció, también lo hizo su oferta de productos, incluyendo ahora accesorios y calzado eco-friendly.
                </p>
            </div>
            <div class="col-md-6 text-center">
                <img src="images/Logro.jpg" class="img-fluid rounded" alt="Nuestros Logros" style="height: 250px">
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
