<%@page import="com.unifenas.dominio.TipoUsuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Login Construc SIM</title>
</head>
<body>

<form action="ControllerLogin" method="get">

<div class="container-fluid h-custom">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-md-6 col-lg-4 col-xl-3">
        <img src="https://cdn-icons-png.flaticon.com/512/5087/5087579.png" class="img-fluid"
          alt="Sample image">
      </div>
      <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
        <form>
            <p class="lead fw-normal mb-0 me-3">Faça seu Login</p>
          <div class="divider d-flex align-items-center my-4">
          </div>

          <!-- Email input -->
          <div class="form-outline mb-4">
            <input type="text" id="form3Example3" class="form-control form-control-lg"
              placeholder="Nome" name="nome" />
            <label class="form-label" for="form3Example3">Nome</label>
          </div>

          <!-- Password input -->
          <div class="form-outline mb-3">
            <input type="password" id="form3Example4" class="form-control form-control-lg"
              placeholder="Senha" name="senha" />
            <label class="form-label" for="form3Example4">Senha</label>
          </div>

          <div class="text-center text-lg-start mt-4 pt-2">
            <a href="Home.jsp">
            	<button type="submit" class="btn btn-primary btn-lg" 
              style="padding-left: 2.5rem; padding-right: 2.5rem;">Entrar</button>
            </a>	
              
          </div>

        </form>
      </div>
    </div>
  </div>
</form>
</body>
</html>




