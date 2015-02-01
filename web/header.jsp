<%-- 
    Document   : header
    Created on : 24/01/2015, 20:21:02
    Author     : Vítor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <nav class="navbar navbar-inverse">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#">Olá, <%=session.getAttribute("nome")%>!</a>
                    </div>
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <% if (session.getAttribute("papel").equals("Administrador")) {%>
                        <ul class="nav navbar-nav">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Alunos <span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="adicionaAluno">Cadastrar Aluno</a></li>
                                    <li><a href="listaAlunosEdita">Editar Aluno</a></li>
                                    <li><a href="deletaAluno">Excluir Aluno</a></li>
                                </ul>
                            </li>
                        </ul>
                        <% } %>
                        <ul class="nav navbar-nav">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Projetos <span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                    <%if (session.getAttribute("papel").equals("Administrador")) {%>
                                    <li><a href="criaProjeto">Criar</a></li><%}%>
                                    <%if ((session.getAttribute("papel").equals("Aluno")) || (session.getAttribute("papel").equals("Professor"))) {%>
                                    <li><a href="visualizaProjeto">Visualizar</a></li><%}%>
                                    <%if (session.getAttribute("papel").equals("Aluno")) {%>
                                    <li><a href="preencheProjeto">Preencher</a></li><%}%>
                                    <%if (session.getAttribute("papel").equals("Administrador")) {%>
                                    <li><a href="#">Finalizar</a></li><%}%>
                                </ul>
                            </li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="logout">Sair</a></li>
                        </ul>
                    </div> <!--/.navbar-collapse--> 
                </div> <!--/.container-fluid--> 
            </nav>
        </div>
    </body>
</html>
