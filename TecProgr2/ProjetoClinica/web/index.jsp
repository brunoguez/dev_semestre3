
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<style>

    html,
    body {
        height: 100%;
    }

    body {
        display: -ms-flexbox;
        display: flex;
        -ms-flex-align: center;
        align-items: center;
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #f5f5f5;
    }

    .form-signin {
        width: 100%;
        max-width: 330px;
        padding: 15px;
        margin: auto;
    }
    .form-signin .checkbox {
        font-weight: 400;
    }
    .form-signin .form-control {
        position: relative;
        box-sizing: border-box;
        height: auto;
        padding: 10px;
        font-size: 16px;
    }
    .form-signin .form-control:focus {
        z-index: 2;
    }
    .form-signin input[type="email"] {
        margin-bottom: -1px;
        border-bottom-right-radius: 0;
        border-bottom-left-radius: 0;
    }
    .form-signin input[type="password"] {
        margin-bottom: 10px;
        border-top-left-radius: 0;
        border-top-right-radius: 0;
    }

</style>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ include file="estilos.jsp" %>
        <title>Clínica - Login</title>
    </head>
    <body class="text-center">
        <form class="form-signin">
            <img class="mb-4" src="https://upload.wikimedia.org/wikipedia/commons/5/5b/Round_Landmark_Icon_Hospital.svg" alt="" width="100" height="100">
            <h1 class="h3 mb-3 font-weight-normal">Faça o login</h1>
            <label for="inputEmail" class="sr-only">Endereço de email</label>
            <input type="email" id="inputEmail" class="form-control" placeholder="Seu email" required="" autofocus="">
            <label for="inputPassword" class="sr-only">Senha</label>
            <input type="password" id="inputPassword" class="form-control" placeholder="Senha" required="">
            <div class="mt-3">
                <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
                <button class="btn btn-lg btn-info btn-block" type="submit">Cadastrar</button>
            </div>
            <p class="mt-5 mb-3 text-muted">© Clínica - Bruno Marques Guêz</p>
        </form>


    </body>
</html>
