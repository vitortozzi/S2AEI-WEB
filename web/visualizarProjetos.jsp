<%-- 
    Document   : visualizarProjeto
    Created on : 30/01/2015, 23:21:39
    Author     : Vítor
--%>

<%@page import="Model.Tabelas.Projeto"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <script src="resources/bootstrap/js/jquery-1.10.2.min.js"></script>
        <script src="resources/bootstrap/js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script>
            function submitter(btn) {
                var param = btn.parentElement.parentElement.parentElement.id;
                var myForm = document.forms["myForm"];
                myForm.elements["param"].value = param;
                //myForm.submit();
            }
        </script>
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <div class="container">
            <table class="table table-striped">
                <form action="visualizaProjeto" method="post" id="myForm">
                    <input type="hidden" name="param" />
                    <thead>
                        <tr>
                            <th style="display:none;" >ID</th>
                            <th>Título</th>
                            <th>Líder</th>
                            <th>Orientador</th>
                            <th>Data Criação</th>
                            <th>Ultima Alteração</th>                            
                            <th>Status</th>
                            <th>Ação</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            ArrayList<Projeto> lista = (ArrayList<Projeto>) request.getAttribute("projetos");
                            for (Projeto p : lista) {%>
                        <tr id="<%=p.getId()%>">
                            <td id="<%=p.getId()%>" style="display:none;"><%=p.getId()%></td>
                            <td><%=p.getTitulo()%></td>
                            <td><%=p.getLider()%></td>
                            <td><%=p.getOrientador()%></td>
                            <td><%=p.getDataCriacao()%></td>
                            <td><%=p.getUltimaModificacao()%></td>
                            <td><%=p.getStatus()%></td>                            
                            <td>
                                <div class="btn-group">
                                    <button	type="submit" 
                                            name="editar"
                                            onclick="submitter(this)"
                                            class="btn btn-default btn-xs">
                                        <span class="glyphicon glyphicon-pencil"></span> Visualizar
                                    </button>
                                </div>
                            </td>                           
                        </tr>
                        <%}%>
                    </tbody>
                </form>
            </table>
        </div>
    </body>
</html>
