<%@page import="dao.DaoArtigo"%>
<%@page import="model.Artigo"%>
<%@page import="model.AlunoArtigo"%>
<%@page import="dao.DaoAluno"%>
<%@page import="model.Aluno"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<jsp:useBean id="alunoArtigoDAO" class="dao.DaoAlunoArtigo" />

<%
AlunoArtigo alunoArtigo = new AlunoArtigo();

int idArtigo = Integer.parseInt(request.getParameter("artigo"));
int idAluno = Integer.parseInt(request.getParameter("aluno"));

Aluno a = new Aluno();
DaoAluno daoA = new DaoAluno();

Artigo artigo = new Artigo();
DaoArtigo daoArtigo = new DaoArtigo();

a = daoA.selectId(idAluno).get(0);
artigo = daoArtigo.selectId(idArtigo).get(0);

alunoArtigo.setAluno(a);
alunoArtigo.setArtigo(artigo);

alunoArtigoDAO.insert(alunoArtigo);
%>
<script>
	alert('Cadastrado com sucesso!');

	location.href = '../index.jsp';
</script>