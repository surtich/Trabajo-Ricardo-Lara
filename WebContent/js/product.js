function listarProductos(){
	$.ajax({
		url : '../product/listar.do',
		method : 'get',
		success : function(arrayProduct) {
			debugger;
			if ($("div#capaProductos").length == 1){
				$("div#capaProductos").remove();
				$("div#administrador").append("<div id='capaProductos'></div>");
			}
			var table = '';
			table += '<div class="table-responsive">'
			+ '<table class="table">'
			+ '<thead class="thead-dark">'
			+ '<tr><th scope="col">Id</th>'
			+ '<th scope="col">Nombre</th>'
			+ '<th scope="col">Oferta</th>'
			+ '<th scope="col">Precio</th>'
			+ '<th scope="col">Categoria</th>'
			+ '<th scope="col">stock</th>'
			+ '<th scope="col">Imagen</th>'
			+ '<th scope="col">Editar</th>'
			+ '<th scope="col">Eliminar</th></tr></thead>'
			+ '<tbody id="tableProduct">';
			
			for (var i = 0; i < arrayProduct.length; i++) {
				var product = arrayProduct[i];
				table += '<tr>'
				+ '<th scope="row">' + product.id + '</th>'
				+ '<td>' + product.name + '</td>'
				+ '<td>' + product.offer + '</td>'
				+ '<td>' + product.price + '</td>'
				+ '<td>' + product.category + '</td>'
				+ '<td>' + product.stock + '</td>'
				+ '<td>' + product.img + '</td>'
				+ '<td><a href="AltaProducto?id='+product.id+'"><img src="../imagenes/logos/modificar.png" class="carrito"/></a></td>'
				+ '<td><a href="javascript:eliminarPorId('+ product.id +')"><img src="../imagenes/logos/eliminar.png" class="carrito"/></a></td></tr>';
			}
			table += '</tbody></table></div>';
			$('#capaProductos').html(table);
			$('#capaClientes').hide();
		},
		error : function(xhr, ajaxOptions, thrownError) {
			debugger;
			console.log('error');
		}
	});
}

function listarPorCategoriaAdmin(category){
	debugger;
	$.ajax({
		url : 'product/listar.do?category='+category ,
		method : 'get',
		success : function(arrayProduct) {
			debugger;
			var table = '';
			for (var i = 0; i < arrayProduct.length; i++) {
				var product = arrayProduct[i];
				table += '<tr>';
				table += '<th scope="row">' + product.id + '</th>';
				table += '<td>' + product.name + '</td>';
				table += '<td>' + product.offer + '</td>';
				table += '<td>' + product.price + '</td>';
				table += '<td>' + product.category + '</td>';
				table += '<td>' + product.stock + '</td>';
				table += '<td><img src="' + product.img + '" class="foto"></td>';
				table += '</tr>';
			}
			table += '</table>';
			$('#capaTienda').html(table);
			$('#carousel-with-lb').hide();
			
		},
		error : function(xhr, ajaxOptions, thrownError) {
			debugger;
			console.log('error');
		}
	});
}

function listarPorCategoria(category){
	debugger;
	$.ajax({
		url : 'product/listar.do?category='+category ,
		method : 'get',
		success : function(arrayProduct) {
			debugger;
			if ($("div#peliculas").length == 1){
				$("div#peliculas").remove();
				$("div#tienda").append("<div id='peliculas'></div>");
			}
			for (var i = 0; i < arrayProduct.length; i++) {
				var product = arrayProduct[i];
	            $("div#peliculas").append("<div id='capa"+product.id+"'></div>");
	            $("div#capa"+product.id).append("<h1 class='titulopeli'>"+product.name+"</h1>");
	            $("div#capa"+product.id).append("<img id='caratulas' src='./"+ product.img+"'></img>");
	            $("div#capa"+product.id).append("<div class='cantidad'></div>");
	            $("div#capa"+product.id+" div.cantidad").append("Cantidad:<input id='caja"+product.id+"' type='number' min=0 max="+product.stock+"><button class='btn btn-success' type='button'>Añadir al carrito</button>");
	            $("div#capa"+product.id+" div.cantidad").append("<p>Precio:"+product.price+"</p>")
	            $("div#capa"+product.id+" div.cantidad button").attr("onclick","anadirProducto("+product.id+")");
			}
			$('#carousel-with-lb').hide();
        },
        error : function(xhr, ajaxOptions, thrownError) {
			debugger;
			console.log('error');
		}
    });
}

function eliminarPorId(id){
	$.ajax({
		url : '../product/listar.do?id='+id ,
		method : 'get',
		success : function(){
			listarProductos();
			alert("Producto eliminado satisfactoriamente")
		},
		error : function(xhr, ajaxOptions, thrownError) {
			debugger;
			console.log('error');
		}
	});
}
