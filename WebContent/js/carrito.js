
function anadirProducto(id){
	$.ajax({
		url : 'carrito.do?addProduct ='+ id,
		method : 'get',
		success : function(product) {
			if (sessionStorage.getItem("carrito") == null){
				sessionStorage.setItem("carrito", carrito = []);
			}
			sessionStorage.setItem("carrito", carrito.push(product));
		},
		error : function(xhr, ajaxOptions, thrownError) {
			debugger;
			console.log('error');
		}
	});
}

function eliminarProducto(id){
	var productos = sessionStorage.getItem("carrito");
	for(var i=0; i< productos.length; i++){
		if(productos[i].id == id){
			productos[i].splice(i, 1);
		}
	}
	$("div#producto"+id).remove();
	
}

function mostrarCarrito(){
	
	$("div#capacarrito").show();
	
}

function ocultarCarrito(){
	
	$("div#capacarrito").hide();

}