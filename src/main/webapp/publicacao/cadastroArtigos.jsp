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
<title>Cadastro de Publica��es</title>
</head>
<body>
	<div class="container-md">
		<h1>Cadastro de Publica��es</h1>

		<form action="insert.jsp" method="post">
			<label>T�tulo:</label>
			<input type="text" name="titulo" placeholder="Titulo">

			<label>Data Publica��o:</label>
			<input type="date" name="data" placeholder="Data Publica��o">
			
			<label>Revista:</label>
			<input type="text" name="revista" placeholder="Revista">
			
			<label>P�ginas:</label>
			<input type="text" name="paginas" placeholder="P�ginas">
						
			<button type="submit" class="btn btn-primary mb-2">Cadastrar</button>
		</form>
	</div>
</body>
</html>