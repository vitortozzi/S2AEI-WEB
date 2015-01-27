<%-- 
    Document   : listaAlunos
    Created on : 25/01/2015, 22:54:37
    Author     : Vítor
--%>

<%@page import="Model.Aluno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.*" %>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <script src="resources/bootstrap/js/jquery-1.10.2.min.js"></script>
        <script src="resources/bootstrap/js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>S2AEI</title>
        <script>
            function submitter(btn) {
                var param = btn.parentElement.parentElement.parentElement.id;
                var myForm = document.forms["myForm"];
                myForm.elements["param"].value = param;
                //myForm.submit();
            }
        </script>
    </head>
    <body>
        <%@include file="header.jsp"%>       
        <div class="container">
            <table class="table table-striped">
                <form action="listaAlunosEdita" method="post" id="myForm">
                    <input type="hidden" name="param" />
                    <thead>
                        <tr>
                            <th>Nome</th>
                            <th>Email</th>
                            <th>Curso</th>
                            <th>Periodo</th>
                            <th>Matricula</th>                            
                            <th>Status</th>
                            <th>Ação</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            ArrayList<Aluno> lista = (ArrayList<Aluno>) request.getAttribute("alunos");
                            for (Aluno a : lista) {%>
                        <tr id="<%=a.getEmail()%>">
                            <td id="<%=a.getEmail()%>"><%=a.getNome()%></td>
                            <td><%=a.getEmail()%></td>
                            <td><%=a.getCurso()%></td>
                            <td><%=a.getPeriodo()%></td>
                            <td><%= a.getMatricula()%></td>                            
                            <td><%=a.getStatus()%></td>
                            <td>
                                <div class="btn-group">
                                    <button	type="submit" 
                                            name="editar"
                                            onclick="submitter(this)"
                                            class="btn btn-default btn-xs">
                                        <span class="glyphicon glyphicon-pencil"></span> Editar
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
