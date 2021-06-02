<%-- 
    Document   : portal
    Created on : 01/06/2021, 22:52:34
    Author     : Gustavo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            //Verificando Sessão
            boolean verificaSessao = false;
            if(request.getSession(verificaSessao) == null){
                //Redirecionamento via forward
            }
            
            
        %>
        <h1>Hello World!</h1>
    </body>
</html>
