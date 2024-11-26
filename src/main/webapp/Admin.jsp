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
                            <a class="nav-link active" aria-current="page" href="#">Pagina Web</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Productos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Contactos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Ventas</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <br>

        <!-- Tabla Productos-->

        <div class="container-md">
            <table class="table align-middle">
                <thead class="table-dark">
                    <tr>
                        <th scope="col">ID Producto</th>
                        <th scope="col">Imagen</th>
                        <th scope="col">Nombre del Producto</th>
                        <th scope="col">Descripción</th>
                        <th scope="col">Color</th>
                        <th scope="col">Precio</th>
                        <th scope="col">Activo (0-1)</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th scope="row">1</th>
                        <td>
                            <img src="https://th.bing.com/th/id/OIP.daIPmWqSDCRF7x1yKpLziwHaHx?rs=1&pid=ImgDetMain" class="figure-img img-fluid rounded" style="width: 100px; height: 100px;" alt="...">
                        </td>
                        <td>Polo Oversized</td>
                        <td>Polo Refinado</td>
                        <td>Verde</td>
                        <td>S/. 15.00</td>
                        <td>1</td>
                    </tr>
                </tbody>
            </table> 
        </div>

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


        <!-- FORMS -->

        <div class="container-md">
            <form>
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingInput" placeholder="name@example.com">
                    <label for="floatingInput">Nombre del producto</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingPassword" placeholder="Password">
                    <label for="floatingInput">Descripción</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingPassword" placeholder="Password">
                    <label for="floatingInput">Color</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="number" class="form-control" id="floatingPassword" placeholder="Password">
                    <label for="floatingInput">Precio</label>
                </div>
                <br>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>


        </div>

    </body>
</html>
