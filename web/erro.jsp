<%-- 
    Document   : erro
    Created on : 24/01/2015, 23:22:46
    Author     : Vítor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Erro</title>
    </head>
    <body>
        <div class="container">
            <h1>:( Um erro foi encontrado e a aplicação precisou ser fechada.</h1>
            <p>Detalhes: <%=request.getAttribute("erro")%></p>
        </div>
    </body>
</html>
