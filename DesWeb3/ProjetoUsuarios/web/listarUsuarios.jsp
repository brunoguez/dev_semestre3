
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="config.Conn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  
    Statement st = null;
    ResultSet rs = null;
    %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Lista de Usuários</h1>        
        <%  
            try{
     
            st = new Conn().conectar().createStatement();
            
            rs = st.executeQuery("Select * from usuarios");
            
            
            out.println("<table border=1><tr>");
            while(rs.next())
            {    
            out.println("<td>" + rs.getString(2) + "</td>");
            out.println("<td>" + rs.getString(3)+ "</td></tr>");  
        }
            out.println("</table>");
            }
            catch(Exception e)
            {
            out.println(e);
            }
                
            %>
            
    </body>
</html>
