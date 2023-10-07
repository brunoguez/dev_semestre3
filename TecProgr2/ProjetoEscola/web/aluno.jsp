
<%@page import="model.Aluno"%>
<%@page import="model.Professor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="config.Conn"%>

<%
    Statement st = null;
    ResultSet rs = null;

    Aluno aluno = new Aluno();
    String tipo = "salvar";
    String tipoText = "Salvar";
    if (request.getParameter("salvar") != null) {
        String nome = request.getParameter("nome");
        String telefone = request.getParameter("telefone");
        String celular = request.getParameter("celular");
        try {
            if (nome == null || nome.isEmpty()) {
                throw new Exception("Faltando o nome do Aluno");
            }
            st = new Conn().conectar().createStatement();
            st.executeUpdate("insert into tbaluno(nomeAluno,telAluno,celAluno,status) values ("
                    + "'" + nome + "',"
                    + "'" + telefone + "',"
                    + "'" + celular + "',"
                    + "1)");
            out.println("<meta http-equiv='refresh' content='0;URL=aluno.jsp'>");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Aluno cadastrado com sucesso');");
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
            String query = "update tbaluno set "
                    + "nomeAluno = '" + nome
                    + "', telAluno = '" + telefone
                    + "', celAluno = '" + celular
                    + "', status = " + status
                    + " where codAluno = " + id;
            st.executeUpdate(query);
            out.println("<meta http-equiv='refresh' content='0;URL=aluno.jsp'>");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Aluno alterado com sucesso');");
            out.println("</script>");
        } catch (Exception e) {
            out.println("<span>" + e.getMessage() + "</span>");
        }
    }
    if (request.getParameter("funcao") != null && request.getParameter("funcao").equals("editar")) {
        tipoText = "Alterar";
        tipo = "alterar";
        String id = request.getParameter("id");
        System.out.println("editar id: " + id);
        try {
            st = new Conn().conectar().createStatement();
            rs = st.executeQuery("select * from tbaluno where codAluno = " + id);
            while (rs.next()) {
                aluno.codAluno = rs.getInt("codAluno");
                aluno.nomeAluno = rs.getString("nomeAluno");
                aluno.telAluno = rs.getString("telAluno");
                aluno.celAluno = rs.getString("celAluno");
                aluno.status = rs.getBoolean("status");
            }
        } catch (Exception e) {
            out.println("<span>" + e.getMessage() + "</span>");
        }
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <%@ include file="estilos.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Escola - Aluno</title>
    </head>
    <body>
        <div class="d-flex">
            <%@ include file="_Layout.jsp" %>
            <div class="vw-100 flex-column p-4">
                <form action="" method="post" id="cadastroAluno">
                    <div class="input-group mb-3 w-75">
                        <span class="input-group-text" id="nomeAluno">Nome do Aluno</span>
                        <input type="text" class="form-control" placeholder="Nome" aria-label="Nome do Aluno" aria-describedby="nomeAluno" name="nome" value="<%= aluno.nomeAluno%>">
                    </div>
                    <div class="input-group mb-3 w-75">
                        <span class="input-group-text" id="telefoneAluno">Telefone do Aluno</span>
                        <input type="text" class="form-control" placeholder="(XX) XXXX-XXXX" aria-label="Telefone do Aluno" aria-describedby="telefoneAluno" name="telefone" value="<%= aluno.telAluno%>">
                    </div>
                    <div class="input-group mb-3 w-75">
                        <span class="input-group-text" id="celularAluno">Celular do Aluno</span>
                        <input type="text" class="form-control" placeholder="(XX) 9XXXX-XXXX" aria-label="Celular do Aluno" aria-describedby="celularAluno" name="celular" value="<%= aluno.celAluno%>">
                    </div>
                    <div class="input-group mb-3 w-75">
                        <span class="input-group-text">Status</span>
                        <select class="form-select w-25" id="statusAluno" name="status" >
                            <option value ="1" <%=aluno.status ? "selected" : ""%>>Ativo</option>
                            <option value ="0" <%=aluno.status ? "" : "selected"%>>Inativo</option>
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
                        rs = st.executeQuery("select * from tbaluno");

                        out.println("<table class='table table-striped'><thead><tr>");
                        out.println("<th scope='col'><b>Nome</b></th>");
                        out.println("<th scope='col'><b>Telefone</b></th>");
                        out.println("<th scope='col'><b>Celular</b></th>");
                        out.println("<th scope='col'><b>Status</b></th>");
                        out.println("<th scope='col'></th></tr></thead>");
                        while (rs.next()) {
                            out.println("<td>" + rs.getString("nomeAluno") + "</td>");
                            out.println("<td>" + rs.getString("telAluno") + "</td>");
                            out.println("<td>" + rs.getString("celAluno") + "</td>");
                            out.println("<td>" + (rs.getBoolean("status") ? "Ativo" : "Inativo") + "</td>");
                            out.println("<td><a href='aluno.jsp?funcao=editar&id=" + rs.getString("codAluno") + "' class='text-info'>Editar | <i class='fa fa-edit'></i></a</td></tr>");
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
