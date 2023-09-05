<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="config.Conexao"%>

<!DOCTYPE html>

<%
    Statement st = null;
    ResultSet rs = null;
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buscar Usuário</title>
    </head>
    <body>
        <h1>Buscar Usuário</h1>
        <form action="buscarUsuario.jsp" method="post">
            <input type="text" name="txtNome"><input type="submit" name="btnSalvar">
        </form>
        <br>
        <br>
    </body>
</html>

<%
    if (request.getParameter("btnSalvar") != null) {
        String busca = "%" + request.getParameter("txtNome") + "%";
        try {
            st = new Conexao().conectar().createStatement();
            rs = st.executeQuery("Select * from usuarios where nome like'" + busca + "'");
            out.println("<table border=1><tr>");
            out.println("<td>Nome</td>");
            out.println("<td>Usuário</td></tr><tr>");
            while (rs.next()) {
                out.println("<td>" + rs.getString(2) + "</td>");
                out.println("<td>" + rs.getString(3) + "</td></tr>");
            }
            out.println("</table>");
        } catch (Exception e) {
            out.println(e);
        }
    }

%>
