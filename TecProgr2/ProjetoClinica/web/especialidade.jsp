<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="config.Conn"%>

<%
    Statement st = null;
    ResultSet rs = null;
%>

<%
    int idEspecialidade = 0;
    String nomeEspecialidade = "";
    boolean statusEspecialidade = true;
    String tipo = "salvar";
    String tipoText = "Salvar";
    if (request.getParameter("salvar") != null) {
        String especialidade = request.getParameter("nome");
        try {
            if (especialidade == null || especialidade.isEmpty()) {
                throw new Exception("Faltando o nome da especialidade");
            }
            st = new Conn().conectar().createStatement();
            st.executeUpdate("insert into especialidade(text,status) values ('" + especialidade + "',1)");
            out.println("<meta http-equiv='refresh' content='0;URL=especialidade.jsp'>");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Especialidade cadastrada com sucesso');");
            out.println("</script>");
        } catch (Exception e) {
            out.println("<span>" + e.getMessage() + "</span>");
        }
    }
    if (request.getParameter("alterar") != null) {
        String nome = request.getParameter("nome");
        String status = request.getParameter("status");
        String id = request.getParameter("id");

        try {
            st = new Conn().conectar().createStatement();
            String query = "update especialidade set "
                    + "text = '" + nome
                    + "',status = " + status
                    + " where id = " + id;
            st.executeUpdate(query);
            out.println("<meta http-equiv='refresh' content='0;URL=especialidade.jsp'>");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Especialidade alterada com sucesso');");
            out.println("</script>");
        } catch (Exception e) {
            out.println(e);
        }
    }
    if (request.getParameter("funcao") != null && request.getParameter("funcao").equals("editar")) {
        tipoText = "Alterar";
        tipo = "alterar";
        String id = request.getParameter("id");
        System.out.println("editar id: " + id);
        try {
            st = new Conn().conectar().createStatement();
            rs = st.executeQuery("select * from especialidade where id = " + id);
            while (rs.next()) {
                idEspecialidade = rs.getInt("id");
                nomeEspecialidade = rs.getString("text");
                statusEspecialidade = rs.getBoolean("status");
            }
        } catch (Exception e) {
            out.println(e);
        }
    }
    if (request.getParameter("funcao") != null && request.getParameter("funcao").equals("excluir")) {
        String id = request.getParameter("id");
        try {

            st = new Conn().conectar().createStatement();
            st.executeUpdate("update especialidade set status = 0 where id=" + id);
            out.println("<meta http-equiv='refresh' content='0;URL=especialidade.jsp'>");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Especialidade inativada com sucesso');");
            out.println("</script>");
        } catch (Exception e) {
            out.println(e);
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="estilos.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de especialidadea</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    </head>
    <%out.print("<script>$(document).ready(function() { $('#idEspecialidade').val(" + idEspecialidade + "); });</script>");%>
    <body>
        <h1>Especialidade</h1>
        <form action="" method="post" id="cadastroEspecialidade">
            <div class="input-group mb-3 w-75">
                <span class="input-group-text" id="nomeEspecialidade">Nome da Especialidade</span>
                <input type="text" class="form-control" placeholder="Nome" aria-label="Nome da Especialidade" aria-describedby="nomeEspecialidade" name="nome" value="<%= nomeEspecialidade%>">
            </div>
            <label for="statusEspecialidade">Status</label>
            <br>
            <select class="form-select w-25" id="statusEspecialidade" name="status" >
                <option value ="1" <%=statusEspecialidade ? "selected" : ""%>>Ativo</option>
                <option value ="0" <%=statusEspecialidade ? "" : "selected"%>>Inativo</option>
            </select>
            <br>
            <input class="btn btn-primary" type="submit" name="<%= tipo%>" value="<%= tipoText%>">
            <button type="button" class="btn btn-outline-primary" onclick="window.location.href = 'index.jsp'">Voltar</button>
            <br>  
        </form>
        <br>
        <%
            try {
                st = new Conn().conectar().createStatement();
                rs = st.executeQuery("select * from especialidade");

                out.println("<table class='table'><tr>");
                out.println("<td class=\"p-2 border\"><b>Nome da especialidade</b></td>");
                out.println("<td class=\"p-2 border\"><b>Status</b></td>");
                out.println("<td class=\"p-2\"></td></tr>");
                while (rs.next()) {
                    out.println("<td class=\"p-2 border\">" + rs.getString("text") + "</td>");
                    out.println("<td class=\"p-2 border\">" + (rs.getBoolean("status") ? "Ativo" : "Inativo") + "</td>");
                    out.println("<td class=\"p-2 border\"><a href='especialidade.jsp?funcao=editar&id=" + rs.getString(1) + "' class='text-info'>Editar | <i class='fa fa-edit'></i></a</td></tr>");
                }
                out.println("</table>");
            } catch (Exception e) {
                out.println(e);
            }

        %>
    </body>
</html>
