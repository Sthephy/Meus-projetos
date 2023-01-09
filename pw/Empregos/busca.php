<!doctype html>

<html lang="pt-br">
<head>
<meta charset="utf-8">
<title>Empregos</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<style>
    	.navbar{
		    margin-bottom: 0;
	    }
	
        table {
            font-family: arial, sans-serif; 
            border-collapse: collapse;
            width: 100%;
        }

        th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
	</style>
</head>

<body>	
	<?php
	    include 'conexao.php';	
	    include 'nav.php';

        if(empty($_GET['txtPesq'])){
			echo "<html><script>location.href = 'index.php'</script></html>";
		}
		// criando variável para recuperar dado digitado no navbar
		$pesquisa = $_GET['txtPesq'];
		$consulta = $cn->query("select * from tbEmprego where Nome like concat('%','$pesquisa','%') or Registro like concat('%','$pesquisa','%')");
		
		if($consulta->rowCount() == 0){
			echo "<html><script>location.href = 'error2.php'</script></html>";
		}
	?>
	
    <div class="container-fluid">
	    <div class="row" style="margin-top: 15px;">
            <table>
		        <th><h4>Nome do Produto</h4></th>
		        <th><h4>Preço</h4></th>
                <th><h4>Preço</h4></th>
                <th><h4>Preço</h4></th>
                <th><h4>Preço</h4></th>
                <th><h4>Preço</h4></th>
                <th><img src="https://placehold.it/960x640" class="img-responsive"></th>
                <th><img src="https://placehold.it/960x640" class="img-responsive"></th>
            </table>
		</div> 

	</div>

</div>
</body>
</html>