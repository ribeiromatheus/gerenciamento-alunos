<%@page import="dao.DaoTelefone"%>
<%@page import="dao.DaoAluno"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.Aluno"%>
<%@ page import="model.Telefone"%>
<%
String ddd = request.getParameter("ddd");
String numero = request.getParameter("numero");
String tipo = request.getParameter("tipo");
int idAluno = Integer.parseInt(request.getParameter("aluno"));

Aluno aluno = new Aluno();
DaoAluno daoAluno = new DaoAluno();

aluno = daoAluno.selectId(idAluno).get(0);

Telefone telefone = new Telefone();

telefone.setTipo(tipo);
telefone.setDdd(ddd);
telefone.setNumero(numero);
telefone.setAluno(aluno);

DaoTelefone dao = new DaoTelefone();

dao.insert(telefone);
%>

<script>
	alert('Cadastrado com sucesso!');

	location.href = '../index.jsp';
</script>