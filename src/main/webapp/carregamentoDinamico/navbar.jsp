<%@ page language="java" contentType="text.html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.SQLException" %>
<%@ page import="modelos.*" %>
<%@ page import="controles.*" %>
<nav class="navbar navbar-expand-lg fixed-top">
      <div class="container">
          <div class="logo-nav">
          		<img src="/WattWorks/imagens/logo-branca-sem-fundo.png" alt="logo WattWorks Software">
          </div>
          <div class="collapse navbar-collapse" id="navbarNav">
              <ul class="navbar-nav mb-2 mb-lg-0">
                  <li class="nav-item"><a class="nav-link" aria-current="page" href="/WattWorks/index.html">Home</a></li>
                  <li class="nav-item"><a class="nav-link ms-2" href="/WattWorks/restrito/fatura.jsp">Faturas</a></li>
                  <li class="nav-item"><a class="nav-link ms-2" href="/WattWorks/restrito/projecao.jsp">Projeções Futuras</a></li>
              </ul>
                 <div onclick="exibirDiv('userMenu')" class="user-icon" id="userIcon"><i class="bi bi-person-circle"></i></div>
          </div>
      </div>
</nav>

<div class="user-menu" id="userMenu">
    <% 
        String entidadeNome = (String) session.getAttribute("entidadeNome");
        String entidadeCnpj = (String) session.getAttribute("entidadeCnpj");

        if (entidadeNome != null && entidadeCnpj != null) {
    %>
        <div class="container">
            <div class="row"> 
                <div class="col d-flex justify-content-between align-items-center h5-user">
                    <h5 class="mb-0 text-center">Informações da Conta</h5>
                    <a href="/WattWorks/restrito/configurarConta.jsp" class="ms-3 text-dark">
                        <i class="bi bi-gear-fill"></i>
                    </a>
                </div>
            </div>

            <div class="row mt-3">
                <div class="col entidade-info">
                    <p><%= entidadeNome %></p> 
                    <p class="mb-3">CNPJ <%= entidadeCnpj %></p>	                    
                </div>
            </div>	
            
            <div class="row g-2 mt-3">
                <div class="col-12 col-sm-6">
                    <a href="/WattWorks/restrito/cadastrarUnidade.jsp" class="btn btn-success btn-sm w-100">
                        <i class="bi bi-plus"></i> Unidade
                    </a>
                </div>
                <div class="col-12 col-sm-6">
                    <a href="/WattWorks/logout" class="btn btn-danger btn-sm w-100">
                        <i class="bi bi-box-arrow-right"></i> Sair
                    </a>
                </div>
            </div>
        </div>

    <% } else { %>

        <div class="container">
            <div class="row">
                <div class="col h5-user">
                    <h5 class="text-center">Usuário não logado</h5>
                </div>
            </div>

            <div class="row g-2 mt-2">
                <div class="col-12 col-sm-6">
                    <a href="/WattWorks/registro.html" class="btn btn-success btn-sm w-100">
                        <i class="bi bi-pencil-square"></i> Registro
                    </a>
                </div>
                <div class="col-12 col-sm-6">
                    <a href="/WattWorks/login.jsp" class="btn btn-success btn-sm w-100">
                        <i class="bi bi-box-arrow-in-right"></i> Login
                    </a>
                </div>
            </div>
        </div>

    <% } %>
</div>