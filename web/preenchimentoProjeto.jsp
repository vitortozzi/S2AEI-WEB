<%-- 
    Document   : preenchimentoProjeto
    Created on : 30/01/2015, 21:40:58
    Author     : Vítor
--%>

<%@page import="Model.Tabelas.Projeto"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css">
        <script src="resources/bootstrap/js/jquery-1.10.2.min.js"></script>
        <script src="resources/bootstrap/js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <%
            Projeto projeto = (Projeto) request.getAttribute("dadosProjeto");
            ArrayList<String> titulos = (ArrayList<String>) request.getAttribute("listaTitulos");
            ArrayList<String> questoes = (ArrayList<String>) request.getAttribute("listaQuestoes");%>
        <div class="container">
            <div class="panel panel-default">
                <div class="panel-heading">Título: <%=projeto.getTitulo()%></div>
                <div class="panel-body">
                    <form role="form" method="post" action="preencheProjeto" accept-charset="UTF-8">
                        <div class="form group">
                            <%
                                for (int i = 0; i < titulos.size(); i++) {
                            %>
                            <div class="row">
                                <div class="col-lg-10"
                                     <label>Quadro<%=i+1%> - <%=titulos.get(i)%></label><br>
                                    <label><%=questoes.get(i)%></label>
                                    <textarea class="form-control" rows="5" id="comment" name = "resposta<%=i%>"><%
                                        if (projeto.getRespostas().get(i) != null) {
                                            out.print(projeto.getRespostas().get(i));
                                        }%></textarea>
                                    <br>
                                </div>
                            </div>
                            <%}%>
                            <div class="row">
                                <div class="col-lg-4">
                                    <button type="submit" class="btn btn-default">Salvar</button>
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
