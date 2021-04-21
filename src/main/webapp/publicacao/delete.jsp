<%@page import="dao.DaoArtigosAcademicos"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Exclui Registros</title>
</head>
<body>

<%
int id = Integer.parseInt(request.getParameter("id"));

DaoArtigosAcademicos dao = new DaoArtigosAcademicos();
dao.delete(id);

%>

<script> 

alert("Registro excluido com Sucesso");
window.location.href = "index.jsp";

</script>

</body>
</html>