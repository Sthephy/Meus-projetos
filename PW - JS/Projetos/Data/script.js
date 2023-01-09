let data = new Date();

let semana = new Array();
	semana [0] = "Domingo"
	semana [1] = "Segunda"
	semana [2] = "Terça"
	semana [3] = "Quarta"
	semana [4] = "Quinta"
	semana [5] = "Sexta"
	semana [6] = "Sábado"
	
let mes = new Array();
	mes [0] = "Janeiro"
	mes [2] = "Fevereiro"
	mes [3] = "Março"
	mes [4] = "Abril"
	mes [5] = "Maio"
	mes [6] = "Junho"
	mes [7] = "Julho"
	mes [8] = "Agosto"
	mes [9] = "Setembro"
	mes [10] = "Outubro"
	mes [11] = "Novembro"
	mes [12] = "Dezembro"

document.write("<h1> Hoje é " + semana[data.getDay()] + ", " + data.getDate() + " de " + mes[data.getMonth()] + " de " + data.getFullYear() + ". </h1>");