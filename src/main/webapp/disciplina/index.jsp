<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Disciplina"%>
<jsp:useBean id="disciplinaDAO" class="dao.DaoDisciplina" />
<!DOCTYPE html>
<html>
    <head>
        <title>Exibição de Registros</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

    </head>
    <body>
        <%
            List<Disciplina> listaDisciplina = new ArrayList<Disciplina>();
            
            String nome = "";
            nome = request.getParameter("nome");

            if (nome != null) {
            	listaDisciplina = disciplinaDAO.selectNome(nome);
            } else {
            	listaDisciplina = disciplinaDAO.select();
            }
        %>
        <div class="container">
            <h1>Sistema de Gerenciamento de Disciplinas</h1>
            <nav class="navbar navbar-expand-sm bg-light">
				<ul class="navbar-nav">
				  <li class="nav-item">
				    <a class="nav-link" href="../index.jsp">Alunos</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="#">Disciplinas</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="../turma/index.jsp">Turmas</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="../publicacao/index.jsp">Publicações</a>
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
                        <th>Nome</th>
                        <th>Carga Horária</th>
                        <th>Operações</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (Disciplina disciplina: listaDisciplina) {
                    %>
                    <tr>
                        <td><%=disciplina.getIdDisciplina()%></td>
                        <td><%=disciplina.getNomeDisciplina()%></td>
                        <td><%=disciplina.getCargaHoraria()%></td>
                        <td>
                            <a href="update.jsp?id=<%=disciplina.getIdDisciplina()%>" class="btn btn-warning">Editar</a>
                            <a href="delete.jsp?id=<%=disciplina.getIdDisciplina()%>" class="btn btn-danger">Excluir</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
            <hr>
            <a href="cadastroDisciplinas.jsp" class="btn btn-outline-primary">Novo Registro</a>
        </div>
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</body>
</html>