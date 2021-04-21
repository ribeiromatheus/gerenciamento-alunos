<%@page import="dao.DaoDisciplina"%>
<%@page import="dao.DaoAluno"%>
<%@page import="model.AlunoDisciplina"%>
<%@page import="model.Aluno"%>
<%@page import="model.Disciplina"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<jsp:useBean id="discplinaDAO" class="dao.DaoDisciplina" />
<jsp:useBean id="alunoDAO" class="dao.DaoAluno" />
<jsp:useBean id="alunoDisciplinaDAO" class="dao.DaoAlunoDisciplina" />
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
<title>Cadastro de Disciplinas</title>
</head>
<body>
	<div class="container-md">
		<h1>Cadastro de Disciplinas</h1>

		<form action="insertAssociacao.jsp" method="post">
			<label>Nome:</label>
			<select name="disciplina" class="form-control">
					<%
						List<Disciplina> listaDisciplinas = new ArrayList<Disciplina>();
						listaDisciplinas = discplinaDAO.select();
						
						for (Disciplina disciplina: listaDisciplinas) {
	               	%>
	               	<option value="<%=disciplina.getIdDisciplina()%>"><%=disciplina.getNomeDisciplina()%></option>
	               	<%}%>
				</select>

			<label>Aluno:</label>
			<select name="aluno" class="form-control">
				<%
					List<Aluno> listaAlunos = new ArrayList<Aluno>();
					listaAlunos = alunoDAO.select();
					
					for (Aluno aluno: listaAlunos) {
	            %>
               	<option value="<%=aluno.getIdaluno()%>"><%=aluno.getNome()%></option>
            	<%}%>
			</select>
			
			<label>Nota 1:</label>
			<input name="n1" class="form-control">
			
			<label>Nota 2:</label>
			<input name="n2" class="form-control">
			
			<button type="submit" class="btn btn-primary mb-2">Cadastrar</button>
		</form>
	</div>
</body>
</html>