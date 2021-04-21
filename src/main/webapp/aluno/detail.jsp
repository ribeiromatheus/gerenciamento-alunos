<%@page import="model.ArtigosAcademicos"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="alunoDAO" class="dao.DaoAluno" />
<jsp:useBean id="telefoneDAO" class="dao.DaoTelefone" />
<jsp:useBean id="AlunoDisciplinaDAO" class="dao.DaoAlunoDisciplina" />
<%@page import="model.Aluno"%>
<%@page import="model.AlunoDisciplina"%>
<%@page import="model.Telefone"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<title>Detalhes do Aluno</title>
</head>
<body>
	<div class="container">
		<form class="form" method="post" action="update.jsp">
	    	<div class="form-group">
		    	<div class="bg-primary text-white text-center">Informações pessoais:</div>
		    	<%
		    		int id = Integer.parseInt(request.getParameter("id"));
		    		
					for (Aluno alunoInfo: alunoDAO.selectId(id)) {
                %>
		    	<label><strong>Nome: </strong><%=alunoInfo.getNome() %></label>&nbsp;&nbsp;
		    	<label><strong>E-mail: </strong><%=alunoInfo.getEmail() %></label>
		    	<%} %>
			</div>
			<div class="form-group">
				<label><strong>Endereço:</strong></label><br>
				<%
		    		for (Aluno alunoEndereco: alunoDAO.selectId(id)) {
                %>
		    	<label><strong>Tipo: </strong><%=alunoEndereco.getEndereco().getTipo() %></label>&nbsp;&nbsp;
		    	<label><strong>Logradouro: </strong><%=alunoEndereco.getEndereco().getLogradouro() %></label>&nbsp;&nbsp;
		    	<label><strong>Número: </strong><%=alunoEndereco.getEndereco().getNumero() %></label><br>
		    	<label><strong>CEP: </strong><%=alunoEndereco.getEndereco().getCep() %></label>&nbsp;&nbsp;
		    	<label><strong>Bairro: </strong><%=alunoEndereco.getEndereco().getBairro() %></label>&nbsp;&nbsp;
		    	<label><strong>Complemento: </strong><%=alunoEndereco.getEndereco().getComplemento() %></label><br>
		    	<label><strong>Cidade: </strong><%=alunoEndereco.getEndereco().getCidade() %></label>&nbsp;&nbsp;
		    	<label><strong>Estado: </strong><%=alunoEndereco.getEndereco().getEstado() %></label><br>
		    	<%} %>
			</div>
			<div class="form-group">
				<label><strong>Telefones:</strong></label><br>
				<%
		    		for (Telefone alunoTel: telefoneDAO.select()) {
		    			if (alunoTel.getAluno().getIdaluno() == id) {
                %>
		    	<label><strong>Tipo: </strong><%=alunoTel.getTipo() %></label>&nbsp;&nbsp;
		    	<label><strong>DDD: </strong><%=alunoTel.getDdd() %></label>&nbsp;&nbsp;
		    	<label><strong>Número: </strong><%=alunoTel.getNumero() %></label><br>
		    	<%}} %>
		    	<a href="cadastroTelefone.jsp" class="btn btn-primary">Gerenciar telefones</a><br>
			</div>
			<hr>
			<div class="form-group">
				<div class="bg-success text-white text-center">Informações acadêmicas:</div>
				<%
					for (Aluno alunoDocs: alunoDAO.selectId(id)) {
				%>
		    	<label><strong>RA: </strong><%=alunoDocs.getRa().getRa()%></label>&nbsp;&nbsp;
		    	<label><strong>Turma: </strong><%=alunoDocs.getTurma().getNomeTurma()%></label>&nbsp;&nbsp;
		    	<label><strong>Ano: </strong><%=alunoDocs.getTurma().getAnoTurma()%></label>
				<%} %>
			</div>
			<hr>
			<div class="form-group">
				<div class="bg-info text-white text-center">Relação de disciplinas:</div>
		    	<table class="table table-striped">
		    		<thead>
		    			<tr>
			    			<th>ID</th>
			    			<th>Nome</th>
				    		<th>Carga Horária</th>
		                    <th>Nota 1</th>
		                    <th>Nota 2</th>
		                    <th>Operação</th>
                    	</tr>
		    		</thead>
		    		<tbody>
			    		<%
							for (AlunoDisciplina alunoDisciplina: AlunoDisciplinaDAO.select()) {
								if (alunoDisciplina.getAluno().getIdaluno() == id) {
							
						%>
						<tr>
							<td><%=alunoDisciplina.getDisciplina().getIdDisciplina()%></td>
	                        <td><%=alunoDisciplina.getDisciplina().getNomeDisciplina()%></td>
	                        <td><%=alunoDisciplina.getDisciplina().getCargaHoraria()%></td>
	                        <td><%=alunoDisciplina.getNota1()%></td>
	                        <td><%=alunoDisciplina.getNota2()%></td>
	                        <td>
	                            <a href="../disciplina/updateNota.jsp?id=<%=alunoDisciplina.getId()%>" class="btn btn-warning">Editar</a>
	                            <a href="../disciplina/deleteAlunoDisciplina.jsp?id=<%=alunoDisciplina.getId()%>" class="btn btn-danger">Excluir</a>
	                        </td>
						</tr>
						 <%}} %>
		    		</tbody>
		    	</table>
		    	<a href="../disciplina/associarDisciplinas.jsp" class="btn btn-info">Incluir disciplina</a>
			</div>
		</form>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</body>
</html>