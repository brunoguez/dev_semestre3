<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="config.Conn"%>

<%
    Statement st = null;
    ResultSet rs = null;
%>

<%
    int idPaciente = 0;
    String nomePaciente = "";
    String telefonePaciente = "";
    String celularPaciente = "";
    boolean statusPaciente = true;
    String tipo = "salvar";
    String tipoText = "Salvar";
    if (request.getParameter("salvar") != null) {
        String nome = request.getParameter("nome");
        String telefone= request.getParameter("telefone");
        String celular= request.getParameter("celular");
        try {
            if (nome == null || nome.isEmpty()) {
                throw new Exception("Faltando o nome do Paciente");
            }
            st = new Conn().conectar().createStatement();
            st.executeUpdate("insert into paciente(nome,telefone,celular,status) values ("
                    + "'" + nome + "',"
                    + "'" + telefone + "',"
                    + "'" + celular + "',"
                    + "1)");
            out.println("<meta http-equiv='refresh' content='0;URL=paciente.jsp'>");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Paciente cadastrado com sucesso');");
            out.println("</script>");
        } catch (Exception e) {
            out.println("<span>" + e.getMessage() + "</span>");
        }
    }
    if (request.getParameter("alterar") != null) {
        String nome = request.getParameter("nome");
        String telefone = request.getParameter("telefone");
        String celular = request.getParameter("celular");
        String status = request.getParameter("status");
        String id = request.getParameter("id");

        try {
            st = new Conn().conectar().createStatement();
            String query = "update paciente set "
                    + "nome = '" + nome
                    + "', telefone = '" + telefone
                    + "', celular = '" + celular
                    + "', status = " + status
                    + " where id = " + id;
            st.executeUpdate(query);
            out.println("<meta http-equiv='refresh' content='0;URL=paciente.jsp'>");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Paciente alterado com sucesso');");
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
            rs = st.executeQuery("select * from paciente where id = " + id);
            while (rs.next()) {
                idPaciente = rs.getInt("id");
                nomePaciente = rs.getString("nome");
                telefonePaciente = rs.getString("telefone");
                celularPaciente = rs.getString("celular");
                statusPaciente = rs.getBoolean("status");
            }
        } catch (Exception e) {
            out.println(e);
        }
    }
    if (request.getParameter("funcao") != null && request.getParameter("funcao").equals("excluir")) {
        String id = request.getParameter("id");
        try {

            st = new Conn().conectar().createStatement();
            st.executeUpdate("update paciente set status = 0 where id=" + id);
            out.println("<meta http-equiv='refresh' content='0;URL=paciente.jsp'>");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Paciente inativado com sucesso');");
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
        <title>Cadastro de Paciente</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    </head>
    <%out.print("<script>$(document).ready(function() { $('#idPaciente').val(" + idPaciente + "); });</script>");%>
    <body>
        <h1>Paciente</h1>
        <form action="" method="post" id="cadastroPaciente">
            <div class="input-group mb-3 w-75">
                <span class="input-group-text" id="nomePaciente">Nome do Paciente</span>
                <input type="text" class="form-control" placeholder="Nome" aria-label="Nome do Paciente" aria-describedby="nomePaciente" name="nome" value="<%= nomePaciente%>">
            </div>
            <div class="input-group mb-3 w-75">
                <span class="input-group-text" id="telefonePaciente">Telefone do Paciente</span>
                <input type="text" class="form-control" placeholder="(XX) XXXX-XXXX" aria-label="Telefone do Paciente" aria-describedby="telefonePaciente" name="telefone" value="<%= telefonePaciente%>">
            </div>
            <div class="input-group mb-3 w-75">
                <span class="input-group-text" id="celularPaciente">Celular do Paciente</span>
                <input type="text" class="form-control" placeholder="(XX) 9XXXX-XXXX" aria-label="Celular do Paciente" aria-describedby="celularPaciente" name="celular" value="<%= celularPaciente%>">
            </div>
            <label for="statusPaciente">Status</label>
            <br>
            <select class="form-select w-25" id="statusPaciente" name="status" >
                <option value ="1" <%=statusPaciente ? "selected" : ""%>>Ativo</option>
                <option value ="0" <%=statusPaciente ? "" : "selected"%>>Inativo</option>
            </select>
            <br>
            <input class="btn btn-primary" type="submit" name="<%= tipo%>" value="<%= tipoText%>">
            <button type="button" class="btn btn-outline-primary" onclick="window.location.href = 'cadastro.jsp'">Voltar</button>
            <br>  
        </form>
        <br>
        <%
            try {
                st = new Conn().conectar().createStatement();
                rs = st.executeQuery("select * from paciente");

                out.println("<table><tr>");
                out.println("<td class=\"p-2 border\"><b>Nome</b></td>");
                out.println("<td class=\"p-2 border\"><b>Telefone</b></td>");
                out.println("<td class=\"p-2 border\"><b>Celular</b></td>");
                out.println("<td class=\"p-2 border\"><b>Status</b></td>");
                out.println("<td class=\"p-2\"></td></tr>");
                while (rs.next()) {
                    out.println("<td class=\"p-2 border\">" + rs.getString("nome") + "</td>");
                    out.println("<td class=\"p-2 border\">" + rs.getString("telefone") + "</td>");
                    out.println("<td class=\"p-2 border\">" + rs.getString("celular") + "</td>");
                    out.println("<td class=\"p-2 border\">" + (rs.getBoolean("status") ? "Ativo" : "Inativo") + "</td>");
                    out.println("<td class=\"p-2 border\"><a href='paciente.jsp?funcao=editar&id=" + rs.getString(1) + "' class='text-info'>Editar | <i class='fa fa-edit'></i></a</td></tr>");
                }
                out.println("</table>");
            } catch (Exception e) {
                out.println(e);
            }

        %>
    </body>
</html>
