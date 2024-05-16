<%-- 
    Document   : HOME
    Created on : 28 nov 2023, 11:26:35 p. m.
    Author     : FZ
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="database.Dba"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HOME TV-MAZE</title>
        <!-- CSS -->
        <link rel="stylesheet" href="FORM_HOME.css"/>
    </head>
    <body>
        <%
            HttpSession Mi_session = request.getSession();
            if (Mi_session == null || Mi_session.getAttribute("S_User") == null) {
                request.getRequestDispatcher("Login_US.jsp").forward(request, response);
            }
        %>

        <header class="header">
            <img src="IMGS/tvm-header-logo.png" alt="">
            <nav class="nav">
                <form action="HOME_BUSQUEDA.jsp" method="post">
                    <input type="text" name="Busqueda_PE" id="Busqueda_PE" placeholder="Busqueda">
                    <input type="submit" name="BTN" value="🔎">
                </form>                        
                <%
                    if (session.getAttribute("S_Rol").equals("AL")) {
                %>
                <a href="HOME_ADMIN.jsp">PORTAL</a>
                <%}%>
                <a href="Lista_Favorito.jsp">LISTA FAVORITOS</a>
                <a href="VA_Cerrar_Sesion.jsp">CERRAR SESIÓN</a>                
            </nav>
        </header>

        <section class="CONTAINER">
            <%
                try {
                    //Connect DBA
                    Dba db = new Dba(application.getRealPath("") + "/daw.mdb");
                    db.conectar();
                    //SQL Sentence
                    db.query.execute("SELECT Codigo,Nombre,Imagen FROM Series");
                    ResultSet rs = db.query.getResultSet();
                    while (rs.next()) {
                        String Codigo = rs.getString(1);
                        String Nombre = rs.getString(2);
                        String Imagen = rs.getString(3);
            %>


            <div class="PELICULA">                
                <a href="SERIE_INFO.jsp?Codigo=<%=Codigo%>">
                    <img src="<%=Imagen%>" alt="alt"/>
                </a>
                <h3><%=Nombre%></h3>
            </div>
            <%
                    }
                    db.desconectar();
                } catch (Exception e) {
                    e.printStackTrace();
                }

            %>
        </section>
    </body>
</html>
