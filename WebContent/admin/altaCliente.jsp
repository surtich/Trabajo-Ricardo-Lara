<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
  
  <title>Administrador</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="../CSS/bootstrap.min.css">
  <link rel="stylesheet" href="../CSS/css.css">
  
  <script src="../js/jquery.js"></script>
  <script src="../js/popper.min.js"></script>
  <script src="../js/client.js"></script>	
  <script src="../js/product.js"></script>
  <script src="../js/bootstrap.min.js"></script>
  <script src="../js/validar.js"></script>		

</head>
<%
	String error = (String) request.getAttribute("error");
	if (error == null) {
		error = "";
	}
  %>
<body>

<nav class="navbar navbar-expand-md bg-secondary navbar-dark text-white sticky-top">
  <a class="navbar-brand" href="admin.jsp">MUNDO FUNKO(Admin)</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
       <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
          	Clientes
          </a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="javascript:listarClientes()">Listar Clientes</a>
            <a class="dropdown-item" href="altaCliente.jsp">Alta Cliente</a>
          </div>
        </li>
        <li class="nav-item dropdown">
           <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
            Productos
           </a>
           <div class="dropdown-menu">
              <a class="dropdown-item" href="javascript:listarProductos()">Listar Productos</a>
              <a class="dropdown-item" href="#">Alta Productos</a>
           </div>
        </li>
    </ul>
  </div>  
  <div id="botones">
    <a href="../tienda.html" class="btn btn-primary" id="login">
    	<img class="carrito" src="../imagenes/logos/login.png">Tienda
    </a>
  </div>
</nav>

	<div class="container">
		<br>
		<form action='../Register?admin=1' method="post" onSubmit="return validar(this)">
		
		  <div class="error"><%=error%></div>
		  <div class="form-row">
		  	<div class="form-group col-md-6">
		      <label for="inputName">Nombre*</label>
		      <input type="text" class="form-control" id="inputName" name="name" placeholder="Juan" required>
		    </div>
		    
		    <div class="form-group col-md-6">
			  	 <label for="inputNif">NIF*</label>
			     <input type="text" class="form-control" id="inputNif" name="nif" placeholder="00000000a" required>
			</div>
		  </div>
		  
		  <div class="form-row">
		  	<label  for="inputEmail">Email*</label>
		  	<input type="text" class="form-control" id="inputEmail" name="email" placeholder="ejemplo@gmail.com" required>
		  	<span class="error" id="error-email"></span>
		  </div>
		  
		  <div class="form-row">
		  	<label  for="inputAddress">Direción</label>
		  	<input type="text" class="form-control" id="inputAddress" name="address" placeholder="C/pepito">
		  </div>
		  
		  <div class="form-row">
		  	<div class="form-group col-md-6">
		      <label for="inputPass">Contraseña*</label>
		      <input type="password" class="form-control" id="inputPass" name="pass" required>
		    </div>
		    
		    <div class="form-group col-md-6">
			  	 <label for="inputTelephone">Telefono</label>
			     <input type="number" class="form-control" id="inputTelephone" name="telephone" placeholder="635000000">
			</div>
		  </div>
		  
		  <br>
		  <div class="form-row">
		  	<button type="submit" class="btn btn-primary">Crear Cliente</button>
		  </div>
		</form>
	</div>
</body>
</html>