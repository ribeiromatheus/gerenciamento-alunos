<%@page import="dao.DaoTurma"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.Turma"%>
<%
Turma turma = new Turma();
DaoTurma dao = new DaoTurma();

String nome = request.getParameter("nome");
String ano = request.getParameter("ano");

turma.setNomeTurma(nome);
turma.setAnoTurma(ano);

dao.insert(turma);
%>

<script>
	alert('Cadastrado com sucesso!');

	location.href = './index.jsp';
</script>