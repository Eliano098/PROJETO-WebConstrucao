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
<title>Novo projeto</title>
</head>
<%
      int Tipo = Integer.parseInt(request.getParameter("Tipo"));
	  UsuarioDao daoUsuario = new UsuarioDao();
      Usuario usuario = daoUsuario.get(Integer.parseInt(request.getParameter("id"))); 
%>
<body>

<form action="ControllerProjeto" method="post">
<input type="hidden" name="tipo" value=<%=Tipo %>>
<input type=hidden name="UsuarioID" value=<%=usuario.getId()%>> 
</br>

<div class="card">
  <div class="card-header">
   <h1 class="col-md-10 offset-md-4">Dados da Construção
   <a href="Home.jsp?user=<%=usuario.getTipo().name()%>&id=<%=request.getParameter("id")%>"class= "btn btn-primary btn-lg col-md-1 offset-md-4"> Home</a>
   </h1>
  </div> 
</div>

<div class="row">
<div class="col-md-5 offset-md-1">
 <h3>Tamanho Area m² </h3>
    <input type="number" name=area class="form-control-lg" placeholder="Terreno">
    </br>
</div>


<div class="col-md-5">
 <h3>Tamanho m²</h3>
    <input type="number" name=tamanho class="form-control-lg" type="text" placeholder="Construção">
    </br>
</div>
</div>

<div class="row">
<div class="col-md-5 offset-md-1">
    <h3> Tipo Acabamento</h3>
    <select  name="acabamento" id="Acabamento" class="form-control form-control-lg">
		<option value="<%=Acabamento.Gesso.name()%>">Gesso</option>
  		<option value="<%=Acabamento.MassaCorrida.name()%>">Massa Corrida</option>
  		<option value="<%=Acabamento.RebocoConvencional.name()%>">Reboco Convencional</option>
  	</select>
    </br>
</div>


<div class="col-md-5">
    <h3> Tipo Piso</h3>
    <select class="form-control form-control-lg" name="piso" id="Piso">
 	 	<option value="<%=Piso.Ceramica.name()%>">Cerâmica</option>
  		<option value="<%=Piso.LaminadoMadeira.name()%>">Laminado de Madeira</option>
  		<option value="<%=Piso.Porcelanato.name()%>">Porcelanato</option> 
    </select>
    </br>
</div>  
</div> 
   
<div class="row">
<div class="col-md-5 offset-md-1"">
    <h3> Tipo Tijolo</h3>
    <select class="form-control form-control-lg" name="tijolo" id="Tijolo">
      	<option value="<%=Tijolo.Bloco.name()%>">Bloco</option>
 	 	<option value="<%=Tijolo.Baiano.name()%>">Baiano</option>
  		<option value="<%=Tijolo.Tijolinho.name()%>">Tijolinho</option> 
    </select>
</div> 
    
	</br>
        
<div class="col-md-5">
    <h3> Tipo Telhado</h3>
    <select class="form-control form-control-lg" name="telhado" id="Telhado">
 	 	<option value="<%=Telhado.Embutido.name()%>">Embutido</option>
  		<option value="<%=Telhado.Fibrocimento.name()%>">Fibrocimento</option>
  		<option value="<%=Telhado.Metalico.name()%>">Metálico</option> 
    </select>
    </br>
</div> 
</div> 

<%if (Tipo==0){ %>
<div class="col-md-5 offset-md-1">
 <h3>N° Cômodos</h3>
    <input type="number" name=comodos class="form-control-lg" placeholder="Quantidade">
    </br>
</div>
</br>  
<%} %>

<%if (Tipo==1){ %>
<div class="col-md-5 offset-md-1">
 <h3>N° Lojas</h3>
    <input type="number" name= lojas class="form-control-lg" placeholder="Quantidade">
    </br>
</div>
</br> 
<%} %>

<%if(Tipo==2){%>
<div class="row">
<div class="col-md-5 offset-md-1">
 <h3>N° Andares</h3>
    <input type="number" name=andares class="form-control-lg" placeholder="Quantidade">
    </br>
</div>
    </br>
    
<div class="col-md-5">
 <h3>Nº Apartamentos</h3>
    <input type="number" name=apartamentos class="form-control-lg" type="text" placeholder="Quantidade">
    </br>
</div>
</div>
<%} %>
    </br>
        </br>
      
 		<input type="submit" class="col-md-1 offset-md-1 btn btn-primary btn-lg" value="Salvar"> 	
</form>
</body>
</html>