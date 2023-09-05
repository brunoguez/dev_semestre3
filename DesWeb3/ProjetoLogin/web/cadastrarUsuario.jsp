<%-- 
    Document   : cadUsuario
    Created on : 2 de set. de 2023, 14:05:20
    Author     : Bruno
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="config.Conexao"%>

<%
    Statement st = null;
%>

<%
    if (request.getParameter("btnSalvar") != null) {
        String nome = request.getParameter("txtNome");
        String usuario = request.getParameter("txtUsuario");
        String senha = request.getParameter("txtSenha");
        String nivel = request.getParameter("cmbNivel");

        try {
            st = new Conexao().conectar().createStatement();
            st.executeUpdate("insert into usuarios(nome,usuario,senha,nivel) values ('"
                    + nome + "','" + usuario + "','" + senha + "','" + nivel + "')");
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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Cadastro de usuários</h1>
        <form action="" method="post" id="cadastro">
            <label>Nome do Usuário</label><br>
            <input type="text" name="txtNome"><br>
            <label>Usuário</label><br>
            <input type="text" name="txtUsuario"><br>
            <label>Senha</label><br>
            <input type="text" name="txtSenha"><br>
            <label for="cmbNivel">Nível:</label><br>
            <select id="cmbNivel" name="cmbNivel">
                <option>Escolha uma opção</option> 
                <option value="administrador">Administrador</option>              
                <option value="usuario">Usuário</option>
                <option value="visitante">Visitante</option>
            </select>
            <br><br>
            <input type="submit" name="btnSalvar">
        </form>
    </body>
</html>
