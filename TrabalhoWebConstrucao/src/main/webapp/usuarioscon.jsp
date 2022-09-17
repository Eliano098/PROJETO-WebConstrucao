<%@page import="com.unifenas.DAO.UsuarioDao"%>
<%@page import="com.unifenas.dominio.Usuario"%>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
      rel="stylesheet" 
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
       crossorigin="anonymous">
       
<title>Listar usuarios</title>
</head>
<% 
   UsuarioDao usuarioDao = new UsuarioDao();
   Usuario usuario = usuarioDao.get(Integer.parseInt(request.getParameter("id")));
%>
<body>

<div class="card">
  <div class="card-header">
   <h1 class="col-md-11 offset-md-5">Listar Usuários
   <a href="Home.jsp?user=<%=usuario.getTipo().name()%>&id=<%=request.getParameter("id")%>"class= "btn btn-primary btn-lg col-md-1 offset-md-4"> Home</a>
   </h1>
  </div> 
</div>
     <%
	  UsuarioDao daoUsuario = new UsuarioDao();
      List<Usuario> ListadeUsuarios = daoUsuario.getAll();
	 %>
	
	<div class="list-group">
  		<a href="usuariosadd.jsp?id=<%=request.getParameter("id") %>" class="list-group-item list-group-item-action active">
  	   		<h3 class="text-center"> Novo Usuário </h3>
  		</a>
 	</div>
 	 	
	<%
	if(!ListadeUsuarios.isEmpty()){
	%>
	<table class="table">
		<thead>
			<tr>
      			<th scope="col">Nome</th>
      			<th scope="col">Senha</th>
     			<th scope="col">Tipo</th>
     			<th scope="col">Ações</th>
			</tr>
		</thead>
		<tbody>
		<% for(Usuario U:ListadeUsuarios){ %>
			<tr>
			  <td><%= U.getNome() %></td>
			  <td><%= U.getSenha() %></td>
			  <td><%= U.getTipo() %></td>
			  <td> <a class="btn btn-secondary" href="usuariosedit.jsp?UsuarioID=<%=U.getId()%>&id=<%=request.getParameter("id")%>" role="button ">Editar</a>
			      <a class="btn btn-danger" href="<%= request.getContextPath() %>/ControllerUsuario?action=del&UsuarioID=<%=U.getId()%>&id=<%=request.getParameter("id")%>">Excluir</a>
			  </td>
			</tr>
		<%} %>
		</tbody>
	</table>
	<%}else{%>
	<p>Sem Usuarios</p>
	<%}%>
</body>
</html>