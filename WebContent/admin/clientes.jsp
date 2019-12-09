<%@page import="service.ClienteService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/client.js"></script>

<link rel="stylesheet" href="../CSS/bootstrap.min.css">
<link rel="stylesheet" href="../CSS/css.css">
</head>
<body>
	<div class="container table-responsive">
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Nif</th>
					<th scope="col">Nombre</th>
					<th scope="col">Dirección</th>
					<th scope="col">Email</th>
					<th scope="col">Telefono</th>
					<th scope="col">Pass</th>
				</tr>
			</thead>
			<tbody id="tableClient">
			</tbody>

		</table>


	</div>

	<script type="text/javascript">
		debugger;
		listarClientes();
	</script>
</body>
</html>


