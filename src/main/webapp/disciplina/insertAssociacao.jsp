<%@page import="dao.DaoDisciplina"%>
<%@page import="dao.DaoAluno"%>
<%@page import="model.AlunoDisciplina"%>
<%@page import="model.Aluno"%>
<%@page import="model.Disciplina"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<jsp:useBean id="alunoDisciplinaDAO" class="dao.DaoAlunoDisciplina" />

<%
AlunoDisciplina alunoDisciplina = new AlunoDisciplina();

int idDisciplina = Integer.parseInt(request.getParameter("disciplina"));
int idAluno = Integer.parseInt(request.getParameter("aluno"));
int n1 = Integer.parseInt(request.getParameter("n1"));
int n2 = Integer.parseInt(request.getParameter("n2"));

Aluno a = new Aluno();
DaoAluno daoA = new DaoAluno();

Disciplina d = new Disciplina();
DaoDisciplina daoD = new DaoDisciplina();

a = daoA.selectId(idAluno).get(0);
d = daoD.selectId(idDisciplina).get(0);

alunoDisciplina.setAluno(a);
alunoDisciplina.setDisciplina(d);
alunoDisciplina.setNota1(n1);
alunoDisciplina.setNota2(n2);

alunoDisciplinaDAO.insert(alunoDisciplina);
%>
<script>
	alert('Cadastrado com sucesso!');

	location.href = '../index.jsp';
</script>