<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Topbar Start -->
<div class="container-fluid">         
    <div class="col-lg-6 text-center text-lg-right">                
        <div class="d-inline-flex py-1 align-items-center d-block d-lg-none"> 
            <c:if test="${sessionScope.idusuario != null}">
                <a href="${pageContext.request.contextPath}/painel/home.jsp">
                    <span class="h6 ml-2 text-decoration-none text-truncate">
                        Painel:
                        <i class="fas fa-user-circle"></i>    
                        ${sessionScope.nomeusuario} - ${sessionScope.tipousuario}</span>  
                    </c:if>                
                    <c:if test="${sessionScope.idusuario == null}">

                    <a href="${pageContext.request.contextPath}/painel/login.jsp">
                        <span class="h6 ml-2 text-decoration-none text-truncate">
                            <i class="nav-icon fas fa-lock"></i> Login</span></a>
                        </c:if>
        </div>
    </div>

    <div class="row align-items-center bg-light py-3 px-xl-5 d-none d-lg-flex">
        <div class="col-lg-4">
            <a href="${pageContext.request.contextPath}/index.jsp" class="text-decoration-none">
                <span class="h1 text-uppercase text-primary bg-dark px-2">EVENTOS</span>
                <span class="h1 text-uppercase text-dark bg-primary px-2 ml-n1">.COM</span>
            </a>
        </div>
        <div class="col-lg-4 col-6 text-left">
            <div class="input-group">
                <input id="pesquisaEventoDescricao" type="text" class="form-control" placeholder="Pesquise por um evento" value="${descricao}">
                <div class="input-group-append">
                    <span class="input-group-append">
                        <button type="button" onclick="pesquisar()" class="btn btn-primary btn-flat"><i class="fa fa-search"></i></button>
                    </span>
                </div>
            </div>
        </div>   

        <script>
            $("#pesquisaEventoDescricao").keypress(function (event) {
                if (event.keyCode === 13) {
                    pesquisar();
                }
            });

            function pesquisar() {
                var descricao = document.getElementById('pesquisaEventoDescricao').value;
                console.log("descicao: " + descricao);
                window.location.href = "${pageContext.request.contextPath}/HomeEventoDescricao?nomeEvento=" + descricao;
            };
        </script> 

        <div class="col-lg-4 col-6 text-right">               
            <c:if test="${sessionScope.idusuario != null}">
                <a href="${pageContext.request.contextPath}/painel/home.jsp">
                    <span class="h6 text-decoration-none text-truncate">
                        Painel:
                        <i class="fas fa-user-circle"></i>    
                        ${sessionScope.nomeusuario} - ${sessionScope.tipousuario}</span>
                    </c:if>                
                    <c:if test="${sessionScope.idusuario == null}">
                    <a href="${pageContext.request.contextPath}/painel/login.jsp">
                        <span class="h6 text-decoration-none text-truncate">
                            <i class="nav-icon fas fa-lock"></i>
                            Login
                        </span>
                    </a>
                </c:if>
        </div>
    </div>
</div>
<!-- Topbar End -->

<!-- Navbar Start -->
<div class="container-fluid bg-dark mb-30">
    <div class="row px-xl-5">
        <div class="col-lg-3 d-none d-lg-block">
            <a class="btn d-flex align-items-center justify-content-between bg-primary w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; padding: 0 30px;">
                <h6 class="text-dark m-0"><i class="fa fa-bars mr-2"></i>Categorias</h6>
                <i class="fa fa-angle-down text-dark"></i>
            </a>
            <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 bg-light" id="navbar-vertical" style="width: calc(100% - 30px); z-index: 999;">
                <div class="navbar-nav w-100">
                    <a href="${pageContext.request.contextPath}/HomeEventoCategoria?idCategoriaEvento=0" class="nav-item nav-link">Todos Eventos</a> 
                    <c:forEach var="categoriaevento" items="${categorias}">
                        <a href="${pageContext.request.contextPath}/HomeEventoCategoria?idCategoriaEvento=${categoriaevento.idCategoriaEvento}" class="nav-item nav-link">${categoriaevento.nome}</a>                                             
                    </c:forEach> 
                </div>
            </nav>
        </div>
        <div class="col-lg-9">
            <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-0">
                <a href="${pageContext.request.contextPath}/index.jsp" class="text-decoration-none d-block d-lg-none">
                    <span class="h1 text-uppercase text-primary bg-dark px-2">EVENTOS</span>
                    <span class="h1 text-uppercase text-dark bg-primary px-2 ml-n1">.COM</span>
                </a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>          