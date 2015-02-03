<%-- 
    Document   : aviso
    Created on : 31/01/2015, 23:18:03
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
        <title>Erro</title>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <div class="container">
            <h1>:( Houve um erro ao processar a requisição.</h1>
            <p>Detalhes: <%=request.getAttribute("aviso")%></p>
        </div>
    </body>
</html>
