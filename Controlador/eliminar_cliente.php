<?php

if (!empty($_GET["id"])){
    $id=$_GET["id"];
    $sql=$conexion->query(" delete from clientes where ClienteID=$id ");
    if ($sql === true) {
        echo '<div class="alert alert-succes text-center">Cliente eliminado exitosamente</div>';
    } else{
        echo '<div class="alert alert-danger text-center">Error al eliminar cliente</div>';
    }
}

?>