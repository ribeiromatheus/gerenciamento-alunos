<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Aluno"%>
<jsp:useBean id="alunoDAO" class="dao.DaoAluno" />
<!DOCTYPE html>
<html>
    <head>
        <title>Exibição de Registros</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

    </head>
    <body>
        <%
            List<Aluno> listaAluno = new ArrayList<Aluno>();
            
            String nome = "";
            nome = request.getParameter("nome");

            if (nome != null) {
            	listaAluno = alunoDAO.selectNome(nome);
            } else {
            	listaAluno = alunoDAO.select();
            }
        %>
        <div class="container">
            <h1>Sistema de Gerenciamento de Alunos</h1>
            <nav class="navbar navbar-expand-sm bg-light">
				<ul class="navbar-nav">
				  <li class="nav-item">
				    <a class="nav-link" href="#">Alunos</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="disciplina/index.jsp">Disciplinas</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="turma/index.jsp">Turmas</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="publicacao/index.jsp">Publicações</a>
				  </li>
	  			</ul>
			</nav>
            <div class="card">
                <div class="card-header" style="text-align: center">
                    <form action="index.jsp" method="get">
                        <input type="text" name="nome" placeholder="Pesquisar registros">
                        <input type="submit" class="btn-success" value="Pesquisar">
                    </form>
                </div>
            </div>


            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>RA</th>
                        <th>Nome</th>
                        <th>Turma</th>
                        <th>Operações</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (Aluno aluno: listaAluno) {
                    %>
                    <tr>
                        <td><%=aluno.getIdaluno()%></td>
                        <td><%=aluno.getRa().getRa()%></td>
                        <td><%=aluno.getNome()%></td>
                        <td><%=aluno.getTurma().getNomeTurma()%></td>
                        <td>
                        	<a href="aluno/detail.jsp?id=<%=aluno.getIdaluno()%>" class="btn btn-success">Detalhes</a>
                            <a href="aluno/update.jsp?id=<%=aluno.getIdaluno()%>" class="btn btn-warning">Editar</a>
                            <a href="aluno/delete.jsp?id=<%=aluno.getIdaluno()%>" class="btn btn-danger">Excluir</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
            <hr>
            <a href="aluno/cadastroAlunos.jsp" class="btn btn-outline-primary">Novo Registro</a>
        </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</body>
</html>