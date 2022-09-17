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
   <h1 class="col-md-11 offset-md-5">Meus Projetos
   <a href="Home.jsp?user=<%=usuario.getTipo().name()%>&id=<%=request.getParameter("id")%>"class= "btn btn-primary btn-lg col-md-1 offset-md-4"> Home</a>
   </h1>
  </div> 
</div>

     <%
      List<Residencial>ListaResidencial=null;
      List<Comercial>ListaComercial=null;
      List<Edificio>ListaEdificio=null;
      	int Tipo = Integer.parseInt(request.getParameter("Tipo"));
	  	if(Tipo==0)
	  	{
			ResidencialDao daoProjeto = new ResidencialDao();
			if(request.getParameter("id")!="")
	      	ListaResidencial = daoProjeto.getAllWhere(Integer.parseInt(request.getParameter("id")));  
			else
			ListaResidencial = daoProjeto.getAll();  
				
	  	}
	  	else if(Tipo==1)
	  	{
		   ComercialDao daoProjeto = new ComercialDao();
		   if(request.getParameter("id")!="")
		   ListaComercial = daoProjeto.getAllWhere(Integer.parseInt(request.getParameter("id"))); 
		   else
		   ListaComercial = daoProjeto.getAll();	   
	  	}
	  	else
	  	{
		   EdificioDao daoProjeto = new EdificioDao();
		   if(request.getParameter("id")!="")
	       ListaEdificio = daoProjeto.getAllWhere(Integer.parseInt(request.getParameter("id"))); 
		   else
		   ListaEdificio = daoProjeto.getAll();
	  	}
	    %>
	    <%if(request.getParameter("id")!=""){ %>
	    <div class="list-group">
  			<a href="selecttipo.jsp?id=<%=request.getParameter("id")%>"class="list-group-item list-group-item-action active" class="btn btn-primary">
  			<h3 class="text-center"> Novo Projeto </h3>
  			</a>
 		</div>
	    <%}%>
	    
    	<%
	    if(((Tipo==0)&&(!ListaResidencial.isEmpty()))||((Tipo==1)&&(!ListaComercial.isEmpty()))||((Tipo==2)&&(!ListaEdificio.isEmpty()))){
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
		      <%for(Residencial P:ListaResidencial){ %>
			     <tr>
			  <% 
			  	UsuarioDao daoUsuario = new UsuarioDao();
		        usuario = daoUsuario.get(P.getAuxId().getId());
			  %>
			  	<td><%= usuario.getNome()%></td>
			  	<td><%= P.getArea()%></td>
			  	<td><%= P.getTamanho()%></td>
			  	<td><%= P.getDataRegistro()%></td>
			  	<td><%= P.getAcabamento()%></td>
			  	<td><%= P.getPiso()%></td>
			  	<td><%= P.getTelhado()%></td>
			  	<td><%= P.getTijolo()%></td>
			  	<td class="text-danger"><%= P.MostraDias()%>
			  	<td><%= P.getComodos() %></td>
			  	<td><a class="btn btn-secondary" href="projetosedit.jsp?ProjetoID=<%=P.getId()%>&Tipo=<%=Tipo%>" role="button ">Editar</a>
			    	<a class="btn btn-danger" href="<%= request.getContextPath() %>/ControllerProjeto?action=del&ProjetoID=<%=P.getId()%>&Tipo=<%=Tipo%>&Id=<%=usuario.getId()%>" role="button ">Excluir</a>
			  	</td>
				</tr>
		    <%}%>
		    <%}else if(Tipo==1){%>
		    <%for(Comercial P:ListaComercial)
		    {%>
				<tr>
	 	 	<% 
			  	UsuarioDao daoUsuario = new UsuarioDao();
			  	usuario = daoUsuario.get(P.getAuxId().getId());
			 %>
			  <td><%= usuario.getNome()%></td>
			  <td><%= P.getArea()%></td>
			  <td><%= P.getTamanho()%></td>
			  <td><%= P.getDataRegistro()%></td>
			  <td><%= P.getAcabamento()%></td>
			  <td><%= P.getPiso()%></td>
			  <td><%= P.getTelhado()%></td>
			  <td><%= P.getTijolo()%></td>
			  <td><%= P.getNumLojas()%></td>
			  <td>
			  
			  <%if(request.getParameter("id")!=""){ %>
			  	<td><a class="btn btn-secondary" href="projetosedit.jsp?ProjetoID=<%=P.getId()%>&Tipo=<%=Tipo%>" role="button ">Editar</a>
			    	<a class="btn btn-danger" href="<%= request.getContextPath() %>/ControllerProjeto?action=del&ProjetoID=<%=P.getId()%>&Tipo=<%=Tipo%>&Id=<%=usuario.getId()%>" role="button ">Excluir</a>
			  <%} %>
			  </td>
			</tr>
		    <%}
		    }else{%>
		    <%for(Edificio P:ListaEdificio)
		    {%>
			<tr>
			  <% 
			  UsuarioDao daoUsuario = new UsuarioDao();
			  usuario = daoUsuario.get(P.getAuxId().getId());
			%>
			  <td><%= usuario.getNome()%></td>
			  <td><%= P.getArea()%></td>
			  <td><%= P.getTamanho()%></td>
			  <td><%= P.getDataRegistro()%></td>
			  <td><%= P.getAcabamento()%></td>
			  <td><%= P.getPiso()%></td>
			  <td><%= P.getTelhado()%></td>
			  <td><%= P.getTijolo()%></td>
			  <td><%= P.getNumAndar()%></td>
			  <td><%= P.getApartamentos()%></td>
			  <td>	<a class="btn btn-secondary" href="projetosedit.jsp?ProjetoID=<%=P.getId()%>&Tipo=<%=Tipo%>" role="button ">Editar</a>
			    	<a class="btn btn-danger" href="<%= request.getContextPath() %>/ControllerProjeto?action=del&ProjetoID=<%=P.getId()%>&Tipo=<%=Tipo%>&Id=<%=usuario.getId()%>" role="button ">Excluir</a>
			  </td>
			</tr>
			<%}
		     }
		     %>
</tbody>
	</table>
	<%}else{%>
	<p>Sem Projetos</p>
	<%}%>
</body>
</html>