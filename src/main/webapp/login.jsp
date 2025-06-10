<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="modelos.*"%>
<%@page import="controles.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - EneFree</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/WattWorks/estilos/estilos.css">
</head>
<body class="bg-light bg-cadastros">
	
	<a href="/WattWorks/index.html" class="btn btn-danger position-absolute ms-4 mt-4">
	    <i class="bi bi-arrow-left"></i> Voltar
	</a>	
	<div class="container d-flex justify-content-center align-items-center vh-100">  
	    <div class="card p-4 shadow rounded-4" style="min-width: 350px; max-width: 400px;">
	        <h4 class="text-center mb-4">Acessar Conta</h4>
	        <form action="login" method="post">
	            <div class="mb-3">
	                <label for="email" class="form-label">Email:</label>
	                <input type="email" class="form-control" id="email" name="email" placeholder="Digite o email cadastrado" required>
	            </div>
	            <div class="mb-3">
	                <label for="senha" class="form-label">Senha:</label>
	                <input type="password" class="form-control" id="senha" name="senha" placeholder="Digite sua senha" required>
	            </div>
	            <button type="submit" class="btn btn-primary w-100">Entrar</button>
	        </form>
	        <div class="text-center mt-3">
	            <small><a href="#">Esqueceu a senha?</a></small><br>
	            <small>Não possui um cadastro? <a href="registro.html">Registre-se</a>.</small>
	        </div>
	    </div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
