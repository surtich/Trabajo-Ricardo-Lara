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
		<h1>Alta Producto</h1>
		<form action="AltaProducto" method="post" enctype="multipart/form-data" onSubmit="validar(this)">
		
		  <div class="error"><%=error%></div>
		  <div class="form-row">
		      <label for="inputName">Nombre*</label>
		      <input type="text" class="form-control" id="inputName" name="name" placeholder="Ironman" required>
		  </div>
		  
		  <div class="col-sm-10">  
		  	<fieldset>
		  		<legend>Oferta</legend>
				  <div class="form-check">
			          <input class="form-check-input" type="radio" name="offer" id="inputOfferYes" value="si">
			          <label class="form-check-label oferta" for="inputOffer">
			            Si
			          </label>
		          </div>
		   
	          <div class="form-check">
		          <input class="form-check-input" type="radio" name="offer" id="inputOfferNo" value="no" checked>
		          <label class="form-check-label oferta" for="inputOffer">
		            No
		          </label>
	       	  </div>
	       	</fieldset>
	       </div>
		  
		  <div class="form-row">
			  <div class="form-group col-md-6">
			   	<label for="inputPrice">Precio</label>
			  	<div class="input-group">
			  		<input type="text" class="form-control" id="inputPrice" name="price" placeholder="20.30">
			        <div class="input-group-prepend">
			          <div class="input-group-text">€</div>
			        </div>
		     	</div>
			  </div>
			  
			  
			  <div class="form-group col-md-6">
			  	 <label for="inputStock">Stock</label>
			     <input type="number" class="form-control" id="inputStock" name="stock" placeholder="20">
			  </div>
		  </div>
		  
		  <div class="form-row">
			  	<label for="inputCategoria">Categoría*</label>
			  	<select class="custom-select" name="category" required>
				  <option selected value="">Selección de categorias</option>
				  <option value="1">Television-Juego de tronos</option>
				  <option value="2">Television-Stranger things</option>
				  <option value="3">Television-The walking dead</option>
				  <option value="4">Television-Friends</option>
				  <option value="5">Television-La casa de papel</option>
				  <option value="6">Television-Dragon ball</option>
				  <option value="7">Television-Tortugas Ninja</option>
				  <option value="8">Peliculas-Harry Potter</option>
				  <option value="9">Peliculas-Star Wars</option>
				  <option value="10">Peliculas-Marvel</option>
				  <option value="11">Peliculas-El señor de los anillos</option>
				  <option value="12">Peliculas-DC</option>
				  <option value="13">Peliculas-Space Jam</option>
				  <option value="14">Peliculas-Jurassic Park/World</option>
				  <option value="15">Disney-Toy Story</option>
				  <option value="16">Disney-Rey león</option>
				  <option value="17">Disney-Aladdin</option>
				  <option value="18">Disney-Los increibles</option>
				  <option value="19">Disney-La bella y la bestia</option>
				  <option value="20">Disney-Blancanieves</option>
				  <option value="21">Disney-Piratas del caribe</option>
				  
				</select>
			  </div>
		  
		  <div class="form-row">
	         <label for="inputPhoto">Imagen</label>
	     	 <input type="file" class="form-control" id="inputPhoto" name="photo">
		  </div>
		  <br>
		  <div class="form-row">
		  	<button type="submit" class="btn btn-primary">Crear producto</button>
		  </div>
		</form>
	</div>
</body>
</html>