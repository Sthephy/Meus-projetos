var altura = 0;
var largura = 0;
var vidas = 1;
var time = 30;
var nivel = window.location.search; // search retorna o que estiver depois da interrogação.
var gerarTimer = 1500;

nivel = nivel.replace('?','');

if(nivel == "normal"){
	// 1500
	var gerarTimer = 1500;
}
else if(nivel == "hard"){
	// 1000
	var gerarTimer = 1000;
}
else if(nivel == "veryHard"){
	// 750 // == 3/4 de um segundo
	var gerarTimer = 750;
}

function ajustaPalco(){
	altura = window.innerHeight;
	largura = window.innerWidth;
	
	console.log(altura, largura);
}
ajustaPalco();

var vTempo = setInterval(function(){
	time-=1
	
	if(time < 0){
		// Limpar um elemento de uma variável.
		
		clearInterval(vTempo);
		clearInterval(criarMosq);
		
		window.location.href = "gameWin.html" // alert("Vitória!!");
	}
	else{
		document.getElementById('tempo').innerHTML = time
	}
}, 1000);

function posRandom(){
	// Remover o elemento mosquito, caso existir
	
	if(document.getElementById('tempMosq')){
		document.getElementById('tempMosq').remove();
		
		if(vidas > 3){
			window.location.href = "endGame.html" //alert("Game Over!!");
		}
		else{
			document.getElementById('v' + vidas).src="img/coracao_vazio.png";
			vidas++;
		}
	}
	
	var posx = Math.floor(Math.random()*largura) - 90; // Gera um número aleatório entre 0 e 1
	var posy = Math.floor(Math.random()*altura) - 90;  // Math.floor mostra os números sem as casas decimais
	
	posx = posx < 0?0 : posx;
	posy = posy < 0?0 : posy;
	
	console.log(posx, posy);
	
	var mosquito = document.createElement('img');
	mosquito.src = 'img/mosquito.png';
	
	document.body.appendChild(mosquito);
	
	mosquito.className = tamanhoMosq() + ' ' + ladoRandom(); //'Mosq01'
	
	mosquito.style.left = posx + 'px';
	mosquito.style.top = posy + 'px';
	mosquito.style.position = 'absolute';
	
	mosquito.id = 'tempMosq';
	
	// console.log(ladoRandom()); //tamanhoMosq
	
	mosquito.onclick = function(){
		this.remove();
	}
}

function tamanhoMosq(){
	var classe = Math.floor(Math.random() *3);
	
	switch(classe){
		case 0:
			return 'Mosq01';
		
		case 1:
			return 'Mosq02';
		
		case 2:
			return 'Mosq03';
	}
}

function ladoRandom(){
	var classe = Math.floor(Math.random() *2);
	
	switch(classe){
		case 0:
			return 'ladoA';
		
		case 1:
			return 'ladoB';
	}
}