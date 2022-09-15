<?php
require_once("../conexion.php");
// print_r($_POST);
switch ($_POST['action']) {
    case 'insert':
        print("Entramos a insertar");
    break;
    case 'selects':
        // $resultado = $conn->query("CALL LimpiarDatos");
        // $consulta = "CALL DatosLimpios";
        $consulta = "CALL ConsultaSucia";
        $content_table="";
        if ($resultado = $conn->query($consulta)) {
            /* obtener un array asociativo */
            while ($fila = $resultado->fetch_assoc()) {
                $trTable="<tr><td>".$fila["nombreCliente"]."</td><td>".$fila["tipoDocumento"]."</td><td>".$fila["Identificacion"]."</td><td>".$fila["telefono"]."</td><td>".$fila["ciudad"]."</td><td>".$fila["IdFactura"]."</td><td>".$fila["ValorFactura"]."</td><td>".$fila["nombreProducto"]."</td><td>".$fila["FechaVenta"]."</td><td>".$fila["CantidadVentas"]."</td><td>".$fila["NombreEmpresa"]."</td><td>".$fila["Nit"]."</td></tr>";
                $content_table.=$trTable;
            }
        
            /* liberar el conjunto de resultados */
            $resultado->free();
        }else{
            printf("Errormessage: %s\n", $conn->error);
        }
        $content_table.="<tr class='noSearch hide'><td colspan='5'></td></tr>";
        print($content_table);
    break;
    case 'selectl':
        // $consulta = "CALL ConsultaSucia";
        $resultado = $conn->query("CALL LimpiarDatos");
        $consulta = "CALL DatosLimpios";
        $content_table="";
        if ($resultado = $conn->query($consulta)) {
            /* obtener un array asociativo */
            while ($fila = $resultado->fetch_assoc()) {
                $trTable="<tr><td>".$fila["nombreCliente"]."</td><td>".$fila["tipoDocumento"]."</td><td>".$fila["Identificacion"]."</td><td>".$fila["telefono"]."</td><td>".$fila["ciudad"]."</td><td>".$fila["IdFactura"]."</td><td>".$fila["ValorFactura"]."</td><td>".$fila["nombreProducto"]."</td><td>".$fila["FechaVenta"]."</td><td>".$fila["CantidadVentas"]."</td><td>".$fila["NombreEmpresa"]."</td><td>".$fila["Nit"]."</td></tr>";
                $content_table.=$trTable;
            }
        
            /* liberar el conjunto de resultados */
            $resultado->free();
        }else{
            printf("Errormessage: %s\n", $conn->error);
        }
        $content_table.="<tr class='noSearch hide'><td colspan='5'></td></tr>";
        print($content_table);
    break;
    default:
        print("Error undefined ActionEvent");
    break;
}
?>