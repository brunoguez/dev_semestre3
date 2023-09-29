<%
    String usu = (String) session.getAttribute("usuario");
    String nivel = (String) session.getAttribute("nivel");
    String valor = (String) session.getAttribute("valor");
    if (usu == null) {
        response.sendRedirect("index.jsp");
    }
%>

