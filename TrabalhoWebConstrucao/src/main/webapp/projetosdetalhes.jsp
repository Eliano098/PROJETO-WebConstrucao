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
   <h1 class="col-md-11 offset-md-4">Detalhes do Projeto
   <a href="Home.jsp?user=<%=usuario.getTipo().name()%>&id=<%=request.getParameter("id")%>"class= "btn btn-primary btn-lg col-md-1 offset-md-4"> Home</a>
   </h1>
  </div> 
</div>
      
     <%
      Residencial residencial= new Residencial();
      Comercial comercial = new Comercial();
      Edificio edificio = new Edificio();
      	int Tipo = Integer.parseInt(request.getParameter("Tipo"));
	  	if(Tipo==0)
	  	{
			ResidencialDao daoProjeto = new ResidencialDao();
		    residencial = daoProjeto.get(Integer.parseInt(request.getParameter("ProjetoID")));		
	  	}
	  	else if(Tipo==1)
	  	{
	  		ComercialDao daoProjeto = new ComercialDao();
		    comercial = daoProjeto.get(Integer.parseInt(request.getParameter("ProjetoID")));	   
	  	}
	  	else
	  	{
	  		EdificioDao daoProjeto = new EdificioDao();
		    edificio = daoProjeto.get(Integer.parseInt(request.getParameter("ProjetoID")));
	  	}
	    %>
	     <table class="table">
		  <thead>
			 <tr>
				<th scope="col">Usuário</th>
				<th scope="col">Área</th>
				<th scope="col">Tamanho</th>
				<th scope="col">Data Registro</th>
				<th scope="col">Acabamento</th>
				<th scope="col">Piso</th>
				<th scope="col">Telhado</th>
				<th scope="col">Tijolo</th>
				<th class="text-danger" scope="col">DIAS</th>
      
                <% if (Tipo==0){ %>
                <th scope="col">Comôdos</th>
                <%}else if(Tipo==1){%>
				<th scope="col">Nº Lojas</th>
				<%}else{ %>
				<th scope="col">Nº Andares</th>
				<th scope="col">Nº Apartamentos</th>
				<%} %>
			
			  </tr>
		   </thead>
		  <tbody>
		     <% if(Tipo==0){%>
			     <tr>
			  <% 
			  	UsuarioDao daoUsuario = new UsuarioDao();
		        usuario = daoUsuario.get(residencial.getAuxId().getId());
			  %>
			  	<td><%= usuario.getNome()%></td>
			  	<td><%= residencial.getArea()%></td>
			  	<td><%= residencial.getTamanho()%></td>
			  	<td><%= residencial.getDataRegistro()%></td>
			  	<td><%= residencial.getAcabamento()%></td>
			  	<td><%= residencial.getPiso()%></td>
			  	<td><%= residencial.getTelhado()%></td>
			  	<td><%= residencial.getTijolo()%></td>
			  	<td class="text-danger"><%= residencial.MostraDias()%>
			  	<td><%= residencial.getComodos() %></td>
			  </tr>
		    <%}else if(Tipo==1){%>
		    	<tr>
	 	 	<% 
			  	UsuarioDao daoUsuario = new UsuarioDao();
			  	usuario = daoUsuario.get(comercial.getAuxId().getId());
			 %>
			   	<td><%= usuario.getNome()%></td>
			  	<td><%= comercial.getArea()%></td>
			  	<td><%= comercial.getTamanho()%></td>
			  	<td><%= comercial.getDataRegistro()%></td>
			  	<td><%= comercial.getAcabamento()%></td>
			  	<td><%= comercial.getPiso()%></td>
			  	<td><%= comercial.getTelhado()%></td>
			  	<td><%= comercial.getTijolo()%></td>
			  	<td class="text-danger"><%= comercial.MostraDias()%>
			  <td><%= comercial.getNumLojas()%></td>
			  <td>
			</tr>
		    <%}else{%>
		    <tr>
			  <% 
			  UsuarioDao daoUsuario = new UsuarioDao();
			  usuario = daoUsuario.get(edificio.getAuxId().getId());
			  %>
			  	<td><%= usuario.getNome()%></td>
			  	<td><%= edificio.getArea()%></td>
			  	<td><%= edificio.getTamanho()%></td>
			  	<td><%= edificio.getDataRegistro()%></td>
			  	<td><%= edificio.getAcabamento()%></td>
			  	<td><%= edificio.getPiso()%></td>
			  	<td><%= edificio.getTelhado()%></td>
			  	<td><%= edificio.getTijolo()%></td>
			  	<td class="text-danger"><%= edificio.MostraDias()%>
			  <td><%= edificio.getNumAndar()%></td>
			  <td><%= edificio.getApartamentos()%></td>
			</tr>
			<%}%>
</tbody>
	</table>
</body>
</html>