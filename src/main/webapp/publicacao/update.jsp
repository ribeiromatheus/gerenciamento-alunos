<%@page import="java.util.ArrayList"%>
<%@page import="model.Artigo"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="artigosDAO" class="dao.DaoArtigo" />
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
                    <%
                    int id = Integer.parseInt(request.getParameter("id"));

                                            for (Artigo artigos: artigosDAO.selectId(id)) {
                    %>
                    <label for="nome">Título:</label>
                    <input type="hidden" name="id" value="<%=id%>">
                    <input type="text" id="titulo" name="titulo" value="<%=artigos.getTitulo()%>" class="form-control">
                </div>
                <div class="form-group">
                    <label>Data Publicação:</label>
					<input type="date" name="data" value="<%=artigos.getDataPublicacao()%>" placeholder="Data Publicação" class="form-control">
                </div>
                <div class="form-group">
                    <label>Revista:</label>
					<input type="text" name="revista" value="<%=artigos.getRevista()%>" placeholder="Data Publicação" class="form-control">
                </div>
                <div class="form-group">
                    <label>Páginas:</label>
					<input type="text" name="paginas" value="<%=artigos.getNumeroPaginas()%>" placeholder="Data Publicação" class="form-control">
                </div>
                <%
                }
                %>
                <button onclick="redirect()" class="btn btn-warning">Alterar</button>
            </form>
        </div>
		<%
		String titulo = request.getParameter("titulo");
				String data = request.getParameter("data");
				String revista = request.getParameter("revista");
				String paginas = request.getParameter("paginas");

				Artigo artigos = new Artigo();
				
				artigos.setTitulo(titulo);
				artigos.setDataPublicacao(data);
				artigos.setRevista(revista);
				artigos.setNumeroPaginas(paginas);		
				artigos.setTitulo(titulo);	
				artigos.setIdArtigo(id);
				
				artigosDAO.update(artigos);
		%>
		
		<script>
		function redirect() {		
			alert('Atualizado!');

			location.href = './index.jsp';	
		}
	
		</script>
	</body>
</html>