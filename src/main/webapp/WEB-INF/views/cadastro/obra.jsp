
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
 
 
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
 
<tags:pageTemplate
	titulo="Livros de Java, Android, iOS, Mobile e muito mais...">

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
  function popularcampos(id,nom,cnp,datIni,datFim){
    		with (document.forms[0]) {
    			 $("#nome").val(nom);
    			 $("#cnpj").val(cnp);
    			 $("#dataInicio").val(datIni);
    			 $("#dataFim").val(datFim);
    		}

     }
  
</script>
<body>

<div class="container">
		<form:form action="${s:mvcUrl('OC#gravar').build()}" method="POST" commandName="obra" enctype="multipart/form-data">	
			<div class="form-group">
				<label>Nome</label>
				<form:input rows="1" path="nome" cssClass="form-control" size="50%" id="nome"/>
		   </div>
		   <div class="form-group">
					<label>CNPJ</label>
					<form:input path="cnpj"  cssClass="form-control" size="50%"/>
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
					
		<button type="submit" class="btn btn-primary" >Gravar</button>
		<button type="button" class="btn btn-success">Atualizar</button>
		<button type="button" class="btn btn-danger"> Excluir</button>	
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
      </tr>
    </thead>
    <tbody>
    
     <c:forEach items="${obras}" var="obra">
            
      <tr>
       
        <td><a href="javascript:popularcampos(${obra.id},'${obra.nome}','${obra.cnpj}','<fmt:formatDate  value="${obra.dataInicio.time}" pattern="dd/MM/yyyy"/>','<fmt:formatDate value="${obra.dataFim.time}"  pattern="dd/MM/yyyy"/>');"> ${obra.nome}</a> </td>
        <td><a href="javascript:popularcampos(${obra.id},'${obra.nome}','${obra.cnpj}','<fmt:formatDate value="${obra.dataInicio.time}" pattern="dd/MM/yyyy"/>','<fmt:formatDate value="${obra.dataFim.time}"   pattern="dd/MM/yyyy"/>');">${obra.cnpj}</a> </td>
        <td><a href="javascript:popularcampos(${obra.id},'${obra.nome}','${obra.cnpj}','<fmt:formatDate  value="${obra.dataInicio.time}" pattern="dd/MM/yyyy"/>','<fmt:formatDate value="${obra.dataFim.time}"  pattern="dd/MM/yyyy"/>');"><fmt:formatDate value="${obra.dataInicio.time}" pattern="dd/MM/yyyy"/></a> </td>
        <td><a href="javascript:popularcampos(${obra.id},'${obra.nome}','${obra.cnpj}','<fmt:formatDate  value="${obra.dataInicio.time}" pattern="dd/MM/yyyy"/>','<fmt:formatDate value="${obra.dataFim.time}"  pattern="dd/MM/yyyy"/>');"><fmt:formatDate value="${obra.dataFim.time}" pattern="dd/MM/yyyy"/></a></td>
               
        
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
		     <a href="${s:mvcUrl('OC#listar').arg(0,item).build() }">${item}</a>
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

