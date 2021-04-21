<%@page import="java.util.ArrayList"%>
<%@page import="model.Disciplina"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="disciplinaDAO" class="dao.DaoDisciplina" />
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

            <form class="form" method="post" action="update.jsp">
                <div class="form-group">
                    <label for="nome">Nome:</label>
                    <%
                        int id = Integer.parseInt(request.getParameter("id"));

                        for (Disciplina disciplina: disciplinaDAO.selectId(id)) {

                    %>
                    <input type="hidden" name="id" value="<%=id%>">
                    <input type="text" id="nome" name="nome" value="<%=disciplina.getNomeDisciplina()%>" class="form-control">
                </div>
                <div class="form-group">
                    <label for="carga-horaria">Carga Horária:</label>
                    <input type="text" id="carga-horaria" name="carga-horaria" value="<%=disciplina.getCargaHoraria()%>" class="form-control">
                </div>
                <%  }%>
                <button onclick="redirect()" class="btn btn-warning">Alterar</button>
            </form>
        </div>
		<%
		String nome = request.getParameter("nome");
		String cargaHoraria = request.getParameter("carga-horaria");
		
		Disciplina disciplina = new Disciplina();
		
		disciplina.setNomeDisciplina(nome);
		disciplina.setCargaHoraria(cargaHoraria);
		disciplina.setIdDisciplina(id);
		
		disciplinaDAO.update(disciplina);
		%>
		
		<script>
		function redirect() {		
			alert('Atualizado!');

			location.href = './index.jsp';	
		}
	
		</script>
	</body>
</html>