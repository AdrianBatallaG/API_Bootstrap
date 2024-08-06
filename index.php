<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>API CRUD AdrianBG-BryanSC</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/dffa82b78f.js" crossorigin="anonymous"></script>
   
</head>

<body style="background: #83a4d4;  /* fallback for old browsers */
background: -webkit-linear-gradient(to right, #b6fbff, #83a4d4);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to right, #b6fbff, #83a4d4); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
;">
    <script>
        function eliminar() {
            var respuesta = confirm("Estas seguro que deseas eliminar al cliente?");
            return respuesta
        }
    </script>
    <h1 class="text-center p-3">Bienvenido a nuestra API</h1>
    <?php
    include "/xampp/htdocs/API_Bootstrap/Modelo/conexion.php";
    include "/xampp/htdocs/API_Bootstrap/Controlador/eliminar_cliente.php"
    ?>
    <div class="container-fluid row">
        <form class="col-4 p-3" method="POST">
            <h3 class="text-center text-secondary">Registro de clientes</h3>
            <?php
            include "/xampp/htdocs/API_Bootstrap/Controlador/registro_cliente.php";
            ?>
            <div class="mb-3 text-center" style="margin-top: 30px;">
                <label for="exampleInputEmail1" class="form-label">Nombre</label>
                <input type="text" class="form-control" name="Nombre">
            </div>
            <div class="mb-3 text-center">
                <label for="exampleInputEmail1" class="form-label">Apellido</label>
                <input type="text" class="form-control" name="Apellido">
            </div>
            <div class="mb-3 text-center">
                <label for="exampleInputEmail1" class="form-label">Direccion</label>
                <input type="text" class="form-control" name="Direccion">
            </div>
            <div class="mb-3 text-center">
                <label for="exampleInputEmail1" class="form-label">Ciudad</label>
                <input type="text" class="form-control" name="Ciudad">
            </div>
            <div class="mb-3 text-center">
                <label for="exampleInputEmail1" class="form-label">Telefono</label>
                <input type="text" class="form-control" name="Telefono">
            </div>
            <div class="mb-3 text-center">
                <label for="exampleInputEmail1" class="form-label">Email</label>
                <input type="email" class="form-control" name="Email">
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-primary" name="btnregistrar" value="ok">Registrar</button>
            </div>
        </form>
        <div class="col-8 p-4">
            <table class="table table-hover table-bordered border-primary">
                <thead>
                    <tr class="table-info">
                        <th scope="col">ID</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Apellido</th>
                        <th scope="col">Direccion</th>
                        <th scope="col">Ciudad</th>
                        <th scope="col">Telefono</th>
                        <th scope="col">Email</th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    include "/xampp/htdocs/API_Bootstrap/Modelo/conexion.php";
                    $sql = $conexion->query("select * from clientes ");
                    while ($datos = $sql->fetch_object()) { ?>
                        <tr class="table-warning">
                            <td><?= $datos->ClienteID ?></td>
                            <td><?= $datos->Nombre ?></td>
                            <td><?= $datos->Apellido ?></td>
                            <td><?= $datos->Direccion ?></td>
                            <td><?= $datos->Ciudad ?></td>
                            <td><?= $datos->Telefono ?></td>
                            <td><?= $datos->Email ?></td>
                            <td>
                                <a href="http://localhost/API_Bootstrap/modificar_cliente.php?id=<?= $datos->ClienteID ?>" class="btn btn-small btn-warning"><i class="fa-solid fa-pen-to-square"></i></a>
                                <a onclick="return eliminar()" href="index.php?id=<?= $datos->ClienteID ?>" class="btn btn-small btn-danger"><i class="fa-solid fa-trash"></i></a>
                            </td>
                        </tr>
                    <?php }
                    ?>
                </tbody>
            </table>
        </div>

    </div>

    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>



    <footer>
        <p class="text-center">Practica realizada por: Adrian Batalla Garcia y Bryan Jahir Saltos Cedeño</p>

    </footer>
</body>

</html>