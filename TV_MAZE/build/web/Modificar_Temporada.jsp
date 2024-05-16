<%-- 
    Document   : Modificar_Temporada
    Created on : 12-10-2023, 12:14:51 PM
    Author     : FZ
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.Dba"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Temporada</title>
        <!-- CSS -->
        <link rel="stylesheet" href="FORMS_SERIES.css"/>
    </head>
    <body>
        <%
            HttpSession Mi_session = request.getSession();
            if (Mi_session == null || Mi_session.getAttribute("S_User") == null) {
                request.getRequestDispatcher("Login_US.jsp").forward(request, response);
            } else if (Mi_session.getAttribute("S_Rol").equals("CL")) {
                //Validate ROL
                request.getRequestDispatcher("HOME.jsp").forward(request, response);
            }
        %>
        <%
            if (request.getParameter("BTN-MODIFICAR") != null) {
                //CONNECT BD
                Dba db = new Dba(application.getRealPath("") + "/daw.mdb");
                db.conectar();
                //SQL SENTENCE
                db.query.executeUpdate("Update Temporadas SET Nombre='" + request.getParameter("Nombre") + "' WHERE Codigo='" + request.getParameter("Codigo") + "'");
                out.print("<script>alert('¡TEMPORDA ACTUALIZADA!');"
                        + "window.location.href='Manejo_Series.jsp';</script>");
            }
        %>
        <%
            //Conexion con Web SERVICE
            MPQ.SERVER_Service service = new MPQ.SERVER_Service();
            MPQ.SERVER port = service.getSERVERPort();

        %>
        <header class="header">
            <img src="IMGS/tvm-header-logo.png" alt="">
            <nav>
                <a href="HOME.jsp">HOME</a>
                <a href="HOME_ADMIN.jsp">PORTAL</a>
                <a href="Manejo_Series.jsp">MANEJO SERIES</a>
                <a href="VA_Cerrar_Sesion.jsp">CERRAR SESIÓN</a>
            </nav>
        </header>

        <section class="LG">
            <form action="Modificar_Temporada.jsp">
                <h2>MODIFICAR TEMPORADAS</h2>
                <label for="Codigo">Código:</label>
                <input type="number" id="Codigo" name="Codigo" value="<%=request.getParameter("Codigo")%>" placeholder="Ingrese su codigo" readonly>

                <label for="Nombre">Nombre:</label>
                <input type="text" id="Nombre" name="Nombre" value="<%=request.getParameter("Nombre")%>" placeholder="Ingrese el nombre" required> 

                <input type="submit" name="BTN-MODIFICAR" value="MODIFICAR TEMPORADA">
            </form>
        </section>

        <section class="RG IMG-2 IMG">
            <div class="RG-CT">
                <h1>CREA TEMPORADAS EN UN MOMENTO</h1>
                <p>
                    ¿Quires continuar con el desenlace de tu serie? Pues aprovecha nuestra pagina creando temporadas para
                    darle seguimiento a las ultimas noticias.
                </p>
            </div>
        </section>
        <div class="footer">
            <div>
                <label>SIGUENOS EN:</label>
                <br>
                <a href="<%=port.getFacebook()%>"> <img src="IMGS/FOOTER/icons8-facebook-48.png" alt=""></a>
                <a href="<%=port.getInstagram()%>"> <img src="IMGS/FOOTER/icons8-instagram-48.png" alt=""></a>
                <a href="<%=port.getReddit()%>"> <img src="IMGS/FOOTER/icons8-reddit-48.png" alt=""></a>
                <a href="<%=port.getTwitter()%>"> <img src="IMGS/FOOTER/icons8-twitter-48.png" alt=""></a>
                <br>
                <label>&copy; 2023 TVMaze.com</label>
                <br>
                <div class="copy">
                    <a href="https://www.tvmaze.com/site/copyright">Copyright Policy</a>
                    <a href="https://www.tvmaze.com/site/privacy">Privacy Policy</a>
                    <a href="https://www.tvmaze.com/site/tos">ToS</a>
                </div>
            </div>
        </div>
    </body>
</html>
