<%@page import="dao.DaoAluno"%>
<%@page import="dao.DaoTurma"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.Aluno"%>
<%@ page import="model.RA"%>
<%@ page import="model.Turma"%>
<%@ page import="model.Endereco"%>
<%
Aluno aluno = new Aluno();
DaoAluno dao = new DaoAluno();

String nome = request.getParameter("nome");
String email = request.getParameter("email");
String logradouro = request.getParameter("logradouro");
String bairro = request.getParameter("bairro");
String cidade = request.getParameter("cidade");
String estado = request.getParameter("estado");
String cep = request.getParameter("cep");
String complemento = request.getParameter("complemento");
String numero = request.getParameter("numero");
String tipo = request.getParameter("tipo");
int ra = Integer.parseInt(request.getParameter("ra"));
int idTurma = Integer.parseInt(request.getParameter("turma"));

RA objRa = new RA();
objRa.setRa(ra);

Turma turma = new Turma();
DaoTurma daoTurma = new DaoTurma();

turma = daoTurma.selectId(idTurma).get(0);

Endereco endereco = new Endereco();
endereco.setTipo(tipo);
endereco.setBairro(bairro);
endereco.setCep(cep);
endereco.setCidade(cidade);
endereco.setComplemento(complemento);
endereco.setEstado(estado);
endereco.setLogradouro(logradouro);
endereco.setNumero(numero);

aluno.setNome(nome);
aluno.setEmail(email);
aluno.setEndereco(endereco);
aluno.setRa(objRa);
aluno.setTurma(turma);

dao.insert(aluno);
%>

<script>
	alert('Cadastrado com sucesso!');

	location.href = '../index.jsp';
</script>