
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
 
 
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
 
<tags:pageTemplate
	titulo="Cadastro de Obras">

	<html>
<head>


 <spring:url value="/resources/css" var="css"></spring:url>
    <spring:url value="/resources/js" var="js"></spring:url>
    <spring:url value="/resources/images" var="images"></spring:url>
    <spring:url value="/resources/locales" var="locales"></spring:url>
    <!--bootstrap-->
    <link href="${css}/bootstrap.min.css" rel="stylesheet" type="text/css">
 
    <!--component-css-->
    <script src="${js}/jquery-3.2.1.min.js"></script>
    <script src="${js}/bootstrap.min.js"></script>
     
	<link rel="stylesheet" href="${css}/bootstrap.css">
	<link rel="stylesheet" href="${css}/datepicker.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js">
	<script src="${js}/main.js"></script>
	<script src="${js}/bootstrap.js"></script>
	<script src="${js}/bootstrap-datepicker.js"></script>
	 
	  <link rel="stylesheet" href="${css}/jquery-ui.css">
      <script src="${js}/jquery.js"></script>
      <script src="${js}/jquery-ui.js"></script>
	  <script src="${js}/maskUtils.js"></script>
	
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
</head>

<script>

$(document).ready(function(){
	 $('#atualizar').attr('disabled', 'disabled'); 
});
		
	
  function popularcampos(i,nom,cnp,datIni,datFim){
    		with (document.forms[0]) {
    			 $("#id").val(i);
    			 $("#nome").val(nom);
    			 $("#cnpj").val(cnp);
    			 $("#dataInicio").val(datIni);
    			 $("#dataFim").val(datFim);
    			 $('#gravar').attr('disabled', 'disabled'); 
    			 $('#atualizar').removeAttr('disabled');
    		}

     }
  
  function limparcampos(){
		with (document.forms[0]) {
			 $("#id").val("");
			 $("#nome").val("");
			 $("#cnpj").val("");
			 $("#dataInicio").val("");
			 $("#dataFim").val("");
			 $('#gravar').removeAttr('disabled');
			 $('#atualizar').attr('disabled', 'disabled');
		}

}
  
</script>
<body>

<div class="container">
		<form:form action="${s:mvcUrl('OC#gravar').build()}" method="POST" commandName="obra" enctype="multipart/form-data">	
			<div class="form-group">
			
				<label>Nome</label>
							 
				<form:input rows="1" path="nome" cssClass="form-control" size="50%" id="nome"/>
				<form:hidden  path="id" id="id"/>
				<font color="red"><form:errors path="nome" /></font>
		   </div>
		   <div class="form-group">
					<label>CNPJ</label>
					<form:input path="cnpj"  cssClass="form-control" size="50%"/>
					<font color="red"><form:errors path="cnpj" title="cnpj" /></font>
		    </div>
	    
	    	<div class="form-group row">
			 <div class="col-xs-2" >
					<label for="dataInicio">Data Início</label>
					<form:input  path="dataInicio"  cssClass="datepicker"/>
			</div>
	        <div class="col-xs-2">
					<label for="dataFim">Data Fím</label>
					<form:input   path="dataFim"  cssClass="datepicker"/>
				
			</div>
			</div>
			
		<div>
		<label class="checkbox-inline"><input type="checkbox" value="">Documento 1</label>
		<label class="checkbox-inline"><input type="checkbox" value="">Documento 2</label>
		<label class="checkbox-inline"><input type="checkbox" value="">Documento 3</label>	
		</div>
  		<br/>
		<security:authorize access="isAuthenticated()">			
		<button type="submit" class="btn btn-primary" id="gravar" >Gravar</button>
		</security:authorize>
		
		<button type="submit" class="btn btn-success" id="atualizar">Atualizar</button>
		 <a href="javascript:limparcampos();" class="btn btn-warning">Limpar</a>
        
		
	</form:form>			
</div>



<div class="container">
         
  <table class="table table-hover table-bordered ">
    <thead>
      <tr>
        <th>Nome</th>
        <th>CNPJ</th>
        <th>Data Início</th>
        <th>Data Fím</th>
        <th>Ação</th>  
        
      </tr>
    </thead>
    <tbody>
    
     <c:forEach items="${obras}" var="obra">
            
      <tr>
       
        <td>${obra.nome} </td>
        <td>${obra.cnpj} </td>
        <td><fmt:formatDate value="${obra.dataInicio.time}" pattern="dd/MM/yyyy"/></td>
        <td><fmt:formatDate value="${obra.dataFim.time}" pattern="dd/MM/yyyy"/></td>
         
           
        <td> <a href="${s:mvcUrl('OC#excluir').arg(0,obra.id).build() }"><span class="glyphicon glyphicon-remove"  aria-hidden="true"></span></a>
        <a href="javascript:popularcampos(${obra.id},'${obra.nome}','${obra.cnpj}','<fmt:formatDate  value="${obra.dataInicio.time}" pattern="dd/MM/yyyy"/>','<fmt:formatDate value="${obra.dataFim.time}"  pattern="dd/MM/yyyy"/>');"><span class="glyphicon glyphicon-pencil"  aria-hidden="true"> </a>
        </td>
       
        
      </tr>
     </c:forEach> 
          
    </tbody>
  </table>
</div>

<div class="container" align="center">
	<ul class="pagination pagination-lg">
	  	<li class="page-item">
	      <a class="page-link" href="#" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	        <span class="sr-only">Previous</span>
	      </a>
	    </li>
	    
	    <c:forEach items="${listaPaginacao}" var="item">
		   <li>
		     <a href="${s:mvcUrl('OC#listar').arg(1,item).build() }">${item}</a>
		   </li>
	    </c:forEach>
	  
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	        <span class="sr-only">Next</span>
	      </a>
	    </li>
   </ul>
</div>

</tags:pageTemplate>


</body>
</html>

