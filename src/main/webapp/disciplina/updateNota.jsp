<%@page import="dao.DaoAlunoDisciplina"%>
<%@page import="dao.DaoDisciplina"%>
<%@page import="model.Disciplina"%>
<%@page import="dao.DaoAluno"%>
<%@page import="model.Aluno"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.AlunoDisciplina"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="alunoDisciplinaDAO" class="dao.DaoAlunoDisciplina" />
<!DOCTYPE html>
<html>
    <head>
        <title>Alterar Registro</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <h1>Alterar Registro</h1>

            <form class="form" method="post" action="updateNota.jsp">
                <div class="form-group">
                	<label for="n1">Nota 1:</label>
                    <%
                        int id = Integer.parseInt(request.getParameter("id"));

                        for (AlunoDisciplina disciplina: alunoDisciplinaDAO.selectId(id)) {

                    %>
                    <input type="hidden" name="id" value="<%=id%>">
                    <input type="text" id="n1" name="n1" value="<%=disciplina.getNota1()%>" class="form-control">
                </div>
                <div class="form-group">
                    <label for="n2">Nota 2:</label>
                    <input type="text" id="n2" name="n2" value="<%=disciplina.getNota2()%>" class="form-control">
                </div>
                <%  }%>
                <button class="btn btn-warning">Alterar</button>
            </form>
        </div>
		<%
		try {
			int nota1 = Integer.parseInt(request.getParameter("n1"));
			int nota2 = Integer.parseInt(request.getParameter("n2"));
			
			AlunoDisciplina disciplina = new AlunoDisciplina();
			DaoAlunoDisciplina dao = new DaoAlunoDisciplina();
			
			disciplina.setNota1(nota1);
			disciplina.setNota2(nota2);
			disciplina.setId(id);
			
			dao.update(disciplina);
		} catch(Exception e) {
			
		}
		
		%>
		
		<script>
		function redirect() {		
			alert('Atualizado!');

			location.href = '../index.jsp';	
		}
	
		</script>
	</body>
</html>