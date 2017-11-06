<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
   
 <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
</head>
<body>

<nav class="navbar navbar-default" >
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">CGObras</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="${s:mvcUrl('HC#index').build()}" rel="nofollow">Home</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Cadastro <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="${s:mvcUrl('OC#listar').build()}" rel="nofollow">Obras</a></li>	
           <li><a href="${s:mvcUrl('FC#init').build()}" rel="nofollow">Funcionario</a></li>	
          <li><a href="#">Documentos</a></li>
        </ul>
      </li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Gerência <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Transferência de Funcionário</a></li>
            <li><a href="#">Histórico</a></li>
         
        </ul>
      </li>
      <li><a href="#">Documentos Digitalizados</a></li>
    </ul>
    
    <ul class="nav navbar-collapse navbar-nav navbar-right">
    <li><a href="#">
    <security:authentication property="principal" var="usuario"/>
       ${usuario.nome}
     </a>
    </ul>
  
    
  </div>
   
</nav>
  
</body>
</html>
