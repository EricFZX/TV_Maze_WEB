<%-- 
    Document   : Modificar_Serie
    Created on : 12-10-2023, 09:29:29 AM
    Author     : FZ
--%>

<%@page import="database.Dba"%>
<%@page import="java.net.URLDecoder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modficar Serie</title>
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
                db.query.executeUpdate("UPDATE Series SET Nombre='" + request.getParameter("Nombre") + "', "
                        + "Resumen='" + request.getParameter("Resumen") + "', "
                        + "Imagen='" + request.getParameter("Imagen") + "', "
                        + "Genero='" + request.getParameter("Genero") + "' "
                        + "WHERE Codigo='" + request.getParameter("Codigo") + "'");
                out.print("<script>alert('¡SERIE ACTUALIZADA!');"
                        + "window.location.href='Manejo_Series.jsp';</script>");
            }

        %>
        <%             //Conexion con Web SERVICE
            MPQ.SERVER_Service service = new MPQ.SERVER_Service();
            MPQ.SERVER port = service.getSERVERPort();

        %>

        <header class="header">
            <img src="IMGS/tvm-header-logo.png" alt="">
            <nav>
                <a href="HOME.jsp">HOME</a>
                <a href="HOME_ADMIN.jsp">PORTAL</a>
                <a href="Manejo_Series.jsp">MANEJO USUARIOS</a>
                <a href="VA_Cerrar_Sesion.jsp">CERRAR SESIÓN</a>
            </nav>
        </header>

        <section class="LG">
            <form action="Modificar_Serie.jsp" accept-charset="UTF-8">
                <h2>MODIFICAR SERIE</h2>
                <label for="Codigo">Código:</label>
                <input type="number" name="Codigo" id="Codigo" value="<%=request.getParameter("Codigo")%>" placeholder="Ingrese su codigo" readonly>

                <label for="Nombre">Nombre:</label>
                <input type="text" name="Nombre" id="Nombre" value="<%=request.getParameter("Nombre")%>" placeholder="Ingrese su nombre" required="">


                <% //DECODIFICATE TEXT
                    String Resumen = URLDecoder.decode(request.getParameter("Resumen"), "UTF-8");
                %>
                <label for="Resumen">Resumen:</label>
                <textarea name="Resumen" id="Resumen" cols="30" rows="10" required><%=Resumen%></textarea>

                <label for="Genero">Genero:</label>
                <input type="text" name="Genero" id="Genero" value="<%=request.getParameter("Genero")%>">

                <label for="Imagen">Imagen:</label>
                <input type="text" name="Imagen" id="Imagen" value="<%=request.getParameter("Imagen")%>" placeholder="Ingrese URL IMAGEN">            

                <input type="submit" name="BTN-MODIFICAR" value="MODIFICAR SERIE">
            </form>
        </section>

        <section class="RG IMG-4">
            <div class="RG-CT">
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
                <label>&copy; 2023 Plantilla HTML y CSS</label>
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
