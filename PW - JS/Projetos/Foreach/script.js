var livros = [];
	livros.push('A Queda');
	livros.push('O Segredo');
	livros.push('Um Estudo Em Vermelho');
	
	livros.unshift('Longe De Casa');
	livros.unshift('Outro Lado De Mim');
	
	livros.pop();
	
	livros.shift();
	
	livros.splice(0,1);
	
for(var j = 0; j < livros.length; j++){
	document.write(j + ": " + livros[j] + "<br>");
}

const livros = [
	"A Queda <br> ",
	"O Segredo <br>",
	"Um Estudo Em Vermelho"
]

livros.forEach((valorAtual, posiçao) => {
	document.write(posiçao + ": " + valorAtual);
})

/* var prod = [];
	prod.push('camisa');
	prod.push('calça');
	prod.push('bermuda');
	prod.push('meias');
		
		//prod.unshift('tênis');
	  
for(var j = 0; j < prod.length; j++){
	document.write(j + ": " + prod[j] + "<br>");
} */