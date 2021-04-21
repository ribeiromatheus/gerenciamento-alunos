<%@page import="dao.DaoDisciplina"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.Disciplina"%>
<%
Disciplina disciplina = new Disciplina();
DaoDisciplina dao = new DaoDisciplina();

String nome = request.getParameter("nome");
String cargaHoraria = request.getParameter("carga-horaria");

disciplina.setNomeDisciplina(nome);
disciplina.setCargaHoraria(cargaHoraria);

dao.insert(disciplina);
%>

<script>
	alert('Cadastrado com sucesso!');

	location.href = './index.jsp';
</script>