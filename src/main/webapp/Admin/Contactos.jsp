<%-- 
    Document   : Admin
    Created on : 26 nov 2024, 13:56:14
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
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
                            <a class="nav-link" href="Productos.jsp">Productos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="#">Contactos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Ventas.jsp">Ventas</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <br>
        
        <!-- Tabla Contactos-->

        <div class="container-md">
            <table class="table align-middle">
                <thead class="table-dark">
                    <tr>
                        <th scope="col">ID Contacto</th>
                        <th scope="col">Nombre del contacto</th>
                        <th scope="col">Email</th>
                        <th scope="col">Asunto</th>
                        <th scope="col">Mensaje</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th scope="row">1</th>
                        <td>Jhon</td>
                        <td>jhon@example.com</td>
                        <td>Reclamo</td>
                        <td>Mensaje de Reclamo</td>
                    </tr>
                </tbody>
            </table> 
        </div>

        <br>

    </body>
</html>
