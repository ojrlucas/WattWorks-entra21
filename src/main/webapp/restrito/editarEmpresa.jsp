<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="modelos.*"%>
<%@page import="dto.*"%>
<%@page import="controles.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"> 
    <title>Cadastro - EneFree</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/WattWorks/estilos/estilos.css">
</head>
<body class="bg-light bg-cadastros">
	<% 	    
		int id = (Integer) session.getAttribute("entidadeId"); 
		EntidadeController entController = new EntidadeController();
		EntidadeDTO entDTO = entController.getEntDtoById(id);
	 %>	 
     <a href="/WattWorks/index.html" class="btn btn-danger position-absolute mt-3 ms-3">
         <i class="bi bi-arrow-left"></i> Voltar
     </a>
    <div class="container d-flex justify-content-center align-items-center vh-100">
        <div class="card card-cadastros p-4 shadow rounded-4" style="min-width: 350px; max-width: 600px;">
            <h4 class="text-center mb-4">Editar Conta</h4>
            <form action="/WattWorks/editarEntidade" method="post">
            	<input type="hidden" name="dataCadastro" value="<%= entDTO.getDataCadastro() %>">	        	
                <div class="row g-3">
                    <div class="col-md-6">
                        <label for="nome" class="form-label">Empresa:</label>
                        <input type="text" class="form-control" id="nome" name="nome" placeholder="Informe o nome da Matriz" value="<%= entDTO.getNome() %>" required>
                    </div>
                    <div class="col-md-6">
                        <label for="email" class="form-label">E-mail:</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="Digite seu e-mail" value="<%= entDTO.getEmail() %>" required>
                    </div>
                    <div class="col-md-6">
                        <label for="fone" class="form-label">Telefone:</label>
                        <input type="tel" class="form-control" id="fone" name="fone" placeholder="(00) 00000-0000" value="<%= entDTO.getFone() %>" required>
                    </div>
                    <div class="col-md-6">
                        <label for="cnpj" class="form-label">CNPJ:</label>
                        <input type="text" class="form-control" id="cnpj" name="cnpj" placeholder="00.000.000/0000-00" value="<%= entDTO.getCnpj() %>" required>
                    </div>
                    <div class="col-md-6 d-flex align-items-end">
                        <button type="submit" class="btn btn-success w-100">Atualizar</button>
                    </div>
                </div>
            </form>
            <div class="text-center mt-3">
                <small>Já possui uma conta? <a href="login.jsp">Entrar</a>.</small>
            </div>
        </div>
    </div>

</body> 
</html>
