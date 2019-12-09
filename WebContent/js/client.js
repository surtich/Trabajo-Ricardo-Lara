function listarClientes(){
	$.ajax({
		url : '../client/listar.do',
		method : 'get',
		success : function(arrayClient) {
			debugger;
			if ($("div#capaClientes").length == 1){
				$("div#capaClientes").remove();
				$("div#administrador").append("<div id='capaClientes'></div>");
			}
			var table = '';
			table += '<div class="table-responsive">'
			+ '<table class="table">'
			+ '<thead class="thead-dark">'
			+ '<tr><th scope="col">Nif</th>'
			+ '<th scope="col">Nombre</th>'
			+ '<th scope="col">Direccion</th>'
			+ '<th scope="col">Email</th>'
			+ '<th scope="col">Telefono</th>'
			+ '<th scope="col">Editar</th>'
			+ '<th scope="col">Eliminar</th></tr></thead>'
			+ '<tbody id="tableClient">';
			
			for (var i = 0; i < arrayClient.length; i++) {
				var client = arrayClient[i];
				table += '<tr>'
				+ '<td>' + client.nif + '</td>'
				+ '<td>' + client.name + '</td>'
				+ '<td>' + client.address + '</td>'
				+ '<td>' + client.email + '</td>'
				+ '<td>' + client.telephone + '</td>'
				+ '<td><a href="newProduct.jsp"><img src="../imagenes/logos/modificar.png" class="carrito"/></a></td>'
				+ "<td><a href=\"javascript:eliminarClientePorId('"+ client.nif +"')\"><img src=\"../imagenes/logos/eliminar.png\" class=\"carrito\"/></a></td></tr>";
			}
			table += '</tbody></table></div>';
			$('#capaClientes').html(table);
			$('#capaProductos').hide();
		},
		error : function(xhr, ajaxOptions, thrownError) {
			debugger;
			console.log('error');
		}
	});
}