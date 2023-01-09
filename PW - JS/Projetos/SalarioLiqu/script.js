let $calcular = document.getElementById("calcular");	// variável do botão calcular

function calcular(){	// chama a variável do botão calcular
	let $salario = document.querySelector("#salario").value;	// variável que chama o valor da input
	let $resultado = document.getElementById("valor");

    if($salario <= 1903.98){
        alert("Isento");
    }
    else if($salario >= 1903.99 || $salario <= 2826.65){
		$salarioFinal = $salario - 142.80;
    }
    else if($salario >= 2826.66 || $salario <= 3751.05){
		$salarioFinal = $salario - 354.80;
    }
    else if($salario >= 3751.06 || $salario <= 4664.68){
		$salarioFinal = $salario - 636.13;
    }
    else{
		$salarioFinal = $salario - 869.96;
    }
    $salarioFinal = parseFloat($salarioFinal)
    let $final = $salarioFinal;
    $resultado.textContent = $final;
}

$calcular.addEventListener("click", calcular);