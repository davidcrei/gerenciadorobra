<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<tags:pageTemplate titulo="Cadastro de Funcionarios">
<html>
<head>
    <spring:url value="/resources/css" var="css"></spring:url>
    <spring:url value="/resources/js" var="js"></spring:url>
    <spring:url value="/resources/tabela" var="tabela"></spring:url>
    <spring:url value="/resources/tabela/DataTables/css" var="tabelacss"></spring:url>
    <spring:url value="/resources/tabela/DataTables/js" var="tabelajs"></spring:url>
    <spring:url value="/resources/tabela/Select/css" var="selectcss"></spring:url>
    <spring:url value="/resources/tabela/Select/js" var="selectjs"></spring:url>
  
  <link href="${css}/bootstrap.min.css" rel="stylesheet" type="text/css">
  
  <!--Tabela plugin css-->
   <link rel="stylesheet" href="${tabelacss}/jquery.dataTables.min.css">
   <link rel="stylesheet" href="${selectcss}/select.dataTables.min.css">
   
   <!--Tabela plugin js-->
   <script src="${js}/jquery.js"></script>
   <script src="${tabelajs}/jquery.dataTables.min.js"></script>
   <script src="${selectjs}/dataTables.select.min.js"></script> 
		
	<script>     
     
     $(document).ready(function() {
    	    $('#example').DataTable( {
    	        columnDefs: [ {
    	            orderable: false,
    	            className: 'select-checkbox',
    	            targets:   0
    	        } ],
    	        select: {
    	            style:    'os',
    	            selector: 'td:first-child'
    	        },
    	        order: [[ 1, 'asc' ]]
    	    } );
    	} );
        
     </script>
     
     
      <!--datapiker-->
      <script src="${js}/bootstrap-datepicker.js"></script>
     <link rel="stylesheet" href="${css}/datepicker.css">
     	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
     	
     
<title>Insert title here</title>
</head>
<body>
<div class="container">
		<form:form action="${s:mvcUrl('FC#gravar').build()}" method="POST" commandName="funcionario" enctype="multipart/form-data">	
							
							 
			 <div class="form-group">
		 		 <label>Obra origem</label>
		 		 <select class="form-control">
		 		 <option value="0">Sem obra</option>
		 		   <c:forEach items="${obras}" var="obra">
		 		 		<option value=${obra.id}>${obra.nome}</option>
	  				</c:forEach>
				 </select>
			</div>	
		
		   <div class="form-group row">
				 <div class="col-xs-2" >
						<label for="dataInicio">Data Início</label>
						<form:input  path="dataInicio"  cssClass="datepicker"/>
				</div>
	        
			</div>
<br>


<table id="example" class="display" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th></th>
                <th>Nome</th>
                <th>CPF</th>
                <th>Data Início</th>
                
            </tr>
        </thead>
        <%-- <tfoot>
            <tr>
                <th></th>
                <th>Name</th>
                <th>Position</th>
                <th>Office</th>
                <th>Age</th>
                <th>Salary</th>
            </tr>
        </tfoot>--%>
        <tbody>
        
         <c:forEach items="${funcionarios}" var="funcionario">
            <tr>
                <td></td>
                
                <td>${funcionario.nome}</td>
                <td>${funcionario.cpf}</td>
                <td>01/10/2010</td>
                
            </tr>
            </c:forEach>
                      
        </tbody>
    </table>
    <br>

 			<div class="form-group">
		 		 <label>Obra Destino</label>
		 		 <select class="form-control">
	  				<option>Via 1</option>
	  				<option>G2O</option>
	  				<option>Via 2</option>
	  				<option>Odebreche</option>
				 </select>
			</div>	
<br>

		<security:authorize access="isAuthenticated()">			
		<button type="submit" class="btn btn-primary" id="gravar" >Transferir</button>
		</security:authorize>
		<a href="javascript:limparcampos();" class="btn btn-warning">Limpar</a>
        
		
	</form:form>			
</div>

</tags:pageTemplate>
</body>
</html>
