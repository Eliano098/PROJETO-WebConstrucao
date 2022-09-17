<%@page import="com.unifenas.dominio.*"%>
<%@page import="com.unifenas.DAO.*"%>
<%@page import="com.unifenas.dominio.EnumProjeto.Telhado"%>
<%@page import="com.unifenas.dominio.EnumProjeto.Tijolo"%>
<%@page import="com.unifenas.dominio.EnumProjeto.Piso"%>
<%@page import="com.unifenas.dominio.EnumProjeto.Acabamento"%>
<%@page import="com.unifenas.dominio.TipoUsuario"%>
<%@page import="com.unifenas.DAO.UsuarioDao"%>
<%@page import="com.unifenas.dominio.Usuario"%>
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
<title>Editar projeto</title>
</head>
<body>
<% 
	int Tipo = Integer.parseInt(request.getParameter("Tipo"));
    int ID = Integer.parseInt(request.getParameter("ProjetoID"));
%>

<form action="ControllerProjeto" method="post">

<input type=hidden name=Tipo value=<%=Tipo%>>

<%if(Tipo==0){
ResidencialDao residencialDao = new ResidencialDao();
Residencial obj = residencialDao.get(ID);
%>

<input type=hidden name="ProjetoID" value=<%=obj.getId()%>> 

<div class="card">
  <div class="card-header">
    <h2 class="text-center"> Editar Construção </h2>
  </div>
</div>

<input type=hidden name="ProjetoID" value=<%=obj.getId()%>> 
</br>

<div class="row">
<div class="col-md-5 offset-md-1">
 <h3>Tamanho Area m² </h3>
    <input type="number" name= area class="form-control-lg" value=<%=obj.getArea()%>>
    </br>
</div>


<div class="col-md-5">
 <h3>Tamanho m²</h3>
    <input type="number" name= tamanho class="form-control-lg" value =<%=obj.getTamanho()%>>
    </br>
</div>
</div>

<div class="row">
<div class="col-md-5 offset-md-1">
    <h3> Tipo Acabamento</h3>
    <select class="form-control form-control-lg" name="acabamento" id="Acabamento">
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

<div class="col-md-5 offset-md-1">
 <h3>N° Cômodos</h3>
 	<input type="number" name= comodos class="form-control-lg" value =<%=obj.getComodos()%>>
    </br>
</div>
</br>


<%}else if (Tipo==1){ 

	ComercialDao comercialDao = new ComercialDao();
    Comercial obj = comercialDao.get(ID);
%>
<input type=hidden name="ProjetoID" value=<%=obj.getId()%>> 

<div class="card">
  <div class="card-header">
    <h2 class="text-center"> Editar Construção </h2>
  </div>
</div>

<input type=hidden name="ProjetoID" value=<%=obj.getId()%>> 
</br>

<div class="row">
<div class="col-md-5 offset-md-1">
 <h3>Tamanho Area m² </h3>
    <input type="number" name= area class="form-control-lg" value=<%=obj.getArea()%>>
    </br>
</div>

<div class="col-md-5">
 <h3>Tamanho m²</h3>
    <input type="number" name=tamanho class="form-control-lg" value =<%=obj.getTamanho()%>>
    </br>
</div>
</div>

<div class="row">
<div class="col-md-5 offset-md-1">
    <h3> Tipo Acabamento</h3>
    <select class="form-control form-control-lg" name="acabamento" id="Acabamento">
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

<div class="col-md-5 offset-md-1">
 <h3>N° Lojas</h3>
    <input type="number" name=lojas class="form-control-lg" value=<%=obj.getNumLojas()%>>
    </br>
</div>

<%} else if(Tipo==2){
EdificioDao edificioDao = new EdificioDao();
Edificio obj = edificioDao.get(ID);
%>

<input type=hidden name="ProjetoID" value=<%=obj.getId()%>> 
</br>

<div class="card">
  <div class="card-header">
    <h2 class="text-center"> Editar Construção </h2>
  </div>
</div>


<input type=hidden name="ProjetoID" value=<%=obj.getId()%>> 
</br>

<div class="row">
<div class="col-md-5 offset-md-1">
 <h3>Tamanho Area m² </h3>
    <input type="number" name= area class="form-control-lg" value=<%=obj.getArea()%>>
    </br>
</div>


<div class="col-md-5">
 <h3>Tamanho m²</h3>
    <input type="number" name= tamanho class="form-control-lg" value =<%=obj.getTamanho()%>>
    </br>
</div>
</div>

<div class="row">
<div class="col-md-5 offset-md-1">
    <h3> Tipo Acabamento</h3>
    <select class="form-control form-control-lg" name="acabamento" id="Acabamento">
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

<div class="row">
<div class="col-md-5 offset-md-1">
 <h3>N° Andares</h3>
    <input type="number" name= andares class="form-control-lg" value = <%=obj.getNumAndar()%>>
    </br>
</div>
    </br>
    
<div class="col-md-5">
 <h3>Nº Apartamentos</h3>
    <input type="number" name= apartamentos class="form-control-lg" value =<%=obj.getApartamentos()%>>
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