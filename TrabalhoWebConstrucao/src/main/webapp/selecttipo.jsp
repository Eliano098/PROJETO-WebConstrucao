<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.unifenas.DAO.*"%>
<%@page import="com.unifenas.dominio.*"%>

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
       
<title>Selecione o Tipo</title>
</head>
<body>
<% 
   UsuarioDao usuarioDao = new UsuarioDao();
   Usuario usuario = usuarioDao.get(Integer.parseInt(request.getParameter("id")));
%>

<div class="card">
  <div class="card-header">
   <h1 class="col-md-12 offset-md-5">Construção
   <a href="Home.jsp?user=<%=usuario.getTipo().name()%>&id=<%=request.getParameter("id")%>"class= "btn btn-primary btn-lg col-md-1 offset-md-4"> Home</a>
   </h1>
  </div> 
</div>


<div class="container-fluid d-flex flex-wrap">

<div class="col text-center">   
  	<div class="card" style="width: 27rem;">
	 	<img class="col mx-auto text-center card-img-top w-50 p-3 h-50 d-inline-block" src="https://cdn-icons.flaticon.com/png/512/2243/premium/2243652.png?token=exp=1638042274~hmac=8ef8261bc69b65e3c2045317d25c980e" alt="Imagem de capa do card">
  			<div class="card-body">
    			<h3 class="card-title">Residencial</h3>
    			<p class="card-text">Criar projeto Residencial</p>
    			<a href="projetosadd.jsp?Tipo=0&id=<%=request.getParameter("id")%>" class="btn btn-primary">Criar</a>
 			</div>
    </div>
</div>

<div class="col text-center">    
  	<div class="card" style="width: 27rem;">
		<img class="col mx-auto text-center card-img-top w-50 p-3 h-50 d-inline-block " src="https://cdn-icons.flaticon.com/png/512/3524/premium/3524890.png?token=exp=1638042257~hmac=e470dee717f7c27f9afcf4072c4acd75" alt="Imagem de capa do card">
  			<div class="card-body">
    			<h3 class="card-title">Comercial</h3>
    			<p class="card-text">Criar projeto Comercial</p>
    			<a href="projetosadd.jsp?Tipo=1&id=<%=request.getParameter("id")%>" class="btn btn-primary">Criar</a>
 			</div>
    </div>
</div>

<div class="col text-center">  
  	<div class="card" style="width: 27rem;">
		<img class="col mx-auto text-center card-img-top w-50 p-3 h-50 d-inline-block " src="https://cdn-icons.flaticon.com/png/512/3524/premium/3524787.png?token=exp=1638042128~hmac=eb911289b4349cfd3a58ad5b6679c918" alt="Imagem de capa do card">
  			<div class="card-body">
    			<h3 class="card-title">Edifício</h3>
    			<p class="card-text">Criar projeto Edifício</p>
    			<a href="projetosadd.jsp?Tipo=2&id=<%=request.getParameter("id")%>" class="btn btn-primary">Criar</a>
 			</div>
    </div>
</div>
    
</div>
</body>
</html>