<head>
  <title>Tienda</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="CSS/bootstrap.min.css">
  <link rel="stylesheet" href="CSS/css.css">
  
  <script src="../js/jquery.js"></script>
  <script src="../js/popper.min.js"></script>
  <script src="../js/client.js"></script>	
  <script src="../js/prduct.js"></script>
  <script src="../js/bootstrap.min.js"></script>	

</head>
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
            <a class="dropdown-item" href="#">Alta Cliente</a>
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
    <a href="tienda.html" class="btn btn-primary" id="login">
    	<img class="carrito" src="imagenes/logos/login.png">Tienda
    </a>
  </div>
</nav>