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
        <title>Portal</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    </head>
    <body>
        <%
            //Variaveis para passar como parametro
            String mensagem = "Não foi possível realizar o login, por gentileza verifique os dados inseridos.";
            String pagina = "/index.html";
            
            //Verificando Sessão
            boolean verificaSessao = false;
                if(request.getSession(verificaSessao) == null){
                
                //Redirecionamento via forward
                RequestDispatcher rd = request.getRequestDispatcher("/erro.jsp");
                request.setAttribute("msg", mensagem);
                request.setAttribute("page", pagina);
                rd.forward(request, response);
            }           
        %>
        <div>
          <jsp:useBean id="login" class="beans.Login" scope="session"/>
            <h1>Bem vindo <jsp:getProperty name="login" property="login"/>, você está logado :)</h1>
        </div>
        
        <div>
            <a class="btn btn-primary" href="inserir.jsp" role="button">Inserir</a>
            <a class="btn btn-primary" href="index.html" role="button">Sair</a>
        </div>
        
    </body>
</html>
