<%
    String nomePagina = request.getRequestURI();

    String contextoAplicacao = request.getContextPath();
    if (contextoAplicacao != null && !contextoAplicacao.isEmpty()) {
        nomePagina = nomePagina.replaceFirst(contextoAplicacao, "");
    }
%>

<div class="vh-100 d-flex flex-column flex-shrink-0 p-3 bg-light" style="width: 280px;">
    <a href="index.jsp" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
        <span class="fs-4">Cadastro de escolas</span>
    </a>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
        <li>
            <a href="professor.jsp" class="<%= nomePagina.equals("/professor.jsp") ? "nav-link active" : "nav-link link-dark" %>">
                Professor
            </a>
        </li>
        <li>
            <a href="aluno.jsp" class="<%= nomePagina.equals("/aluno.jsp") ? "nav-link active" : "nav-link link-dark" %>">
                Aluno
            </a>
        </li>
        <li>
            <a href="nota.jsp" class="<%= nomePagina.equals("/nota.jsp") ? "nav-link active" : "nav-link link-dark" %>">
                Nota
            </a>
        </li>
    </ul>
</div>