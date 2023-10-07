
<%@page import="java.text.DecimalFormat"%>
<%@page import="model.Nota"%>
<%@page import="model.Aluno"%>
<%@page import="model.Professor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="config.Conn"%>

<%
    Statement st = null;
    ResultSet rs = null;

    DecimalFormat formatoDuas = new DecimalFormat("#0.00");
    DecimalFormat formatoZero = new DecimalFormat("#");

    Nota nota = new Nota();
    int selectAluno = -1, selectProfessor = -1;

    String tipo = "salvar";
    String tipoText = "Salvar";
    if (request.getParameter("salvar") != null) {
        String aluno = request.getParameter("aluno");
        String professor = request.getParameter("professor");
        String notaAluno = request.getParameter("nota");
        String faltas = request.getParameter("faltas");
        try {
            if (notaAluno == null || notaAluno.isEmpty()) {
                throw new Exception("Faltando a nota do Aluno");
            }
            if (faltas == null || faltas.isEmpty()) {
                throw new Exception("Faltando as faltas do Aluno");
            }

            try {
                double numero = formatoDuas.parse(notaAluno).doubleValue();
                notaAluno = formatoDuas.format(numero);
            } catch (Exception e) {
                throw new Exception("Nota inválida");
            }

            try {
                double numero = formatoZero.parse(faltas).doubleValue();
                faltas = formatoZero.format(numero);
            } catch (Exception e) {
                throw new Exception("Faltas inválidas");
            }

            st = new Conn().conectar().createStatement();
            st.executeUpdate("insert into tbnota(codAluno,codProfessor,nota,faltas) values ("
                    + "" + aluno + ","
                    + "" + professor + ","
                    + "" + notaAluno.replace(",", ".") + ","
                    + "" + faltas + ")");
            out.println("<meta http-equiv='refresh' content='0;URL=nota.jsp'>");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Nota cadastrada com sucesso');");
            out.println("</script>");
        } catch (Exception e) {
            out.println("<span>" + e.getMessage() + "</span>");
        }
    }
    if (request.getParameter("alterar") != null) {
        String aluno = request.getParameter("aluno");
        String professor = request.getParameter("professor");
        String notaAluno = request.getParameter("nota");
        String faltas = request.getParameter("faltas");
        String id = request.getParameter("id");
        try {

            if (notaAluno == null || notaAluno.isEmpty()) {
                throw new Exception("Faltando a nota do Aluno");
            }
            if (faltas == null || faltas.isEmpty()) {
                throw new Exception("Faltando as faltas do Aluno");
            }

            try {
                double numero = formatoDuas.parse(notaAluno).doubleValue();
                notaAluno = formatoDuas.format(numero);
            } catch (Exception e) {
                throw new Exception("Nota inválida");
            }

            try {
                double numero = formatoZero.parse(faltas).doubleValue();
                faltas = formatoZero.format(numero);
            } catch (Exception e) {
                throw new Exception("Faltas inválidas");
            }
        } catch (Exception e) {
            throw e;
        }

        try {
            st = new Conn().conectar().createStatement();
            String query = "update tbnota set "
                    + "codAluno = " + aluno
                    + ", codProfessor = " + professor
                    + ", nota = " + notaAluno.replace(",",".")
                    + ", faltas = " + faltas
                    + " where codNota = " + id;
            System.out.println(query);
            st.executeUpdate(query);
            out.println("<meta http-equiv='refresh' content='0;URL=nota.jsp'>");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Nota alterada com sucesso');");
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
            rs = st.executeQuery("select * from tbnota where codNota = " + id);
            while (rs.next()) {
                nota.codAluno = rs.getInt("codAluno");
                selectAluno = nota.codAluno;
                nota.codNota = rs.getInt("codNota");
                nota.codProfessor = rs.getInt("codProfessor");
                selectProfessor = nota.codProfessor;
                nota.faltas = rs.getInt("faltas");
                nota.nota = rs.getDouble("nota");
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
        <title>Escola - Nota</title>
    </head>
    <%out.print("<script>$(document).ready(function() {"
                + " //$('#especialidade').val(); "
                + "});</script>");%>
    <body>
        <div class="d-flex">
            <%@ include file="_Layout.jsp" %>
            <div class="vw-100 flex-column p-4">
                <form action="" method="post" id="cadastroNota">
                    <div class="input-group mb-3 w-75">
                        <span class="input-group-text" id="codAluno">Aluno</span>
                        <select class="form-select w-50" id="aluno" name="aluno" >
                            <option disabled selected>Escolha um Aluno</option> 
                            <%                                try {
                                    st = new Conn().conectar().createStatement();
                                    rs = st.executeQuery("Select * from tbaluno");
                                    while (rs.next()) {
                                        out.println("<option " + (rs.getBoolean("status") ? "" : "disabled") + (selectAluno == rs.getInt("codAluno") ? "selected" : "") + " value=" + rs.getInt("codAluno") + ">" + rs.getString("nomeAluno") + "</option>");
                                    }
                                } catch (Exception e) {
                                    out.println("<span>" + e.getMessage() + "</span>");
                                }

                            %>
                        </select>
                    </div>
                    <div class="input-group mb-3 w-75">
                        <span class="input-group-text" id="codProfessor">Professor</span>
                        <select class="form-select w-50" id="professor" name="professor" >
                            <option disabled selected>Escolha um Professor</option> 
                            <%                                try {
                                    st = new Conn().conectar().createStatement();
                                    rs = st.executeQuery("Select * from tbprofessor");
                                    while (rs.next()) {
                                        out.println("<option " + (rs.getBoolean("status") ? "" : "disabled") + (selectProfessor == rs.getInt("codProfessor") ? "selected" : "") + " value=" + rs.getInt("codProfessor") + ">" + rs.getString("nomeProfessor") + "</option>");
                                    }
                                } catch (Exception e) {
                                    out.println("<span>" + e.getMessage() + "</span>");
                                }

                            %>
                        </select>
                    </div>
                    <div class="input-group mb-3 w-75">
                        <span class="input-group-text" id="notaAluno">Nota</span>
                        <input type="text" class="form-control" placeholder="00,00" aria-label="Telefone do Aluno" aria-describedby="notaAluno" name="nota" value="<%= nota.nota == 0 ? "" : nota.nota%>">
                    </div>
                    <div class="input-group mb-3 w-75">
                        <span class="input-group-text" id="faltas">Faltas</span>
                        <input type="text" class="form-control" placeholder="XXXXX" aria-label="Faltas do Aluno" aria-describedby="faltasAluno" name="faltas" value="<%= nota.faltas == 0 ? "" : nota.faltas%>">
                    </div>
                    <input class="btn btn-primary" type="submit" name="<%= tipo%>" value="<%= tipoText%>">
                    <button type="button" class="btn btn-outline-primary" onclick="window.location.href = 'index.jsp'">Voltar</button>
                    <br>  
                </form>
                <br>  
                <%
                    try {
                        st = new Conn().conectar().createStatement();
                        rs = st.executeQuery("select nota.*, aluno.nomeAluno, professor.nomeProfessor from tbnota nota"
                                + " inner join tbaluno aluno on aluno.codAluno = nota.codAluno"
                                + " inner join tbprofessor professor on professor.codProfessor = nota.codProfessor"
                                + " order by aluno.nomeAluno");

                        out.println("<table class='table table-striped'><thead><tr>");
                        out.println("<th scope='col'><b>Aluno</b></th>");
                        out.println("<th scope='col'><b>Professor</b></th>");
                        out.println("<th scope='col'><b>Nota</b></th>");
                        out.println("<th scope='col'><b>Faltas</b></th>");
                        out.println("<th scope='col'></th></tr></thead>");
                        while (rs.next()) {
                            out.println("<td>" + rs.getString("nomeAluno") + "</td>");
                            out.println("<td>" + rs.getString("nomeProfessor") + "</td>");
                            out.println("<td>" + rs.getDouble("nota") + "</td>");
                            out.println("<td>" + rs.getInt("faltas") + "</td>");
                            out.println("<td><a href='nota.jsp?funcao=editar&id=" + rs.getInt("codNota") + "' class='text-info'>Editar | <i class='fa fa-edit'></i></a</td></tr>");
                        }
                        out.println("</table>");
                    } catch (Exception e) {
                        out.println("<span>" + e.getMessage() + "</span>");
                    }

                %>
            </div>
        </div>
    </body>
</html>
