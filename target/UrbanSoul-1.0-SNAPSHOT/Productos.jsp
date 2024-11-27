<%-- 
    Document   : Productos
    Created on : Sep 8, 2024, 11:50:45 PM
    Author     : USUARIO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Urban Soul - Productos</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/stylesProductos.css">
    </head>

    <body>
        <header>
            <div class="header-logo">
                <img src="images/logos/logoUrbanSoul.png" alt="Urban Soul">
            </div>
            <nav class="nav-menu">
                <a href="index.jsp">Inicio</a>
                <a href="Nosotros.jsp">Nosotros</a>
                <a href="#">Productos</a>
                <a href="Contactos.jsp">Contacto</a>
            </nav>
        </header>

        <div class="main">
            <div class="main-info">
                <h1>TIENDA EN LINEA</h1>
                <p>Urban Soul es una marca de moda que se destaca por su enfoque en la venta de polos over-size. Fundada con
                    la visión de ofrecer prendas de vestir que fusionan el estilo urbano contemporáneo con la comodidad y la
                    expresión personal, Urban Soul ha capturado la esencia de la moda moderna.</p>
            </div>
            <div class="box-products">
                <div class="card-products">
                    <img src="images/intro1.png" alt="Foto Producto 1">
                    <h2>Nombre Producto</h2>
                    <p>S/. 0.00</p>
                    <div class="btn-buy">
                        <a href="#viewBuy">Comprar ahora</a>
                    </div>
                </div>
            </div>


            <div id="viewBuy" class="view-buy">
                <div class="view-content">

                    <div class="view-close">
                        <a href="#">&times;</a>
                    </div>
                    <h2>Product Name</h2>
                    <p>Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
                        incididunt ut
                        labore et dolore magna aliqua. Sit amet nisl suscipit adipiscing bibendum.</p>
                    <p class="view-prize">Price: $15.00</p>
                    <div class="view-img">
                        <img src="images/intro1.png" alt="Imagen Producto">
                    </div>

                </div>
            </div>

            <footer>
                <div class="footer-container">
                    <p>&copy; 2024 Urban Soul.</p>
                </div>
                <div class="footer-icon">
                    <a href="https://www.facebook.com/?locale=es_LA"><img src="images/logos/face.png" alt="Facebook"></a>
                    <a href=""><img src="images/logos/correo.png" alt="Correo"></a>
                    <a href="https://www.instagram.com/urbansoul.pe/"><img src="images/logos/insta.png" alt="Instagram"></a>
                    <a href="https://web.whatsapp.com/"><img src="images/logos/wsp.png" alt="Whatsapp"></a>
                    <a href="Admin/Productos.jsp"><img src="images/logos/admin.png" alt="Admin"></a>
                </div>
            </footer>
    </body>

</html>