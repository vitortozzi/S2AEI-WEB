<%-- 
    Document   : listaAlunoDeleta
    Created on : 26/01/2015, 21:39:08
    Author     : Vítor
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Model.Aluno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <script src="resources/bootstrap/js/jquery-1.10.2.min.js"></script>
        <script src="resources/bootstrap/js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script> function submitter(btn) {
                var param = btn.parentElement.parentElement.parentElement.id;
//                alert("Oi");
//                alert("Valor: " + param);
                var myForm = document.forms["myForm"];
                myForm.elements["param"].value = param;
                //myForm.submit();
            }
            </script>
        <title>S2AEI</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container">
            <table class="table table-striped">
                <form action="deletaAluno" method="post" id="myForm">
                    <input type="hidden" name="param" />
                    <thead>
                        <tr>
                            <th>Nome</th>
                            <th>Email</th>
                            <th>Curso</th>
                            <th>Periodo</th>
                            <th>Matricula</th>
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
                            <td>
                                <div class="btn-group">
                                    <button type="submit"
                                            name="deletar"
                                            onclick="submitter(this)"
                                            class="btn btn-default btn-xs">
                                        <span class="glyphicon glyphicon-trash"></span> Remover
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
