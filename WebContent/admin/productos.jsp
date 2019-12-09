<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/product.js"></script>

<link rel="stylesheet" href="../CSS/bootstrap.min.css">
<link rel="stylesheet" href="../CSS/css.css">
</head>
<body>
	<div class="container table-responsive">
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Id</th>
					<th scope="col">Nombre</th>
					<th scope="col">Oferta</th>
					<th scope="col">Precio</th>
					<th scope="col">Categoria</th>
					<th scope="col">stock</th>
					<th scope="col">Imagen</th>
					<th scope="col">Editar</th>
					<th scope="col">Eliminar</th>
				</tr>
			</thead>
			<tbody id="tableProduct">
			</tbody>
		</table>
	</div>

	<script type="text/javascript">
		debugger;
		listarProductos();
	</script>
</body>
</html>