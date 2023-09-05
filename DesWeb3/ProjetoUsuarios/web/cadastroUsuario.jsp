<%-- 
    Document   : cadastroUsuario
    Created on : 19 de ago. de 2023, 14:49:46
    Author     : Bruno
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="config.Conn"%>

<%
    Statement st = null;
%>

<%
    if (request.getParameter("btnSalvar") != null) {
        String nome = request.getParameter("txtNome");
        String tel = request.getParameter("txtTel");
        try {
            st = new Conn().conectar().createStatement();
            st.executeUpdate("insert into usuarios(nomeUsuario,telUsuario) values('" + nome + "'"
                    + ", '" + tel + "')");
            out.println("<meta http-equiv='refresh' content='0;URL=index.jsp'>");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Cadastro realizado com sucesso');");
            out.println("</script>");
        } catch (Exception e) {
            out.println(e);
        }
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de usuários</title>
    </head>
    <body>
        <h1>Cadastro de usuários</h1>
        <form action="" method="post" id="cadastro">
            <label>Nome do Usuário</label><br>
            <input type="text" name="txtNome"><br>
            <label>Telefone do Usuário</label><br>
            <input type="text" name="txtTel"><br>
            <br><br>
            <input type="submit" name="btnSalvar">
        </form>



    </body>
</html>


