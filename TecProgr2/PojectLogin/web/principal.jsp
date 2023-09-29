<%@ include file="referencias.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="estilos.jsp" %>
        <title>JSP Principal</title>

    </head>
    <body>
        <%@ include file="testaSessao.jsp" %>
        <%@ include file="menu.jsp" %>
        <br>
        <h1>Olá! Login efetuado com Sucesso!</h1>
        Bem-vindo <%=usu %>
        <br><a href="sair.jsp">Sair</a>
        
        </body>
</html>
