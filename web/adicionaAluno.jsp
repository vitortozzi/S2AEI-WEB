<%-- 
    Document   : addAluno
    Created on : 25/01/2015, 00:04:59
    Author     : Vítor
--%>

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
        <div class="container">
            <form role="form" action="addAluno" method="post">
                <div class="form group">
                    <div class="row">
                        <div class="col-lg-3">
                            <label for="exampleInputNome">Nome</label> <input type="text"
                            class="form-control" name="inputNome"
                            placeholder="Escreva o nome do aluno">
                        </div>
                        <div class="col-lg-4">
                            <label for="exampleInputCurso">Curso</label> <input type="text"
                            class="form-control" name="inputCurso"
                            placeholder="Escreva o nome do curso">
                        </div>
                        <div class="col-lg-2">
                            <label for="exampleInputMatricula">Matrícula</label> <input
                                type="text" class="form-control" name="inputMatricula"
                                placeholder="Nº do matrícula">
                        </div>
                        <div class="col-lg-1">
                            <label for="exampleInputPeriodo">Período</label> <input
                                type="text" class="form-control" name="inputPeriodo"
                                placeholder="Nº">
                        </div>
                    </div>
                    <br/>
                    <div class="row">
                        <div class="col-lg-4">
                            <label for="exampleInputEmail">Email</label> <input type="text"
                            class="form-control" name="inputEmail"
                            placeholder="email@provedor.com">
                        </div>
                        <div class="col-lg-2">
                            <label for="exampleInputSenha">Senha</label> <input type="password"
                            class="form-control" name="inputSenha"
                            placeholder="Informe uma senha">
                        </div>
                    </div>
                    <br/>
                    <div class="row">
                        <div class="col-lg-4">
                            <button type="submit" class="btn btn-default">Cadastrar</button>
                            <button type="reset" class="btn btn-warning">Limpar</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
