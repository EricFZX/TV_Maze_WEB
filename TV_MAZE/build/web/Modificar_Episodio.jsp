<%-- 
    Document   : Modificar_Episodio
    Created on : 12-10-2023, 07:57:43 PM
    Author     : FZ
--%>

<%@page import="java.net.URLDecoder"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="database.Dba"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Episodio</title>
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
                //BD
                Dba db = new Dba(application.getRealPath("") + "/daw.mdb");
                db.conectar();
                //SQL SENTENCE
                db.query.executeUpdate("UPDATE Episodio SET Codigo_Temporada='" + request.getParameter("Temporada_ID") + "', "
                        + "Nombre='" + request.getParameter("Nombre") + "', "
                        + "Duracion='" + request.getParameter("Duracion") + "', "
                        + "Resumen='" + request.getParameter("Resumen") + "' "
                        + "WHERE Codigo='" + request.getParameter("Codigo") + "'");
                db.commit();
                db.desconectar();
                out.print("<script>alert('¡EPISODIO ACTUALIZADO!');"
                        + "window.location.href='Manejo_Series.jsp';</script>");
            }

        %>
        <%            //Conexion con Web SERVICE
            MPQ.SERVER_Service service = new MPQ.SERVER_Service();
            MPQ.SERVER port = service.getSERVERPort();

        %>

        <header class="header">
            <img src="IMGS/tvm-header-logo.png" alt="">
            <nav>
                <a href="HOME.jsp">HOME</a>
                <a href="HOME.jsp">PORTAL</a>
                <a href="Manejo_Series.jsp">MANEJO SERIES</a>
                <a href="VA_Cerrar_Sesion.jsp">CERRAR SESIÓN</a>
            </nav>
        </header>

        <section class="LG">
            <form action="Modificar_Episodio.jsp" id="FORM_Episodios">
                <h2>MODIFICAR EPISODIO</h2>
                <label for="Codigo">Código:</label>
                <input type="number" id="Codigo" value="<%=request.getParameter("Codigo")%>" name="Codigo" placeholder="Ingrese su codigo"  readonly required>
                <label>Temporada:</label>
                <select id="Temporada_ID" name="Temporada_ID">
                    <option value=""></option>
                    <%
                        try {
                            //Dinamic Select
                            Dba db = new Dba(application.getRealPath("") + "/daw.mdb");
                            db.conectar();
                            //SQL Sentence
                            db.query.execute("SELECT Codigo,Nombre FROM Temporadas WHERE Codigo_Serie='" + request.getParameter("Codigo_Serie") + "'");
                            ResultSet rs = db.query.getResultSet();
                            while (rs.next()) {

                    %>
                    <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
                    <%
                            }
                            db.desconectar();

                        } catch (SQLException e) {
                            e.printStackTrace();
                        }

                    %>
                </select>

                <label for="Nombre">Nombre:</label>
                <input type="text" id="Nombre" name="Nombre" value="<%=request.getParameter("Nombre")%> "placeholder="Ingrese su nombre" required>

                <label for="Duracion">Duracion:</label>
                <input type="time" name="Duracion" id="Duracion" value="<%=request.getParameter("Duracion")%>" required>

                <%

                    //DECODIFICATE TEXT
                    String Resumen = URLDecoder.decode(request.getParameter("Resumen"), "UTF-8");
                %>
                <label for="Resumen">Resumen:</label>
                <textarea name="Resumen" id="Resumen" cols="30" rows="10"><%=Resumen%></textarea>
                <input type="submit" name="BTN-MODIFICAR" value="MODIFICAR EPISODIO">
            </form>
        </section>

        <section class="RG IMG-3 IMG">
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
                <label>&copy; 2023 TVMaze.com</label>
                <br>
                <div class="copy">
                    <a href="https://www.tvmaze.com/site/copyright">Copyright Policy</a>
                    <a href="https://www.tvmaze.com/site/privacy">Privacy Policy</a>
                    <a href="https://www.tvmaze.com/site/tos">ToS</a>
                </div>
            </div>
            <script>

                var parametroCode_Serie = '<%= request.getParameter("Codigo_Temporada")%>'; // Asegúrate de que sea una cadena de texto
                var miSelect = document.getElementById('Temporada_ID');

                for (var i = 0; i < miSelect.options.length; i++) {
                    if (miSelect.options[i].value === parametroCode_Serie) {
                        miSelect.selectedIndex = i;
                        break;
                    }
                }
            </script>
    </body>
</html>
