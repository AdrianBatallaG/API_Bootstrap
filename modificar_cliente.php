<?php
include "/xampp/htdocs/API_Bootstrap/Modelo/conexion.php";
$id = $_GET["id"];
$sql = $conexion->query("select * from clientes where ClienteID=$id");

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modificar Cliente</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>

<body>

    <form class="col-4 p-3 m-auto" method="POST">
        <h3 class="text-center text-secondary">Modificar Clientes</h3>
        <input type="hidden" name="id" value="<?= $_GET["id"]?>">
        <?php
        include "/xampp/htdocs/API_Bootstrap/Controlador/modificar_cliente.php";
        while ($datos = $sql->fetch_object()) { ?>
            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Nombre del cliente</label>
                <input type="text" class="form-control" name="Nombre" value="<?= $datos->Nombre?>">
            </div>
            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Apellido del cliente</label>
                <input type="text" class="form-control" name="Apellido" value="<?= $datos->Apellido?>">
            </div>
            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Direccion del cliente</label>
                <input type="text" class="form-control" name="Direccion" value="<?= $datos->Direccion?>">
            </div>
            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Ciudad del cliente</label>
                <input type="text" class="form-control" name="Ciudad" value="<?= $datos->Ciudad?>">
            </div>
            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Telefono del cliente</label>
                <input type="text" class="form-control" name="Telefono" value="<?= $datos->Telefono?>">
            </div>
            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Email del cliente</label>
                <input type="email" class="form-control" name="Email" value="<?= $datos->Email?>">
            </div>

        <?php
        }
        ?>
        <button type="submit" class="btn btn-primary" name="btnregistrar" value="ok">Editar Cliente</button>
    </form>
</body>

</html>