<%-- 
    Document   : inserir
    Created on : 03/06/2021, 17:02:38
    Author     : Gustavo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserir</title>
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
            <h1>Tela de Cadastro</h1>
            <form action="${pageContext.request.contextPath}/CadastrarUsuarioServlet" method="Post">
                 <div class="form-group">
                   <label for="exampleInputEmail1">Name</label>
                   <input type="text" class="form-control" placeholder="Name" name="Name">
                 </div>
                 <div class="form-group">
                   <label for="exampleInputEmail1">Login</label>
                   <input type="text" class="form-control" placeholder="Login" name="Login">
                 </div>
                 <div class="form-group">
                   <label for="exampleInputPassword1">Senha</label>
                   <input type="text" class="form-control" placeholder="Senha" name="Senha">
                 </div>
                <button type="submit" class="btn btn-primary">
                    Cadastrar
                </button>
           </form>
        </div>
    </body>
</html>
