<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="config.Conn"%>

<%
    Statement st = null;
    ResultSet rs = null;
%>

<%
    if (request.getParameter("salvar") != null) {
        String nome = request.getParameter("nome");
        String telefone = request.getParameter("telefone");
        String celular = request.getParameter("celular");
        String especialidade = request.getParameter("especialidade");

        try {
            st = new Conn().conectar().createStatement();
            st.executeUpdate("insert into medico(nome,telefone,celular,idEspecialidade) values ('"
                    + nome + "','" + telefone + "','" + celular + "','" + especialidade + "')");
            out.println("<meta http-equiv='refresh' content='0;URL=medico.jsp'>");
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de médicos</title>
    </head>
    <body>
        <h1>Médico</h1>
        <form action="" method="post" id="cadastroMedico">
            <label>Nome do Médico</label><br>
            <input type="text" name="nome"><br>
            <label>Telefone</label><br>
            <input type="text" name="telefone"><br>
            <label>Celular</label><br>
            <input type="text" name="celular"><br>
            <label for="especialidade">Nível:</label><br>
            <select id="especialidade" name="especialidade">
                <option disabled selected>Escolha uma opção</option> 

                <%
                    try {

                        st = new Conn().conectar().createStatement();

                        rs = st.executeQuery("Select * from especialidade");

                        while (rs.next()) {
                            out.println("<option value=" + rs.getInt("id") + ">" + rs.getString("text") + "</option>");
                        }
                    } catch (Exception e) {
                        out.println(e);
                    }

                %>
            </select>
            <br><br>
            <input type="submit" name="salvar">
        </form>
    </body>
</html>
