<%-- 
    Document   : HOME_ADMIN
    Created on : 30 nov 2023, 8:04:37 p. m.
    Author     : FZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PORTAL</title>
        <!-- CSS -->
        <link rel="stylesheet" href="FORM_HOME.css"/>
    </head>
    <body>
        <%
            //VALIDATE ONLY ADMIN CAN ENTER
            HttpSession Mi_session = request.getSession();
            if (Mi_session==null||Mi_session.getAttribute("S_User")==null) {
                request.getRequestDispatcher("Login_US.jsp").forward(request, response);
            }else if(Mi_session.getAttribute("S_Rol").equals("CL")){
                //Validate ROL
                request.getRequestDispatcher("HOME.jsp").forward(request, response);
            }           
        %>
        <header class="header">
            <img src="IMGS/tvm-header-logo.png" alt="">
            <nav>
                <a href="HOME.jsp">HOME</a>
                <a href="Lista_Favorito.jsp">LISTA FAVORITOS</a>
                <a href="VA_Cerrar_Sesion.jsp">CERRAR SESIÓN</a>
            </nav>
        </header>
        <section class="CONTAINER">
            <div class="ADMIN-AC"><a href="Crear_Serie.jsp">CREAR SERIE</a></div>
            <div class="ADMIN-AC"><a href="Crear_Temporada.jsp">CREAR TEMPORADA</a></div>
            <div class="ADMIN-AC"><a href="Crear_Episodios.jsp">CREAR EPISODIO</a></div>
            <div class="ADMIN-AC"><a href="Manejo_Usuarios.jsp">MANEJO USUARIOS</a></div>
            <div class="ADMIN-AC"><a href="Manejo_Series.jsp">MANEJO SERIES</a></div>
        </section>
    </body>
</html>
