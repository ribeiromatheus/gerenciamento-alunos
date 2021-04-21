<%@ page import = "model.Aluno"%>
<jsp:useBean id="alunoDAO" class="dao.DaoAluno" />
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
<title>Cadastro de Telefones</title>
</head>
<body>
	<div class="container-md">
		<h1>Cadastro de Telefones</h1>

		<form class="form" action="insertTelefone.jsp" method="post">
			<div class="form-group">
				<label>Nome do Aluno:</label>
				<select name="aluno" class="form-control">
					<%
						List<Aluno> listaAluno = new ArrayList<Aluno>();
						listaAluno = alunoDAO.select();
						
						for (Aluno aluno: listaAluno) {
	               	%>
	               	<option value="<%=aluno.getIdaluno()%>"><%=aluno.getNome()%></option>
	               	<%}%>
				</select>
			</div>
			
			<div class="form-group">
				<label>Tipo:</label>
				<input type="text" name="tipo" class="form-control" placeholder="Tipo">
			</div>
						
			<div class="form-group">
				<label>DDD:</label>
				<input type="text" name="ddd" class="form-control" placeholder="DDD">
			</div>
			
			<div class="form-group">
				<label>Número:</label>
				<input type="text" name="numero" class="form-control" placeholder="Número">
			</div>
			
			<button type="submit" class="btn btn-primary mb-2">Cadastrar</button>
		</form>
	</div>
</body>
</html>