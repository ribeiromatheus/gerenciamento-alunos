<%@page import="model.Artigo"%>
<%@page import="dao.DaoArtigo"%>
<%@page import="dao.DaoAluno"%>
<%@page import="model.AlunoArtigo"%>
<%@page import="model.Aluno"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<jsp:useBean id="artigoDAO" class="dao.DaoArtigo" />
<jsp:useBean id="alunoDAO" class="dao.DaoAluno" />
<jsp:useBean id="alunoArtigoDAO" class="dao.DaoAlunoArtigo" />
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
			<select name="artigo" class="form-control">
					<%
						List<Artigo> listaArtigo = new ArrayList<Artigo>();
						listaArtigo = artigoDAO.select();
						
						for (Artigo artigo: listaArtigo) {
	               	%>
	               	<option value="<%=artigo.getIdArtigo()%>"><%=artigo.getTitulo()%></option>
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
			<button type="submit" class="btn btn-primary mb-2">Cadastrar</button>
		</form>
	</div>
</body>
</html>