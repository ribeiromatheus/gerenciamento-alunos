<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<meta charset="ISO-8859-1">
<title>Cadastro de Turmas</title>
</head>
<body>
	<div class="container-md">
		<h1>Cadastro de Turmas</h1>

		<form action="insert.jsp" method="post">
			<label>Nome:</label>
			<input type="text" name="nome" placeholder="Nome">

			<label>Ano:</label>
			<input type="text" name="ano" placeholder="Ano">
						
			<button type="submit" class="btn btn-primary mb-2">Cadastrar</button>
		</form>
	</div>
</body>
</html>