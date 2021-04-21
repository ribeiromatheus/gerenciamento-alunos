<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.ArtigosAcademicos"%>
<jsp:useBean id="artigosDAO" class="dao.DaoArtigosAcademicos" />
<!DOCTYPE html>
<html>
    <head>
        <title>Exibição de Registros</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

    </head>
    <body>
        <%
            List<ArtigosAcademicos> listaArtigos = new ArrayList<ArtigosAcademicos>();
            
            String nome = "";
            nome = request.getParameter("nome");

            if (nome != null) {
            	listaArtigos = artigosDAO.selectNome(nome);
            } else {
            	listaArtigos = artigosDAO.select();
            }
        %>
        <div class="container">
            <h1>Sistema de Gerenciamento de Turmas</h1>
            <nav class="navbar navbar-expand-sm bg-light">
				<ul class="navbar-nav">
				  <li class="nav-item">
				    <a class="nav-link" href="../index.jsp">Alunos</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="../disciplina/index.jsp">Disciplinas</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="../turma/index.jsp">Turmas</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="#">Publicações</a>
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
                        <th>Título</th>
                        <th>Data Publicação</th>
                        <th>Revista</th>
                        <th>Páginas</th>
                        <th>Operações</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (ArtigosAcademicos artigos: listaArtigos) {
                    %>
                    <tr>
                        <td><%=artigos.getIdArtigo()%></td>
                        <td><%=artigos.getTitulo()%></td>
                        <td><%=artigos.getDataPublicacao()%></td>
                        <td><%=artigos.getRevista()%></td>
                        <td><%=artigos.getNumeroPaginas()%></td>
                        <td>
                            <a href="update.jsp?id=<%=artigos.getIdArtigo()%>" class="btn btn-warning">Editar</a>
                            <a href="delete.jsp?id=<%=artigos.getIdArtigo()%>" class="btn btn-danger">Excluir</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
            <hr>
            <a href="cadastroArtigos.jsp" class="btn btn-outline-primary">Novo Registro</a>
        </div>
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</body>
</html>