<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <script src="js/jquery.js"></script>
  <title>Tienda</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="CSS/bootstrap.min.css">
  <link rel="stylesheet" href="CSS/css.css">
  
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>	

  <style type="text/css">
    
    .carousel-indicators .active{
      background-color:#6c757d;
    }
  </style>
  
</head>
<%
	String error = (String) request.getAttribute("error");
	if (error == null) {
		error = "";
	}
  %>
<body>

<nav class="navbar navbar-expand-md bg-secondary navbar-dark text-white sticky-top">
  <a class="navbar-brand" href="tienda.html">MUNDO FUNKO</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
            <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                    <img src="imagenes/logos/tele.png" class="carrito">  Television
                    </a>
                    <div class="dropdown-menu">
                      <a class="dropdown-item" href="javascript:listarPorCategoria(5)">Casa de papel</a>
                      <a class="dropdown-item" href="javascript:listarPorCategoria(6)">Dragon ball</a>
                      <a class="dropdown-item" href="javascript:listarPorCategoria(4)">Friends</a>
                      <a class="dropdown-item" href="javascript:listarPorCategoria(1)">Juego de tronos</a>
                      <a class="dropdown-item" href="javascript:listarPorCategoria(2)">Stranger things</a>
                      <a class="dropdown-item" href="javascript:listarPorCategoria(3)">The walking dead</a>
                      <a class="dropdown-item" href="javascript:listarPorCategoria(7)">Tortugas ninja</a>
                    </div>
                  </li>
                  <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                        <img src="imagenes/logos/pelicula.png" class="carrito">  Peliculas
                        </a>
                        <div class="dropdown-menu">
                                <a class="dropdown-item" href="javascript:listarPorCategoria(12)">DC</a>
                                <a class="dropdown-item" href="javascript:listarPorCategoria(8)">Harry Potter</a>
                                <a class="dropdown-item" href="javascript:listarPorCategoria(14)">Jurassic</a>
                                <a class="dropdown-item" href="javascript:listarPorCategoria(10)">Marvel</a>
                                <a class="dropdown-item" href="javascript:listarPorCategoria(11)">Señor de los anillos</a>
                                <a class="dropdown-item" href="javascript:listarPorCategoria(13)">Space jam</a>
                                <a class="dropdown-item" href="javascript:listarPorCategoria(9)">Star wars</a>
                        </div>
                      </li>
                      <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                            <img src="imagenes/logos/disney.png" class="carrito">  Disney
                            </a>
                            <div class="dropdown-menu">
                                    <a class="dropdown-item" href="javascript:listarPorCategoria(17)">Aladdin</a>
                                    <a class="dropdown-item" href="javascript:listarPorCategoria(19)">La Bella y la bestia</a>
                                    <a class="dropdown-item" href="javascript:listarPorCategoria(20)">Blancanieves</a>
                                    <a class="dropdown-item" href="javascript:listarPorCategoria(18)">Los increibles</a>
                                    <a class="dropdown-item" href="javascript:listarPorCategoria(21)">Piratas del Caribe</a>
                                    <a class="dropdown-item" href="javascript:listarPorCategoria(16)">Rey león</a>
                                    <a class="dropdown-item" href="javascript:listarPorCategoria(15)">Toy story</a>
                            </div>
                          </li>
                       
    </ul>
  </div>  
  <div id="botones">
  	<button class="btn btn-primary" onclick="mostrarCarrito()" type="button" id="carrito">
  		<span id="cantidadcarrito">0 </span><img class="carrito" src="imagenes/logos/carrito.png">
  	</button>
    <a href="login.jsp" class="btn btn-warning" id="login">
    	<img class="carrito" src="imagenes/logos/login.png">Logueate
    </a>
  </div>
</nav>
	
	<div class="container">
		<br>
		<h1>Formulario de registro</h1>
		<form action="Register" method="post">
		
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
		<br>
	</div>
<!-- Footer -->
<footer class="page-footer font-small unique-color-dark">

  <div style="background-color: #007bff;">
    <div class="container">

      <!-- Grid row-->
      <div class="row py-4 d-flex align-items-center">

        <!-- Grid column -->
        <div class="col-md-6 col-lg-5 text-center text-md-left mb-4 mb-md-0">
          <h6 class="mb-0">¡Conéctate con nuestras redes sociales!</h6>
        </div>
        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-md-6 col-lg-7 text-center text-md-right">

          <!-- Facebook -->
          <a class="fb-ic">
            <i class="fab fa-facebook-f white-text mr-4"><img class="carrito" src="imagenes/logos/facebook.png"></i>
          </a>
          <!-- Twitter -->
          <a class="tw-ic">
            <i class="fab fa-twitter white-text mr-4"><img class="carrito" src="imagenes/logos/twitter.png"></i>
          </a>
          <!--Linkedin -->
          <a class="li-ic">
            <i class="fab fa-linkedin-in white-text mr-4"><img class="carrito" src="imagenes/logos/linkedin.png"></i>
          </a>
          <!--Instagram-->
          <a class="ins-ic">
            <i class="fab fa-instagram white-text"><img class="carrito" src="imagenes/logos/instagram.png"></i>
          </a>

        </div>
        <!-- Grid column -->

      </div>
      <!-- Grid row-->

    </div>
  </div>

  <!-- Footer Links -->
  <div id="hola" class="container text-center text-md-left mt-5">

    <!-- Grid row -->
    <div class="row mt-3">

      <!-- Grid column -->
      <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">

        <!-- Content -->
        <h6 class="text-uppercase font-weight-bold">Universo Funko</h6>
        <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
        <p>Podrás encontrar un seria de selectivos Funkos para tu colección</p>

      </div>
      <!-- Grid column -->

      <!-- Grid column -->
      <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">

        <!-- Links -->
        <h6 class="text-uppercase font-weight-bold">Productos</h6>
        <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
        <p>
          <a href="#!">Televisión</a>
        </p>
        <p>
          <a href="#!">Peliculas</a>
        </p>
        <p>
          <a href="#!">Disney</a>
        </p>

      </div>
      <!-- Grid column -->

      <!-- Grid column -->
      <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">

        <!-- Links -->
        <h6 class="text-uppercase font-weight-bold">Enlaces útiles</h6>
        <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
        <p>
          <a href="#!">Mapa Web</a>
        </p>
        <p>
          <a href="#!">Registro</a>
        </p>
        <p>
          <a href="#!">Iniciar sesión</a>
        </p>

      </div>
      <!-- Grid column -->

      <!-- Grid column -->
      <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">

        <!-- Links -->
        <h6 class="text-uppercase font-weight-bold">Contacto</h6>
        <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
        <p>
          <i class="fas fa-home mr-3"></i>Doctor Calero, Majadahonda, Madrid</p>
        <p>
          <i class="fas fa-envelope mr-3"></i> mundofunco@gmail.com</p>
        <p>
          <i class="fas fa-phone mr-3"></i>+34 635 65 02 37</p>

      </div>
      <!-- Grid column -->

    </div>
    <!-- Grid row -->

  </div>
  <!-- Footer Links -->

  <!-- Copyright -->
  <div style="background-color: #646c73;"class="footer-copyright text-center py-3">© 2019 Copyright:
    <a href="#!">mundofunko.com</a>
  </div>
  <!-- Copyright -->

</footer>
<!-- Footer -->

</body>
</html>