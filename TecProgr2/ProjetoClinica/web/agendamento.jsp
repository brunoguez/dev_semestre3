<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="config.Conn"%>

<%
    Statement st = null;
    ResultSet rs = null;
%>

<%
    int idAgendamento = 0;
    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    DateFormat df = new SimpleDateFormat("dd/MM/yyyy HH:mm");
    Calendar calendar = Calendar.getInstance();
    String dataAgendamento = "";
    int idPaciente = 0;
    int idMedico = 0;
    String diagnosticoText = "";
    boolean statusPaciente = true;
    String tipo = "salvar";
    String tipoText = "Salvar";
    if (request.getParameter("salvar") != null) {
        String data = request.getParameter("data");
        String medico = request.getParameter("medico");
        String paciente = request.getParameter("paciente");
        String diagnostico = request.getParameter("diagnostico");
        try {
            if (data == null || data.isEmpty()) {
                throw new Exception("Faltando a data do agendamento");
            }
            st = new Conn().conectar().createStatement();
            st.executeUpdate("insert into agendamento(data,idPaciente,idMedico,diagnostico,ativo) values ("
                    + "'" + dateFormat.parse(data) + "',"
                    + "'" + paciente + "',"
                    + "'" + medico + "',"
                    + "'" + diagnostico + "',"
                    + "1)");
            out.println("<meta http-equiv='refresh' content='0;URL=agendamento.jsp'>");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Agendamento cadastrado com sucesso');");
            out.println("</script>");
        } catch (Exception e) {
            out.println("<span>" + e.getMessage() + "</span>");
        }
    }
    if (request.getParameter("alterar") != null) {
        String data = request.getParameter("data");
        String medico = request.getParameter("medico");
        String paciente = request.getParameter("paciente");
        String diagnostico = request.getParameter("diagnostico");
        String status = request.getParameter("status");
        String id = request.getParameter("id");

        try {
            st = new Conn().conectar().createStatement();
            String query = "update agendamento set "
                    + "data = '" + dateFormat.format(df.parse(data)).toString()
                    + "', idPaciente = '" + paciente
                    + "', idMedico = '" + medico
                    + "', diagnostico = '" + diagnostico
                    + "', ativo = " + status
                    + " where id = " + id;
            st.executeUpdate(query);
            out.println("<meta http-equiv='refresh' content='0;URL=agendamento.jsp'>");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Agendamento alterado com sucesso');");
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
            rs = st.executeQuery("select * from agendamento where id = " + id);
            while (rs.next()) {
                idAgendamento = rs.getInt("id");
                dataAgendamento = df.format(dateFormat.parse(rs.getString("data").toString()));
                idPaciente = rs.getInt("idPaciente");
                idMedico = rs.getInt("idMedico");
                diagnosticoText = rs.getString("diagnostico");
                statusPaciente = rs.getBoolean("ativo");
            }
        } catch (Exception e) {
            out.println(e);
        }
    }
    if (request.getParameter("funcao") != null && request.getParameter("funcao").equals("excluir")) {
        String id = request.getParameter("id");
        try {

            st = new Conn().conectar().createStatement();
            st.executeUpdate("update agendamento set ativo = 0 where id=" + id);
            out.println("<meta http-equiv='refresh' content='0;URL=agendamento.jsp'>");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Agendamento inativado com sucesso');");
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
        <title>Agendamentos</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    </head>
    <%out.print("<script>"
                + "$(document).ready(function() { "
                + "$('#paciente').val(" + idPaciente + "); "
                + "$('#medico').val(" + idMedico + ");"
                + "});"
                + "</script>");%>
    <body class="w-75">
        <h1>Agendamentos</h1>
        <form action="" method="post" id="cadastroAgendamento">
            <div class="input-group mb-3">
                <span class="input-group-text" id="dataAgendamento">Data do Agendamento</span>
                <input type="text" class="form-control" placeholder="dd/mm/aaaa hh:mm" aria-label="Data do Agendamento" aria-describedby="dataAgendamento" name="data" value="<%= dataAgendamento%>">
            </div>
            <div class="input-group mb-3">
                <span class="input-group-text">Paciente</span>
                <select class="form-select" id="paciente" name="paciente" >
                    <option disabled selected>Escolha um paciente</option> 
                    <%
                        try {

                            st = new Conn().conectar().createStatement();

                            rs = st.executeQuery("Select * from paciente where status = 1");

                            while (rs.next()) {
                                boolean status = rs.getBoolean("status");
                                System.out.println(status);
                                out.println("<option " + (status ? "" : "disabled") + " value=" + rs.getInt("id") + ">" + rs.getString("nome") + "</option>");
                            }
                        } catch (Exception e) {
                            out.println(e);
                        }

                    %>
                </select>
            </div>
            <div class="input-group mb-3">
                <span class="input-group-text">Medico</span>
                <select class="form-select" id="medico" name="medico" >
                    <option disabled selected>Escolha um médico</option> 
                    <%                        try {
                            st = new Conn().conectar().createStatement();

                            rs = st.executeQuery("Select m.*, e.text especialidadeText from medico m inner join especialidade e on e.id = m.idEspecialidade where m.status = 1");

                            while (rs.next()) {
                                boolean status = rs.getBoolean("status");
                                System.out.println(status);
                                out.println("<option " + (status ? "" : "disabled") + " value=" + rs.getInt("id") + ">" + rs.getString("nome") + " - " + rs.getString("especialidadeText") + "</option>");
                            }
                        } catch (Exception e) {
                            out.println(e);
                        }

                    %>
                </select>
            </div>
            <div class="input-group mb-3">
                <span class="input-group-text">Diagnóstico</span>
                <textarea class="form-control" aria-label="With textarea" name="diagnostico" id="diagnostico"><%=diagnosticoText%></textarea>
            </div>
            <div class="input-group mb-3">
                <span class="input-group-text">Status</span>
                <select class="form-select" id="statusPaciente" name="status" >
                    <option value ="1" <%=statusPaciente ? "selected" : ""%>>Ativo</option>
                    <option value ="0" <%=statusPaciente ? "" : "selected"%>>Inativo</option>
                </select>
            </div>
            <input class="btn btn-primary" type="submit" name="<%= tipo%>" value="<%= tipoText%>">
            <button type="button" class="btn btn-outline-primary" onclick="window.location.href = 'index.jsp'">Voltar</button>
            <br>  
        </form>
        <br>
        <%
            try {
                st = new Conn().conectar().createStatement();
                rs = st.executeQuery("select a.*, p.nome nomePaciente, m.nome nomeMedico, e.text nomeEspecialidade"
                        + " from agendamento a"
                        + " inner join paciente p on p.id = a.idPaciente"
                        + " inner join medico m on m.id = a.idMedico"
                        + " inner join especialidade e on e.id = m.idEspecialidade");

                out.println("<table><tr>");
                out.println("<td class=\"p-2 border\"><b>Data</b></td>");
                out.println("<td class=\"p-2 border\"><b>Paciente</b></td>");
                out.println("<td class=\"p-2 border\"><b>Médico</b></td>");
                out.println("<td class=\"p-2 border\"><b>Diagnóstico</b></td>");
                out.println("<td class=\"p-2 border\"><b>Status</b></td>");
                out.println("<td class=\"p-2\"></td></tr>");
                while (rs.next()) {
                    out.println("<td class=\"p-2 border\">" + df.format(dateFormat.parse(rs.getString("data"))).toString() + "</td>");
                    out.println("<td class=\"p-2 border\">" + rs.getString("nomePaciente") + "</td>");
                    out.println("<td class=\"p-2 border\">" + rs.getString("nomeMedico") + " - " + rs.getString("nomeEspecialidade") + "</td>");
                    out.println("<td class=\"p-2 border\">" + rs.getString("diagnostico") + "</td>");
                    out.println("<td class=\"p-2 border\">" + (rs.getBoolean("ativo") ? "Ativo" : "Inativo") + "</td>");
                    out.println("<td class=\"p-2 border\"><a href='agendamento.jsp?funcao=editar&id=" + rs.getString(1) + "' class='text-info'>Editar | <i class='fa fa-edit'></i></a</td></tr>");
                }
                out.println("</table>");
            } catch (Exception e) {
                out.println(e);
            }

        %>
    </body>
</html>
