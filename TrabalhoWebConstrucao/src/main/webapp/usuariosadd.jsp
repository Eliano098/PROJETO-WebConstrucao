<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.List"%>
<%@page import="com.unifenas.dominio.*"%>
<%@page import="com.unifenas.DAO.*"%>
<%@page import="com.unifenas.dominio.EnumProjeto.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
      rel="stylesheet" 
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
       crossorigin="anonymous">  
       
<meta charset="ISO-8859-1">
<title>Novo usuario</title>
</head>
<%
     // int Tipo = Integer.parseInt(request.getParameter("Tipo"));
	//  UsuarioDao daoUsuario = new UsuarioDao();
//      Usuario usuario = daoUsuario.get(Integer.parseInt(request.getParameter("id"))); 
%>
<body>
<div class="card">
  <div class="card-header">
    <h2 class="text-center"> Novo Usu?rio </h2>
  </div>
</div>

<div class="list-group">
	<a class="list-group-item-secondary list-group-item">
  		<h3 class="text-center"></h3>
  	</a>
</div>

<form action="ControllerUsuario" method="post">

<input type="hidden" name="user" value =<%=request.getParameter("id")%>>
<div class="col-md-5 offset-md-1">
 <h3>Nome </h3>
    <input type="text" name=nome class="form-control-lg" placeholder="Nome">
    </br>
</div>
 </br>
 
<div class="col-md-5 offset-md-1">
 <h3>Senha</h3>
    <input type="password" name=senha class="form-control-lg" placeholder="Senha">
    </br>
</div>
</br>

<div class="col-md-5 offset-md-1">
	<h3> Tipo Usu?rio</h3>
	<select class="form-control form-control-lg" name="Tipo" id="tipo">
  		<option value="<%=TipoUsuario.Admin.name()%>">Admin</option>
  		<option value="<%=TipoUsuario.User.name()%>">User</option>
	</select>
</br>
</br>
</br>
 		<input type="submit" class="btn btn-primary btn-lg" value="Salvar"> 
 </form>
</body>
</html>