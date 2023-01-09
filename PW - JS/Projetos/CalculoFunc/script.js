function valor1(){
    let num1 = prompt("Digite um número");
    ConfereNumero(num1, 0, 1);
}

function valor2(b){
    let num2 = prompt("Digite outro número");
    ConfereNumero(num2, b, 2);
}

function ConfereNumero(a, b, c){
    try{
        if(a <= 0){
            throw("ERRO");
        }

        else if(isNaN(parseInt(a))){
            throw("ERRO2");
        }

        else{
            if(c == 1){
                b += a
                valor2(b);
            }

            else{
                a = parseFloat(a);
                b = parseFloat(b);
                let result = a + b;
                document.write(result);
            }
        }
    }
	
	catch(e){
		if(e == "ERRO"){
			alert("Por favor, informar um número positivo.")
		}
		
		else{
			alert("Por favor, digite um número.")
		}
	}
}