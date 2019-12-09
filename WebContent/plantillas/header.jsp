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