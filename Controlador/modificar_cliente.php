<?php

if (!empty($_POST["btnregistrar"])) {
    if (!empty($_POST["Nombre"]) and !empty($_POST["Apellido"]) and !empty($_POST["Direccion"]) and !empty($_POST["Ciudad"]) and !empty($_POST["Telefono"]) and !empty($_POST["Email"])) {
        $id=$_POST["id"];
        $nombre=$_POST["Nombre"];
        $apellido=$_POST["Apellido"];
        $direccion=$_POST["Direccion"];
        $ciudad=$_POST["Ciudad"];
        $telefono=$_POST["Telefono"];
        $email=$_POST["Email"];
        $sql=$conexion->query(" update clientes set Nombre='$nombre', Apellido='$apellido', Direccion='$direccion', Ciudad='$ciudad', Telefono='$telefono', Email='$enail' where ClienteID=$id");
        if ($sql==1) {
            header("location:index.php");
        } else{
            echo "<div class='alert alert=danger'>Error al modificar el cliente</div>";
        }
    } else{
        echo "<div class='alert alert=warning'>Campos Vacios</div>";
    }
}

?>