<?php

if (!empty($_POST["btnregistrar"])) {
    if(!empty($_POST["Nombre"]) and !empty($_POST["Apellido"]) and !empty($_POST["Direccion"]) and !empty($_POST["Ciudad"]) and !empty($_POST["Telefono"]) and !empty($_POST["Email"])) {
      
        $nombre=$_POST["Nombre"];
        $apellido=$_POST["Apellido"];
        $direccion=$_POST["Direccion"];
        $ciudad=$_POST["Ciudad"];
        $telefono=$_POST["Telefono"];
        $email=$_POST["Email"];

        $sql=$conexion->query(" insert into clientes(Nombre, Apellido, Direccion, Ciudad, Telefono, Email)values('$nombre', '$apellido', '$direccion', '$ciudad', '$telefono', '$email')");
       
        if ($sql==1) {
            echo '<div class="alert alert-success">Cliente registrado exitosamente</div>';
        } else {
            echo '<div class="alert alert-danger">Error al registrar cliente</div>';
        }
        
    }else{
        echo '<div class="alert alert-warning">Algunos de los campos estan vacios</div>';
    }
}

?>