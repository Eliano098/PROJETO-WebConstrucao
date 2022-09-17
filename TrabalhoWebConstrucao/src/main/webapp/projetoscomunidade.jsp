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
       
<title>Listar projetos</title>
</head>
<% 
   UsuarioDao usuarioDao = new UsuarioDao();
   Usuario usuario = usuarioDao.get(Integer.parseInt(request.getParameter("id")));
%>
<body>

<div class="card">
  <div class="card-header">
   <h1 class="col-md-10 offset-md-4"> Projetos Comunidade
   <a href="Home.jsp?user=<%=usuario.getTipo().name()%>&id=<%=request.getParameter("id")%>"class= "btn btn-primary btn-lg col-md-1 offset-md-4"> Home</a>
   </h1>
  </div> 
</div>


     <%
      List<Residencial>ListaResidencial=null;
      List<Comercial>ListaComercial=null;
      List<Edificio>ListaEdificio=null;
      
			ResidencialDao daoResidencial = new ResidencialDao();
			ListaResidencial = daoResidencial.getAll();  	

		    ComercialDao daoComercial = new ComercialDao();
		    ListaComercial = daoComercial.getAll();	   
	  
		    EdificioDao daoEdificio = new EdificioDao();
		    ListaEdificio = daoEdificio.getAll();
	 %>
	 <div class="container-fluid d-flex flex-wrap">
	 <% 	    
    	if((!ListaResidencial.isEmpty())){
	    for(Residencial R: ListaResidencial){
	    %>
	    <div class="col text-center">   
  			<div class="card" style="width: 20rem;">
	 			<img class="col mx-auto text-center card-img-top w-50 p-3 h-50 d-inline-block" src="https://cdn-icons.flaticon.com/png/512/2243/premium/2243652.png?token=exp=1638042274~hmac=8ef8261bc69b65e3c2045317d25c980e" alt="Imagem de capa do card">
  					<div class="card-body">
    					<h3 class="card-title">Residencial</h3>
    					<p class="card-text"><%=R.getAuxId().getNome()%></p>
    					<p class="card-text"><%=R.getDataRegistro()%></p>
    					<p class="card-text text-danger"><%=R.MostraDias()%> dias</p>

    					<a href="projetosdetalhes.jsp?Tipo=0&id=<%=request.getParameter("id")%>&ProjetoID=<%=R.getId()%>"class="btn btn-primary">Detalhes</a>
 					</div>
    		</div>
		</div>
		 
	 	<%}
	   	}if((!ListaComercial.isEmpty())){
		    for(Comercial R: ListaComercial){
		    %>
		    <div class="col text-center">   
	  			<div class="card" style="width: 20rem;">
		 			<img class="col mx-auto text-center card-img-top w-50 p-3 h-50 d-inline-block " src="https://cdn-icons.flaticon.com/png/512/3524/premium/3524890.png?token=exp=1638042257~hmac=e470dee717f7c27f9afcf4072c4acd75" alt="Imagem de capa do card">
	  					<div class="card-body">
	    					<h3 class="card-title">Comercial</h3>
	    					<p class="card-text"><%=R.getAuxId().getNome()%></p>
	    					<p class="card-text"><%=R.getDataRegistro()%></p>
	    					<p class="card-text text-danger"><%=R.MostraDias()%> dias</p>

	    				    <a href="projetosdetalhes.jsp?Tipo=1&id=<%=request.getParameter("id")%>&ProjetoID=<%=R.getId()%>"class="btn btn-primary">Detalhes</a>
	 					</div>
	    		</div>
			</div>			 
		 <%}
		}	    
    	if((!ListaEdificio.isEmpty())){
	    for(Edificio R: ListaEdificio){
	    %>
	    <div class="col text-center">   
  			<div class="card" style="width: 20rem;">
	 			<img class="col mx-auto text-center card-img-top w-50 p-3 h-50 d-inline-block " src="https://cdn-icons.flaticon.com/png/512/3524/premium/3524787.png?token=exp=1638042128~hmac=eb911289b4349cfd3a58ad5b6679c918" alt="Imagem de capa do card">
  					<div class="card-body">
    					<h3 class="card-title">Edifício</h3>
    					<p class="card-text"><%=R.getAuxId().getNome()%></p>
    					<p class="card-text"><%=R.getDataRegistro()%></p>
    					<p class="card-text text-danger"><%=R.MostraDias()%> dias</p>

    				    <a href="projetosdetalhes.jsp?Tipo=2&id=<%=request.getParameter("id")%>&ProjetoID=<%=R.getId()%>"class="btn btn-primary">Detalhes</a>
 					</div>
    		</div>
		</div>
	<%}
	    }else{%>
	<p>Sem Projetos</p>
	<%}%>
</body>
</html>