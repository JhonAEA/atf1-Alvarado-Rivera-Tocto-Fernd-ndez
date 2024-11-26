<%-- 
    Document   : Contactos
    Created on : Sep 8, 2024, 11:57:17 PM
    Author     : USUARIO
--%>
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
        <link rel="stylesheet" href="css/stylesContactos.css">
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
                <a href="#">Contacto</a>
            </nav>
        </header>

        <section class="contacto">
            <div class="container">
                <h1>Contacto</h1>
                <form action="SvContacto" method="POST" class="formulario">
                    <div class="campo">
                        <label for="nombre">Nombre:</label>
                        <input type="text" id="nombre" name="nombre" required>
                    </div>
                    <div class="campo">
                        <label for="email">E-mail:</label>
                        <input type="email" id="email" name="email" required>
                    </div>
                    <div class="campo">
                        <label for="asunto">Asunto:</label>
                        <select id="asunto" name="asunto" required>
                            <option value="" disabled selected>Selecciona un asunto</option>
                            <option value="Reclamo">Reclamo</option>
                            <option value="Sugerencia">Sugerencia</option>
                        </select>
                    </div>
                    <div class="campo">
                        <label for="mensaje">Mensaje:</label>
                        <textarea id="mensaje" name="mensaje" required></textarea>
                    </div>
                    <div class="campo">
                        <input type="submit" id="registrar" name="registrar" value="Enviar">
                    </div>
                </form>

                <form action="SvContacto" method="GET" class="formulario">
                    <div class="campo">
                        <input type="submit" id="registrar" name="Ver" value="Ver solicitudes de contacto">
                    </div>
                    <%
                        List<Contacto> listaContactos = (List) request.getSession().getAttribute("listaContactos");
                        int cont = 1;
                        if (listaContactos == null) {
                        
                        } else {
                    %>
                    
                        <h1>Lista de contactos</h1>
                    
                    <%
                            for(Contacto contacto : listaContactos){
                    %>
                    

                    <h2>Numero de contacto N° <%=cont%></h2>
                    <p>Nombre: <%=contacto.getNombre()%></p>
                    <p>E-mail: <%=contacto.getEmail()%></p>
                    <p>Asunto: <%=contacto.getAsunto()%></p>
                    <p>Mensaje: <%=contacto.getMensaje()%></p>

                    <%}
                    }
                    %>
                </form>


            </div>
        </section>

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