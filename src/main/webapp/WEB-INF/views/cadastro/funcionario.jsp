<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
	
	<script src="${js}/maskUtils.js"></script>
	<script src="${js}/jquery.maskedinput.js" type="text/javascript"></script>
	
	<script>
	   
	    jQuery(function($){
	    	   $("#cpf").mask("999.999.999-99" , {reverse: true});
	    	   
	    	});
	</script>
	
	
		 <link rel="stylesheet" href="${css}/jquery-ui.css">
		  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		  <script src="${js}/jquery-ui.js"></script>
		  <script>
		  jQuery(function($){
		  		    
		    $( "#datepicker" ).datepicker({
		    		  dateFormat: 'dd/mm/yy',
		    		    dayNames: ['Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado'],
		    		    dayNamesMin: ['D','S','T','Q','Q','S','S','D'],
		    		    dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sáb','Dom'],
		    		    monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
		    		    monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez'],
		    		    nextText: 'Próximo',
		    		    prevText: 'Anterior'
		    	});
		  } );
  </script>
	
<title>Insert title here</title>
</head>

<script>
function limparcampos(){
	with (document.forms[0]) {
		 $("#nome").val("");
		 $("#cpf").val("");
		 $("#dataInicio").val("");
		 $("#obra").val("");
		 
	}

}

function validaNumero(obj,evt) {
	
	var charCode = evt.keyCode;
	if (charCode == 32) return false;
	if (isNaN(String.fromCharCode(charCode))) return false;
	return true;

}
</script>

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
					<form:input path="cpf"  id="cpf" cssClass="form-control" size="50%" onkeypress="return validaNumero(this, event);" />
					<font color="red"><form:errors path="cpf" title="cpf" /></font>
		    </div>
	 		
	 		 <div class="form-group">
		 		 <label>Obra</label>
		 		 <select name="obra.id" class="form-control" id="obra">
	  				 <option value="" >Selecione</option>
	  				 <c:forEach items="${obras}" var="obra">
	  				 <option value="${obra.id}" >${obra.nome}</option>
	  				</c:forEach> 
				 </select>
			</div>
			
		<div class="form-group row">
			 <div class="col-xs-2" >
					<label for="dataInicio">Data Início</label>
					<form:input  path="dataInicio"  cssClass="datepicker" id="datepicker"/>
			</div>
	        
			</div>
			
  <div class="form-group">
    <label for="exampleFormControlFile1"></label>
    <input type="file" class="form-control-file" id="exampleFormControlFile1">
  </div>

			

		<security:authorize access="isAuthenticated()">			
		<button type="submit" class="btn btn-primary" id="gravar" >Gravar</button>
		</security:authorize>
		<a href="javascript:limparcampos();" class="btn btn-warning">Limpar</a>
        
		
	</form:form>			
</div>

</tags:pageTemplate>
</body>
</html>