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

  <main>
    <section class="inicio">
      <div class="image-container">
        <img src="images/logos/imagen_grande.jpg" alt="Imagen grande" />
      </div>
      <div class="content">
        <div>
          <h1>Urban Soul</h1>
          <p>
            Urban Soul desea liderar la transformación hacia una moda más
            sostenible y accesible, ofreciendo productos contemporáneos de
            alta calidad que reflejen las últimas tendencias sin comprometer
            el respeto por el medio ambiente.
          </p>
          <a href="#" class="btn">Comprar ahora</a>
        </div>
        <div class="small-images">
          <img src="images/intro1.png" alt="Imagen 1" />
          <img src="images/intro2.png" alt="Imagen 2" />
          <img src="images/intro3.png" alt="Imagen 3" />
        </div>
      </div>
    </section>

    <section class="productos" id="productos">
      <h2 class="titulo-productos">Nuestros productos</h2>
      <div class="pros">
        <div class="producto">
          <div class="img__producto">
            <img src="images/polo.jpg" alt="Producto 1" />
          </div>
          <h3>Polos</h3>
          <p>
            Urban Soul ofrece una variedad de prendas de vestir contemporáneas
            en este apartado presentaremos los polos en tendencia, con
            atención al detalle y a la calidad de los materiales.
          </p>
          <a href="#" class="btn">Ver más</a>
        </div>

        <div class="producto">
          <div class="img__producto">
            <img src="images/pantalon.jpg" alt="Producto 2" />
          </div>

          <h3>Pantalones</h3>
          <p>
            Urban Soul ofrece una variedad de prendas de vestir contemporáneas
            en este apartado presentaremos pantalones en tendencia, con
            atención al detalle y a la calidad de los materiales.
          </p>
          <a href="#" class="btn">Ver más</a>
        </div>

        <div class="producto">

          <div class="img__producto">
            <img src="images/gorro.jfif.jpg" alt="Producto 3" />
          </div>

          <h3>Accesorios</h3>
          <p>
            Además de ropa, la tienda ofrece una selección de accesorios
            eco-friendly como sombreros. Estos accesorios están fabricados con
            materiales sostenibles y respetuosos con el medio ambiente.
          </p>
          <a href="#" class="btn">Ver más</a>
        </div>

        <div class="producto">
          <div class="img__producto">
            <img src="images/casaca.jpg" alt="Producto 4" />
          </div>

          <h3>Casacas</h3>
          <p>
            Además de prendas de vestir, la tienda ofrece una gama de casacas ecológicas.
            Estas casacas están confeccionadas con materiales sostenibles y amigables con
            el medio ambiente, fusionando un estilo moderno con un fuerte compromiso hacia
            la sostenibilidad y la alta calidad.
          </p>
          <a href="#" class="btn">Ver más</a>
        </div>

        <div class="producto">
          <div class="img__producto">
            <img src="images/chaleco.jpg" alt="Producto 5" />
          </div>

          <h3>Chalecos</h3>
          <p>
            Además de prendas de vestir convencionales, nuestra tienda ofrece una selección
            exclusiva de chalecos ecológicos. Estos chalecos están meticulosamente confeccionados
            utilizando materiales sostenibles y respetuosos con el medio ambiente.
          </p>
          <a href="#" class="btn">Ver más</a>
        </div>

        <div class="producto">
          <div class="img__producto">
            <img src="images/Gorroinvierno.jpg" alt="Producto 6" />
          </div>
          <h3>Gorros de invierno</h3>
          <p>
            Explora nuestra colección de gorros de invierno, donde la moda se encuentra con la sostenibilidad.
            Nuestros gorros están elaborados con materiales sostenibles, pensados para mantener
            el calor y el estilo durante los meses más fríos del año.
          </p>
          <a href="#" class="btn">Ver más</a>
        </div>

      </div>
    </section>
  </main>

  <script src="script.js"></script>

  <footer>
    <div class="footer-container">
      <p>&copy; 2024 Urban Soul.</p>
    </div>
    <div class="footer-icon">
      <a href="https://www.facebook.com/?locale=es_LA"><img src="images/logos/face.png" alt="Facebook"></a>
      <a href=""><img src="images/logos/correo.png" alt="Correo"></a>
      <a href="https://www.instagram.com/urbansoul.pe/"><img src="images/logos/insta.png" alt="Instagram"></a>
      <a href="https://web.whatsapp.com/"><img src="images/logos/wsp.png" alt="whatsapp"></a>
    </div>
  </footer>
</body>

</html>