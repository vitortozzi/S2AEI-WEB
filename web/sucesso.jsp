<%-- 
    Document   : sucesso
    Created on : 25/01/2015, 17:56:43
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
        <title>Sucesso</title>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <div class="container">
            <h1>Operação realizada com sucesso!</h1>
            <p><%=request.getAttribute("sucesso")%></p>
        </div>
    </body>
</html>
