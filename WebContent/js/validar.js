
function validar(){
	var correcto=true;
	 $("#error-email").text('');
	
	debugger;
    if(!/^\w+([\.\+\-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/.test($("#inputEmail").val())){
       
        $('#error-email').text('Datos erroneos');
        correcto=false;
    }
    
    /*if(!/^([\d]{8})([A-Z]{1})$/.test($("#nif").val())){
        alert(document.querySelectorAll("span#nif").length);
        if(document.querySelectorAll("span#nif").length>0){
            $("span#nif:eq(0)").remove();
        }
        $('#nif').append('<span id="error-span" class="badge badge-danger">Datos erroneos</span>');
        validado=false;
    }

    if(!/^([A-ZÁÉÍÓÚ\d]?[a-zñáéíóú\d]+[\s]*)+/.test($("#direccion").val())){
        alert(document.querySelectorAll("span#direccion").length);
        if(document.querySelectorAll("span#direccion").length>0){
            $("span#direccion:eq(0)").remove();
        }
        $('#direccion').append('<span id="error-span" class="badge badge-danger">Datos erroneos</span>');
        validado=false;
    }else{
        validado=true;
        $("#error-span").remove();
    }

    if(!/^[\d]{9}$/.test($("#telefono").val())){
        alert(document.querySelectorAll("span#telefono").length);
        if(document.querySelectorAll("span#telefono").length>0){
            $("span#telefono:eq(0)").remove();
        }
        $('#telefono').append('<span id="error-span" class="badge badge-danger">Datos erroneos</span>');
        validado=false;
    }else{
        validado=true;
        $("#error-span").remove();
    }

    if(!/^(?=.*\d)(?=.*[\u0021-\u002b\u003c-\u0040])(?=.*[A-Z])(?=.*[a-z])\S{8,16}$/.test($("#password").val())){
        alert(document.querySelectorAll("span#password").length);
        if(document.querySelectorAll("span#password").length>0){
            $("span#password:eq(0)").remove();
        }
        $('#password').append('<span id="error-span" class="badge badge-danger">Datos erroneos</span>');
        validado=false;
    }else{
        validado=true;
        $("#error-span").remove();
    }

    if(!/^([A-ZÁÉÍÓÚ]{1}[a-zñáéíóú]+[\s]*)+/.test($("#nombre").val())){
        alert(document.querySelectorAll("span#nombre").length);
        if(document.querySelectorAll("span#nombre").length>0){
            $("span#nombre:eq(0)").remove();
        }
        $('#password').append('<span id="error-span" class="badge badge-danger">Datos erroneos</span>');
        validado=false;
    }else{
        validado=true;
        $("#error-span").remove();
    }

    if(validado==true){
        
        document.querySelectorAll("#validado")[0].type="submit";
    }*/
    
    return correcto;
  
}

  