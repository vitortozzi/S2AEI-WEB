<%-- 
    Document   : criarProjeto
    Created on : 28/01/2015, 20:04:16
    Author     : Vítor
--%>

<%@page import="Model.Tabelas.Aluno"%>
<%@page import="Model.Tabelas.Professor"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css">
        <script src="resources/bootstrap/js/jquery-1.10.2.min.js"></script>
        <script src="resources/bootstrap/js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>S2AEI</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container">
            <div class="panel panel-default">
                <div class="panel-heading">Novo Projeto</div>
                <div class="panel-body">
                    <form role="form" method="post" action="criaProjeto" accept-charset="UTF-8">
                        <div class="form group">
                            <div class="row">
                                <div class="col-lg-6">
                                    <label for="InputTitulo">Título</label> <input type="text"
                                                                                 class="form-control" name="inputTitulo"
                                                                                 placeholder="Escreva o título do projeto">
                                    <br>
                                    <label for="InputNome">Área de Conhecimento</label> <input type="text"
                                                                                               class="form-control" name="inputArea"
                                                                                               placeholder="Informa a área de conhecimento do projeto">
                                </div>
                                <div class="col-lg-6">
                                    <label for="exampleInputEndereco">Descrição</label> 
                                    <textarea class="form-control" rows="5" id="comment" name = "inputDesc"></textarea>
                                </div>
                            </div>
                            <br/>
                            <div class="row">
                                
                                <div class="col-lg-2">
                                    <label for="sel1">Professor Orientador:</label>
                                    <select name="inputOrientador" class="form-control" id="selProf">
                                        <%ArrayList<Professor> professores = (ArrayList<Professor>) request.getAttribute("professores");
                                            for (Professor p : professores) {
                                        %>
                                        <option><%=p.getNome()%></option>
                                        <%}%>
                                    </select>
                                </div>
                            </div>
                            <br>
                            <label>Alunos Participantes</label>
                            <div class="row">
                                <div class="col-lg-2">
                                    <%
                                        ArrayList<Aluno> lista = (ArrayList<Aluno>) request.getAttribute("alunosAtivos");
                                        for (Aluno a : lista) {%>
                                    <div class="checkbox">
                                    <label><input type="checkbox" name="participantes" value="<%=a.getNome()%>"><%=a.getNome()%></label>
                                    </div>
                                    <%}%>
                                </div>
                            </div>
                            <br/>
                            <div class="row">
                                <div class="col-lg-4">
                                    <button type="submit" class="btn btn-default">Criar</button>
                                    <button type="reset" class="btn btn-warning">Limpar</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
