<%@ page import = "model.Turma"%>
<jsp:useBean id="turmaDAO" class="dao.DaoTurma" />
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
<title>Cadastro de Alunos</title>
</head>
<body>
	<div class="container-md">
		<h1>Cadastro de Alunos</h1>

		<form class="form" action="insert.jsp" method="post">
			<div class="form-group">
				<label>Nome do Aluno:</label>
				<input type="text" name="nome" class="form-control" placeholder="Nome">
			</div>
			
			<div class="form-group">
				<label>Email do Aluno:</label>
				<input type="email" name="email" class="form-control" placeholder="Email">
			</div>
						
			<div class="form-group">
				<label>RA:</label>
				<input type="text" name="ra" class="form-control" placeholder="RA">
			</div>
			
			<div class="form-group">
				<label>Turma:</label>
				<select name="turma" class="form-control">
					<%
						List<Turma> listaTurma = new ArrayList<Turma>();
						listaTurma = turmaDAO.select();
						
						for (Turma turma: listaTurma) {
	               	%>
	               	<option value="<%=turma.getIdTurma()%>"><%=turma.getNomeTurma()%></option>
	               	<%}%>
				</select>
			</div>
			
			<div class="form-group">
				<label>Logradouro:</label>
				<input type="text" name="logradouro" class="form-control" placeholder="Logradouro">
			</div>
			
			<div class="form-group">
				<label>Tipo:</label>
				<input type="text" name="tipo" class="form-control" placeholder="Tipo">
			</div>
			
			<div class="form-group">
				<label>CEP:</label>
				<input type="text" name="cep" class="form-control" placeholder="CEP">
			</div>
			
			<div class="form-group">
				<label>Bairro:</label>
				<input type="text" name="bairro" class="form-control" placeholder="Bairro">
			</div>
			
			<div class="form-group">
				<label>Número:</label>
				<input type="text" name="numero" class="form-control" placeholder="Número">
			</div>
			
			<div class="form-group">
				<label>Complemento:</label>
				<input type="text" name="complemento" class="form-control" placeholder="Complemento">
			</div>
			
			<div class="form-group">
				<label>Cidade:</label>
				<input type="text" name="cidade" class="form-control" placeholder="Cidade">
			</div>
			
			<div class="form-group">
				<label>Estado:</label>
				<input type="text" name="estado" class="form-control" placeholder="Estado">
			</div>
			<button type="submit" class="btn btn-primary mb-2">Cadastrar</button>
		</form>
	</div>
</body>
</html>