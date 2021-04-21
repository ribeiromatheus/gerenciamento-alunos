<%@page import="dao.DaoArtigosAcademicos"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.ArtigosAcademicos"%>
<%
ArtigosAcademicos artigos = new ArtigosAcademicos();
DaoArtigosAcademicos dao = new DaoArtigosAcademicos();

String titulo = request.getParameter("titulo");
String data = request.getParameter("data");
String revista = request.getParameter("revista");
String paginas = request.getParameter("paginas");

artigos.setTitulo(titulo);
artigos.setDataPublicacao(data);
artigos.setRevista(revista);
artigos.setNumeroPaginas(paginas);


dao.insert(artigos);
%>

<script>
	alert('Cadastrado com sucesso!');

	location.href = './index.jsp';
</script>