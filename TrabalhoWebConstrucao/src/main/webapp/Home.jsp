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
<title>Home</title>
</head>
<body>

<div class="card">
  <div class="card-header">
   <h1 class="col-md-11 offset-md-5">Construct-SIM
   <a href="Login.jsp?"class= "btn btn-danger btn-lg col-md-1 offset-md-4"> Sair</a>
   </h1>
  </div> 
</div>

<div class="container-fluid d-flex flex-wrap">

<div class="col text-center">  
	<div class="card" style="width: 20rem;">
	 	<img class="col mx-auto text-center card-img-top w-50 p-3 h-50 d-inline-block " src="https://cdn-icons.flaticon.com/png/512/1665/premium/1665680.png?token=exp=1638037128~hmac=a373c9e1b4295dcc86128be49eaf1bac" alt="Imagem de capa do card">
      	<div class="card-body">
	    	<h3 class="card-title">Criar Projeto</h3>
	        <p class="card-text">Novo projeto</p>
    		<a href="selecttipo.jsp?id=<%=request.getParameter("id")%>" class="btn btn-primary">Criar Novo Projeto</a>
  		</div>
   	</div>
</div>

<div class="col text-center">  
<div class="card" style="width: 20rem;">
	<img class="col mx-auto text-center card-img-top w-50 p-3 h-50 d-inline-block" src="https://cdn-icons-png.flaticon.com/512/888/888116.png" alt="Imagem de capa do card">
     	<div class="card-body">
        		<h3 class="card-title">Listar Meus Projetos</h3>
        		<p class="card-text">Seus projetos da comunidade</p>
    			<a href="selecttipoLista.jsp?id=<%=request.getParameter("id")%>" class="btn btn-primary">Listar</a>
  		</div>
</div>
</div>

<div class="col text-center">  
<div class="card" style="width: 20rem;">
	<img class=" col mx-auto text-centercard-img-top w-50 p-3 h-50 d-inline-block"  src="https://cdn-icons.flaticon.com/png/512/5805/premium/5805608.png?token=exp=1638037032~hmac=756d8d0c66b21101216507c26da3fdfa" alt="Imagem de capa do card">
      	<div class="card-body">
        	<h3 class="card-title">Comunidade</h3>
        	<p class="card-text">Todos os projetos da comunidade</p>
    		<a href="projetoscomunidade.jsp?id=<%=request.getParameter("id") %>" class="btn btn-primary">Listar Todos</a>
  		</div>
</div>
</div>
<%if((request.getParameter("user")).equals("Admin")){%>
<div class="col text-center">  
<div class="card" style="width: 20rem;">
	 <img class="col mx-auto text-center card-img-top w-50 p-3 h-50 d-inline-block" src="https://cdn-icons.flaticon.com/png/512/3772/premium/3772224.png?token=exp=1638037831~hmac=68644f3d05c32cc8c92b81421f627736" alt="Imagem de capa do card">
  		<div class="card-body">
	    	<h3 class="card-title">Gestão de Usuarios</h3>
	    	<p class="card-text">Usuarios da comunidade</p>
	    	<a href="usuarioscon.jsp?id=<%=request.getParameter("id") %>" class="btn btn-primary">Listar</a>
	    </div>
</div>
</div>
<%} %>

</div>
</body>
</html>