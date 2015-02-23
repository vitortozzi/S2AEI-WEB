<%-- 
    Document   : finalizaProjeto
    Created on : 04/02/2015, 17:21:36
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
        <%@include file="header.jsp" %>
        <div class="container">
            <%
                Projeto p = (Projeto) request.getAttribute("projeto");
                if ((p.getId() != 0)) {%>
            <table class="table table-striped">
                <form action="finalizaProjeto" method="post" id="myForm">
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
                                        <span class="glyphicon glyphicon-pencil"></span> Finalizar
                                    </button>
                                </div>
                            </td>
                        </tr>                     

                    </tbody>
                </form>
            </table>
            <%} else {%>
            <h1>Não há projetos para serem finalizados por você.</h1>
            <%}%>
        </div>
    </body>
</html>
