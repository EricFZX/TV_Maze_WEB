<%-- 
    Document   : Crear_Episodios
    Created on : 29 nov 2023, 10:52:27 a. m.
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
        <title>JSP Page</title>
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
            //Conexion con Web SERVICE
            MPQ.SERVER_Service service = new MPQ.SERVER_Service();
            MPQ.SERVER port = service.getSERVERPort();

        %>
        <header class="header">
            <img src="IMGS/tvm-header-logo.png" alt="">
            <nav>
                <a href="HOME.jsp">HOME</a>
                <a href="HOME.jsp">PORTAL</a>
                <a href="Crear_Serie.jsp">CREAR SERIES</a>
                <a href="Crear_Temporada.jsp">CREAR TEMPORADAS</a>
            </nav>
        </header>

        <section class="LG">
            <form action="VA_Crear_Episodio.jsp" id="FORM_Episodios">
                <h2>CREAR EPISODIOS</h2>
                <label>Serie:</label>
                <select id="Code-Serie" name="Code-Serie" onchange="cambiarURL(this.form)" >
                    <option value=""></option>
                    <%                        try {
                            //Dinamic Select
                            Dba db = new Dba(application.getRealPath("") + "/daw.mdb");
                            db.conectar();
                            //SQL Sentence
                            db.query.execute("SELECT Codigo,Nombre FROM Series");
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
                <label>Temporada:</label>
                <select id="Temporada_ID" name="Temporada_ID">
                    <option value=""></option>
                    <%
                        if (request.getParameter("Code-Serie") != null) {
                            try {
                                //Dinamic Select
                                Dba db = new Dba(application.getRealPath("") + "/daw.mdb");
                                db.conectar();
                                //SQL Sentence
                                db.query.execute("SELECT Codigo,Nombre FROM Temporadas WHERE Codigo_Serie='" + request.getParameter("Code-Serie") + "'");
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
                        }
                    %>
                </select>


                <label for="Codigo">Código:</label>
                <input type="number" id="Codigo" name="Codigo" placeholder="Ingrese su codigo" required>

                <label for="Nombre">Nombre:</label>
                <input type="text" id="Nombre" name="Nombre" placeholder="Ingrese su nombre" required>

                <label for="Duracion">Duracion:</label>
                <input type="time" name="Duracion" id="Duracion" required>

                <label for="Resumen">Resumen:</label>
                <textarea name="Resumen" id="Resumen" cols="30" rows="10"></textarea>
                <input type="submit" name="name" value="CREAR EPISODIO">
            </form>
        </section>

        <section class="RG IMG-3 IMG">
            <div class="RG-CT">
                <h1>CREA FANTASTICOS EPISODIOS</h1>
                <p>
                    ¡Crea Episodios de todas las nuevas series que estan disponibles y en tendencia!
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
        <script>
            //Funcion Setear Nuevamente un value predeterminado sin hacer el evento on change 
            var parametroCode_Serie = '<%= request.getParameter("Code-Serie")%>'; // Asegúrate de que sea una cadena de texto
            var miSelect = document.getElementById('Code-Serie');

            for (var i = 0; i < miSelect.options.length; i++) {
                if (miSelect.options[i].value === parametroCode_Serie) {
                    miSelect.selectedIndex = i;
                    break;
                }
            }
            function cambiarURL(formulario) {
                // Cambia la acción del formulario
                formulario.action = "/TV_MAZE/Crear_Episodios.jsp";
                // Envía el formulario automáticamente
                formulario.submit();
            }
        </script>      


    </body>
</html>
