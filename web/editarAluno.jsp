<%-- 
    Document   : editarAluno
    Created on : 25/01/2015, 18:20:20
    Author     : Vítor
--%>

<%@page import="Model.Aluno"%>
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
        <%@include file="header.jsp"%>
        <% Aluno a = (Aluno) request.getAttribute("aluno");%>
        <div class="container">
            <form role="form" action="editAluno" method="post">
                <div class="form group">
                    <div class="row">
                        <div class="col-lg-3">
                            <label for="exampleInputNome">Nome</label> <input type="text"
                                                                              class="form-control" name="inputNome"
                                                                              value="<%=a.getNome()%>">
                        </div>
                        <div class="col-lg-4">
                            <label for="exampleInputCurso">Curso</label> <input type="text"
                                                                                class="form-control" name="inputCurso"
                                                                                value="<%=a.getCurso()%>">
                        </div>
                        <div class="col-lg-2">
                            <label for="exampleInputMatricula">Matrícula</label> <input
                                type="text" class="form-control" name="inputMatricula"
                                value="<%=a.getMatricula()%>" readonly="true">
                        </div>
                        <div class="col-lg-1">
                            <label for="exampleInputPeriodo">Período</label> <input
                                type="text" class="form-control" name="inputPeriodo"
                                value = "<%=a.getPeriodo()%>">
                        </div>
                    </div>
                    <br/>
                    <div class="row">
                        <div class="col-lg-4">
                            <label for="exampleInputEmail">Email</label> <input type="text"
                                                                                class="form-control" name="inputEmail"
                                                                                value="<%=a.getEmail()%>" readonly="true">
                        </div>
                        <div class="col-lg-2">
                            <label for="exampleInputSenha">Senha</label> <input type="password"
                                                                                class="form-control" name="inputSenha"
                                                                                value="<%=a.getSenha()%>">
                        </div>
                        <div class="col-lg-2">
                            <label for="exampleInputSenha">Status</label> <input type="text"
                                                                                class="form-control" name="inputStatus"
                                                                                value="<%=a.getStatus()%>">
                        </div>
                    </div>
                </div>
                <br/>
                <div class="row">
                    <div class="col-lg-4">
                        <button type="submit" class="btn btn-default">Cadastrar</button>
                        <button type="reset" class="btn btn-warning">Restaurar</button>
                    </div>
                </div>
        </div>
    </form>
</div>
</body>
</html>
