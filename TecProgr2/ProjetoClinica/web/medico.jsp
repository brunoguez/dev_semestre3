<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="config.Conn"%>

<%
    Statement st = null;
    ResultSet rs = null;
%>

<%
    String nomeMedico = "";
    String telefoneMedico = "";
    String celularMedico = "";
    int especialidadeMedico = 0;
    String tipo = "salvar";
    String tipoText = "Salvar";
    if (request.getParameter("salvar") != null) {
        String nome = request.getParameter("nome");
        String telefone = request.getParameter("telefone");
        String celular = request.getParameter("celular");
        String especialidade = request.getParameter("especialidade");

        try {
            if (nome == null || nome.isEmpty()) {
                throw new Exception("Faltando o nome do médico");
            }
            if (especialidade == null || especialidade.isEmpty()) {
                throw new Exception("Faltando a especialidade do médico");
            }
            st = new Conn().conectar().createStatement();
            st.executeUpdate("insert into medico(nome,telefone,celular,idEspecialidade, status) values ('"
                    + nome + "','" + telefone + "','" + celular + "','" + especialidade + "',1)");
            out.println("<meta http-equiv='refresh' content='0;URL=medico.jsp'>");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Cadastro realizado com sucesso');");
            out.println("</script>");
        } catch (Exception e) {
            out.println("<span>" + e.getMessage() + "</span>");
        }
    }
    if (request.getParameter("alterar") != null) {
        String nome = request.getParameter("nome");
        String telefone = request.getParameter("telefone");
        String celular = request.getParameter("celular");
        String especialidade = request.getParameter("especialidade");
        String id = request.getParameter("id");

        try {

            if (nome == null | nome.isEmpty()) {
                throw new Exception("Faltando o nome do médico");
            }
            if (especialidade == null | especialidade.isEmpty()) {
                throw new Exception("Faltando a especialidade do médico");
            }
            st = new Conn().conectar().createStatement();
            rs = st.executeQuery("select status from especialidade where id = " + especialidade);
            boolean status = false;
            while (rs.next()) {
                status = rs.getBoolean("status");
            }
            if (!status) {
                throw new Exception("Selecione uma especialidade ativa");
            }

            String query = "update medico set "
                    + "nome = '" + nome
                    + "', telefone = '" + telefone
                    + "', celular = '" + celular
                    + "', idEspecialidade = " + especialidade
                    + " where id = " + id;
            st.executeUpdate(query);
            out.println("<meta http-equiv='refresh' content='0;URL=medico.jsp'>");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Cadastro alterado com sucesso');");
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
            rs = st.executeQuery("select m.*, e.text especialidade, e.status statusEspecialidade from medico m inner join especialidade e on e.id = m.idEspecialidade where m.status = 1 and m.id = " + id);
            while (rs.next()) {
                nomeMedico = rs.getString("nome");
                telefoneMedico = rs.getString("telefone");
                celularMedico = rs.getString("celular");
                especialidadeMedico = rs.getInt("idEspecialidade");
            }
        } catch (Exception e) {
            out.println(e);
        }
    }
    if (request.getParameter("funcao") != null && request.getParameter("funcao").equals("excluir")) {
        String id = request.getParameter("id");
        System.out.println("excluir id: " + id);
        try {

            st = new Conn().conectar().createStatement();
            st.executeUpdate("update medico set status = 0 where id=" + id);
            out.println("<meta http-equiv='refresh' content='0;URL=medico.jsp'>");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Cadastro excluído com sucesso');");
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
        <title>Cadastro de médicos</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    </head>
    <%out.print("<script>$(document).ready(function() { $('#especialidade').val(" + especialidadeMedico + "); });</script>");%>
    <body>
        <h1>Médico</h1>
        <form action="" method="post" id="cadastroMedico">
            <div class="input-group mb-3 w-50">
                <span class="input-group-text" id="nomeMedico">Médico</span>
                <input type="text" class="form-control" placeholder="Nome" aria-label="Nome do Médico" aria-describedby="nomeMedico" name="nome" value="<%= nomeMedico%>">
            </div>
            <br>
            <div class="input-group mb-3 w-50">
                <span class="input-group-text" id="telefoneMedico">Telefone</span>
                <input type="text" class="form-control" placeholder="Telefone" aria-label="Telefone do Médico" aria-describedby="telefoneMedico" name="telefone" value="<%= telefoneMedico%>">
            </div>
            <br>
            <div class="input-group mb-3 w-50">
                <span class="input-group-text" id="celularMedico">Celular</span>
                <input type="text" class="form-control" placeholder="Celular" aria-label="Celular do Médico" aria-describedby="celularMedico" name="celular" value="<%= celularMedico%>">
            </div>
            <br>
            <label for="especialidade">Especialidade</label><br>
            <select class="form-select w-50" id="especialidade" name="especialidade" >
                <option disabled selected>Escolha uma opção</option> 
                <%
                    try {

                        st = new Conn().conectar().createStatement();

                        rs = st.executeQuery("Select * from especialidade");

                        while (rs.next()) {
                            boolean status = rs.getBoolean("status");
                            System.out.println(status);
                            out.println("<option " + (status ? "" : "disabled") + " value=" + rs.getInt("id") + ">" + rs.getString("text") + "</option>");
                        }
                    } catch (Exception e) {
                        out.println(e);
                    }

                %>
            </select>
            <br>
            <input class="btn btn-primary" type="submit" name="<%= tipo%>" value="<%= tipoText%>">
            <button type="button" class="btn btn-outline-primary" onclick="window.location.href = 'cadastro.jsp'">Voltar</button>
        </form>
        <br>

        <%
            try {
                st = new Conn().conectar().createStatement();
                rs = st.executeQuery("select m.*, e.text especialidade from medico m inner join especialidade e on e.id = m.idEspecialidade where m.status = 1");

                out.println("<table><tr>");
                out.println("<td class=\"p-2 border\"><b>Nome</b></td>");
                out.println("<td class=\"p-2 border\"><b>Telefone</b></td>");
                out.println("<td class=\"p-2 border\"><b>Celular</b></td>");
                out.println("<td class=\"p-2 border\"><b>Especialidade</b></td>");
                out.println("<td class=\"p-2\"></td></tr>");
                while (rs.next()) {
                    out.println("<td class=\"p-2 border\">" + rs.getString("nome") + "</td>");
                    out.println("<td class=\"p-2 border\">" + rs.getString("telefone") + "</td>");
                    out.println("<td class=\"p-2 border\">" + rs.getString("celular") + "</td>");
                    out.println("<td class=\"p-2 border\">" + rs.getString("especialidade") + "</td>");
                    out.println("<td class=\"p-2 border\"><a href='medico.jsp?funcao=editar&id=" + rs.getString(1) + "' class='text-info'>Editar | <i class='fa fa-edit'></i></a</td>");
                    out.println("<td class=\"p-2 border\"><a href='medico.jsp?funcao=excluir&id=" + rs.getString(1) + "' class='text-danger'>Excluir | <i class='fa fa-trash'></i></a></td></tr>");
                }
                out.println("</table>");
            } catch (Exception e) {
                out.println(e);
            }

        %>
    </body>
</html>
