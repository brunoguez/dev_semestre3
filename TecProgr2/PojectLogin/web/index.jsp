<%@ include file="referencias.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ include file="estilos.jsp" %>
        <title>JSP Index</title>
    </head>
    <body>
        <%
            Statement st = null;
            ResultSet rs = null;
        %>
        <div class="container mt-4 col-lg-4">
            <div class="card col-sm-8">
                <div class="card-body">
                    <form class="form-sign">
                        <div class="form-group text-center">
                            <h3>Login</h3>
                            <!--<img src="img/logo.png" alt="70" width="170"/>-->                            
                            <label>Bem vindos ao Sistema</label>
                        </div>
                        <div class="form-group">
                            <label>Usuário:</label>
                            <input type="text" name="txtuser" id="txtuser" value="" class="form-control">                              
                        </div>
                        <div class="form-group">
                            <label>Senha:</label>
                            <input type="password" name="txtpass" id="txtpass" value="" class="form-control">


                            <%
                                if ((request.getParameter("txtuser") != null) && (request.getParameter("txtpass") != null)) {
                                    String login, pass;
                                    login = request.getParameter("txtuser");
                                    pass = request.getParameter("txtpass");

                                    st = new Conn().conectar().createStatement();
                                    rs = st.executeQuery("select * from tblogin where usuario ='" + login + "' and senha='" + pass + "'");
                                    if (rs.next()) {
                                        response.sendRedirect("principal.jsp");
                                        session.setAttribute("usuario", login);
                                        session.setAttribute("nivel", rs.getString(3));
                                    } else {
                                        out.println("<script>alert('Verifique o usuário ou senha')</script>");
                                    }
                                }

                            %>
                        </div>
                        <input type="submit" name="btnLog" value="Logar" id="btnLog" class="btn btn-primary btn-block">
                    </form>
                </div>
            </div>
        </div>

    </body>
</html>
