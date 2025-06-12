<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="modelos.*"%>
<%@page import="dto.*"%>
<%@page import="controles.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html> 
<html lang="pt-BR">
<head>   
    <meta charset="UTF-8" />
    <title>Configurar Conta</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/WattWorks/estilos/estilos.css">
</head>
<body class="bg-light">
	<% 
        int entidadeId = (Integer) session.getAttribute("entidadeId"); 
        UnidadeController uniController = new UnidadeController();
        EntidadeController entController = new EntidadeController();         
        
        List<Unidade> unidades = uniController.getByEntidadeId(entidadeId);
        EntidadeDTO entDTO = entController.getEntDtoById(entidadeId);
    %>
	<a href="/WattWorks/index.html" class="btn btn-danger position-absolute ms-4 mt-4">
	    <i class="bi bi-arrow-left"></i> Voltar
	</a>	    
	<div class="container my-5">	    
	    <h1 class="mb-4">Configuração da Conta</h1>
	    
	    <div class="card shadow-sm">
	        <div class="card-header bg-primary text-white">
	            <h4 class="mb-0">Empresa</h4>
	        </div>
	        <div class="card-body"> 
	            <p><strong>Nome: </strong> <%= entDTO.getNome() %></p>
	            <p><strong>CNPJ: </strong> <%= entDTO.getCnpj() %></p>
	            <p><strong>Fone: </strong> <%= entDTO.getFone() %></p>
	           	<p><strong>Email: </strong> <%= entDTO.getEmail() %></p>
	           	<p><strong>Data de Cadastro: </strong> <%= entDTO.getDataCadastro() %></p>
	           	<a class="btn btn-primary" href="/WattWorks/restrito/editarEmpresa.jsp">editar</a>
	        </div>
	    </div>
	
	    <div class="card shadow-sm mt-4">
	        <div class="card-header bg-secondary text-white">
	            <h4 class="mb-0">Unidades</h4>
	        </div>
	        <div class="card-body">
	            <ul class="list-group">
	            
	            <% for(Unidade uni : unidades) {%>
	            	<li class="list-group-item d-flex justify-content-between align-items-center">
	                    <span><strong><%= uni.getDescricao() %></strong></span>
	                    <span class="text-muted"><%= uni.getCnpj() %></span>
	                    <a class="btn btn-primary" href="/WattWorks/restrito/editarUnidade.jsp?id=<%= uni.getId() %>">editar</a>
	                </li>            
	            <%}%>   
	            </ul>
	        </div>
	    </div>
	</div>

</body>
</html>