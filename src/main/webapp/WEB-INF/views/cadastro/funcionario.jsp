<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
 
 

<html>
<head>
 <spring:url value="/resources/css" var="css"></spring:url>
    <spring:url value="/resources/js" var="js"></spring:url>
    <spring:url value="/resources/images" var="images"></spring:url>
    <spring:url value="/resources/locales" var="locales"></spring:url>
    <!--bootstrap-->
    <link href="${css}/bootstrap.min.css" rel="stylesheet" type="text/css">
 	<link rel="stylesheet" href="${css}/datepicker.css">
	
	
	<script>     
     $(document).ready(function() {
    	 $('.datepicker').datepicker({
    		  dateFormat: 'dd/mm/yy',
    		    dayNames: ['Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado'],
    		    dayNamesMin: ['D','S','T','Q','Q','S','S','D'],
    		    dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sáb','Dom'],
    		    monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
    		    monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez'],
    		    nextText: 'Próximo',
    		    prevText: 'Anterior'
    	});
    	 
    	 setaMascara(dataInicio,MASK_DATA); 
    	 setaMascara(dataFim,MASK_DATA); 
    		
     });
     
     </script>
<title>Insert title here</title>
</head>
<body>
<tags:pageTemplate titulo="Cadastro de Funcionarios">

<div class="container">
		<form:form action="${s:mvcUrl('FC#gravar').build()}" method="POST" commandName="funcionario" enctype="multipart/form-data">	
			<div class="form-group">
			
				<label>Nome</label>
							 
				<form:input rows="1" path="nome" cssClass="form-control" size="50%" id="nome"/>
				<form:hidden  path="id" id="id"/>
				<font color="red"><form:errors path="nome" /></font>
		   </div>
		  
			<div class="form-group">
					<label>CPF</label>
					<form:input path="cpf"  cssClass="form-control" size="50%"/>
					<font color="red"><form:errors path="cpf" title="cpf" /></font>
		    </div>
	 		
	 		 <div class="form-group">
		 		 <label>Obra</label>
		 		 <select class="form-control">
	  				<option>Via 1</option>
	  				<option>G2O</option>
	  				<option>Via 2</option>
	  				<option>Odebreche</option>
				 </select>
			</div>
			
		<div class="form-group row">
			 <div class="col-xs-2" >
					<label for="dataInicio">Data Início</label>
					<form:input  path="dataInicio"  cssClass="datepicker"/>
			</div>
	        
			</div>
			
<form>
  <div class="form-group">
    <label for="exampleFormControlFile1"></label>
    <input type="file" class="form-control-file" id="exampleFormControlFile1">
  </div>
</form>
			

		<security:authorize access="isAuthenticated()">			
		<button type="submit" class="btn btn-primary" id="gravar" >Gravar</button>
		</security:authorize>
		<a href="javascript:limparcampos();" class="btn btn-warning">Limpar</a>
        
		
	</form:form>			
</div>

</tags:pageTemplate>
</body>
</html>