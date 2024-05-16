<%-- 
    Document   : Crear_Temporada
    Created on : 29 nov 2023, 9:44:08 a. m.
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
        <title>Crear Temporadaa</title>
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
                <a href="HOME_ADMIN.jsp">PORTAL</a>
                <a href="Crear_Serie.jsp">CREAR SERIES</a>
                <a href="Crear_Episodios.jsp">CREAR EPISODIOS</a>
            </nav>
        </header>

        <section class="LG">
            <form action="VA_Crear_Temporada.jsp">
                <h2>CREAR TEMPORADAS</h2>
                <label>Serie:</label>
                <select id="Code-Serie" name="Code-Serie">
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

                <label for="Codigo">Código:</label>
                <input type="number" id="Codigo" name="Codigo" placeholder="Ingrese su codigo" required>

                <label for="Nombre">Nombre:</label>
                <input type="text" id="Nombre" name="Nombre" placeholder="Ingrese el nombre" required> 

                <label>Acceso a crear Episodios:</label>
                <div>
                    <input type="radio" name="Crear_EP" value="S" required>SI
                    <input type="radio" name="Crear_EP" value="N">NO
                    <p></p>
                </div>
                <input type="submit" name="BTN" value="CREAR TEMPORADA">
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
