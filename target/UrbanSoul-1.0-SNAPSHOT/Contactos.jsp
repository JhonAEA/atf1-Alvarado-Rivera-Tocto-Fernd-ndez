<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.urbansoul.models.Contacto" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Urban Soul - Contacto</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="css/stylesContactos.css">
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
                <a href="#">Contacto</a>
            </nav>
        </header>

        <!-- Sección de Contacto -->
        <main class="py-5">
            <div class="container">
                <h1 class="text-center mb-4">¿Cómo contactarnos?</h1>
                <div class="row">

                    <!-- Ver solicitudes -->
                    <div class="col-lg-6 mt-4 mt-lg-0">
                        <p class="text-justify">
                            En Urban Soul, tu opinión es muy importante para nosotros. Si tienes alguna pregunta, sugerencia o reclamo, no dudes en ponerte en contacto a través de los siguientes medios:
                        </p>
                        <ul class="list-unstyled">
                            <li><strong>Correo electrónico:</strong> Puedes enviarnos un mensaje a <a href="mailto:contacto@urbansoul.com">contacto@urbansoul.com</a> para cualquier consulta relacionada con productos, pedidos o servicios.</li>
                            <li><strong>Redes sociales:</strong> Estamos activos en nuestras redes sociales, como Facebook, Instagram y WhatsApp. Encuentra nuestros enlaces en la parte inferior de la página.</li>
                            <li><strong>Formulario de contacto:</strong> Si prefieres hacerlo de manera más directa, puedes completar nuestro formulario de contacto, como lo estás haciendo ahora, para que nuestro equipo te responda a la brevedad.</li>
                        </ul>
                        <h6 class="mt-4">¿Por qué es importante contactarnos?</h6>
                        <p class="text-justify">
                            La comunicación con nuestros clientes es clave para ofrecer un servicio excepcional. Al recibir tus comentarios, sugerencias o reclamos, podemos mejorar nuestros productos y la experiencia de compra. Además, esto nos permite mantenernos conectados y comprometidos con nuestra comunidad, lo que nos motiva a seguir ofreciendo lo mejor de nosotros.
                        </p>
                        <p class="text-justify">
                            Nos interesa saber tu opinión para seguir creciendo y brindar un servicio más cercano y adaptado a tus necesidades. ¡Tu voz hace la diferencia!
                        </p>
                    </div>

                    <!-- Formulario -->
                    <div class="col-lg-6 ">
                        <form action="SvContacto" method="POST" class="p-4 bg-white rounded shadow-sm" style="background-color: #F6F4F3">
                            <div class="mb-3">
                                <label for="nombre" class="form-label">Nombre:</label>
                                <input type="text" id="nombre" name="nombre" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">E-mail:</label>
                                <input type="email" id="email" name="email" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label for="asunto" class="form-label">Asunto:</label>
                                <select id="asunto" name="asunto" class="form-select" required>
                                    <option value="" disabled selected>Selecciona un asunto</option>
                                    <option value="Reclamo">Reclamo</option>
                                    <option value="Sugerencia">Sugerencia</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="mensaje" class="form-label">Mensaje:</label>
                                <textarea id="mensaje" name="mensaje" class="form-control" rows="4" required></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Enviar</button>
                        </form>
                    </div>


                </div>
            </div>
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

    </body>

</html>
