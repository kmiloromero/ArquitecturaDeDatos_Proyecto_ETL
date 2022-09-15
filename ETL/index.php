<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<title>ETL</title>
	<link rel="stylesheet" href="css/stylesheets.css">
	<script src="js/functions.js"></script>
</head>
<body>
	<nav>
    <div class="nav-wrapper">
      <a href="#" class="brand-logo">ETL</a>
      <ul id="nav-mobile" class="right hide-on-med-and-down">
      </ul>
    </div>
  </nav>
  <input type="button" dirName="ConsultarL" value="Consultar datos limpios" id="btnactions" class="waves-effect waves-light btn">
  <input type="button" dirName="ConsultarS" value="Consultar datos sucios" id="btnactions" class="waves-effect waves-light btn">
	<div id="response"></div>
	<div id="insertdata" >
		<br><br><br>
		<form id="insertForm">
			<table style="margin-left: auto;margin-right: auto;">
				<tr>
					<td style="width: 100px;">Nombre libro: </td>
					<td><input type="text" name="nombre" style="width: 70%;"></td>
				</tr>
				<input type="hidden" name="action" value="insert">
			</table>
			<!-- <div for="goback" class="material-icons left">arrow_back
				<input type="button" value="Volver" id="goback" class="waves-effect waves-light btn">
			</div>
			<div for="gosave" class="material-symbols-outlined left">save
				<input type="button" value="Guardar" id="gosave" class="waves-effect waves-light btn">
			</div> -->
		<input type="button" value="Volver" id="goback" class="waves-effect waves-light btn">
		<input type="button" value="Guardar" id="gosave" class="waves-effect waves-light btn">
		</form>
	</div>
	
	<div id="tablaid">
	<br><br><br>
	<!--Texto a buscar <input id="searchTerm" type="text" onkeyup="doSearch()" /> -->
	<table id="datos">
		<tr>
		<th>nombre de Cliente</th>
		<th>tipo de Documento</th>
		<th>Identificación</th>
		<th>telefono</th>
		<th>ciudad</th>
		<th>Id Factura</th>
		<th>Valor Factura</th>
		<th>nombre Producto</th>
		<th>Fecha Venta</th>
		<th>Cantidad Ventas</th>
		<th>Nombre Empresa</th>
		<th>Nit</th>
		</tr>
	</table>
</div>
	<footer class="page-footer" style="padding-top: 0px;">
          <div class="footer-copyright">
            <div class="container">
            ETL
            <a class="grey-text text-lighten-4 right" >ARQUITECTURA DE DATOS</a>
            </div>
          </div>
    </footer>
</body>
</html>