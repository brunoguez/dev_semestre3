
<%@page import="model.Professor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="config.Conn"%>

<%
    Statement st = null;
    ResultSet rs = null;

    Professor professor = new Professor();
    String tipo = "salvar";
    String tipoText = "Salvar";
    if (request.getParameter("salvar") != null) {
        String nome = request.getParameter("nome");
        try {
            if (nome == null || nome.isEmpty()) {
                throw new Exception("Faltando o nome do Professor");
            }
            st = new Conn().conectar().createStatement();
            st.executeUpdate("insert into tbprofessor(nomeProfessor,status) values ("
                    + "'" + nome + "',"
                    + "1)");
            out.println("<meta http-equiv='refresh' content='0;URL=professor.jsp'>");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Professor cadastrado com sucesso');");
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
            String query = "update tbprofessor set "
                    + "nomeProfessor = '" + nome
                    + "', status = " + status
                    + " where codProfessor = " + id;
            st.executeUpdate(query);
            out.println("<meta http-equiv='refresh' content='0;URL=professor.jsp'>");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Professor alterado com sucesso');");
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
            rs = st.executeQuery("select * from tbprofessor where codProfessor = " + id);
            while (rs.next()) {
                professor.codProfessor = rs.getInt("codProfessor");
                professor.nomeProfessor = rs.getString("nomeProfessor");
                professor.status = rs.getBoolean("status");
            }
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
        <title>Escola - Professor</title>
    </head>
    <body>
        <div class="d-flex">
            <%@ include file="_Layout.jsp" %>
            <div class="vw-100 flex-column p-4">
                <form action="" method="post" id="cadastroProfessor">
                    <div class="input-group mb-3 w-75">
                        <span class="input-group-text" id="nomeProfessor">Nome do Professor</span>
                        <input type="text" class="form-control" placeholder="Nome" aria-label="Nome do Paciente" aria-describedby="nomeProfessor" name="nome" value="<%= professor.nomeProfessor%>">
                    </div>
                    <div class="input-group mb-3 w-75">
                        <span class="input-group-text">Status</span>
                        <select class="form-select w-25" id="statusPaciente" name="status" >
                            <option value ="1" <%=professor.status ? "selected" : ""%>>Ativo</option>
                            <option value ="0" <%=professor.status ? "" : "selected"%>>Inativo</option>
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
                        rs = st.executeQuery("select * from tbprofessor");

                        out.println("<table class='table table-striped'><thead><tr>");
                        out.println("<th scope='col'><b>Nome</b></th>");
                        out.println("<th scope='col'><b>Status</b></th>");
                        out.println("<th scope='col'></th></tr></thead>");
                        while (rs.next()) {
                            out.println("<td>" + rs.getString("nomeProfessor") + "</td>");
                            out.println("<td>" + (rs.getBoolean("status") ? "Ativo" : "Inativo") + "</td>");
                            out.println("<td><a href='professor.jsp?funcao=editar&id=" + rs.getString("codProfessor") + "' class='text-info'>Editar | <i class='fa fa-edit'></i></a</td></tr>");
                        }
                        out.println("</table>");
                    } catch (Exception e) {
                        out.println(e);
                    }

                %>
            </div>
        </div>
    </body>
</html>
