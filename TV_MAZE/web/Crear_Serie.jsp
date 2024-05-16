<%-- 
    Document   : Crear_Serie
    Created on : 28 nov 2023, 7:24:12 p. m.
    Author     : FZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear Serie</title>
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
                <a href="Crear_Episodios.jsp">CREAR EPISODIOS</a>
                <a href="Crear_Temporada.jsp">CREAR TEMPORADAS</a>
            </nav>
        </header>

        <section class="LG">
            <form action="VA_Crear_Serie.jsp">
                <h2>CREAR SERIE</h2>
                <label for="Codigo">Código:</label>
                <input type="number" name="Codigo" id="Codigo" placeholder="Ingrese su codigo" required>

                <label for="Nombre">Nombre:</label>
                <input type="text" name="Nombre" id="Nombre" placeholder="Ingrese su nombre" required="">

                <label for="Resumen">Resumen:</label>
                <textarea name="Resumen" id="Resumen" cols="30" rows="10" required></textarea>

                <label for="Genero">Genero:</label>
                <select name="Genero" id="Genero">
                    <option value=""></option>
                    <option value="Ciencia Ficcion">Ciencia Ficcion</option>
                    <option value="Comedia">Comedia</option>
                    <option value="Romance">Romance</option>
                    <option value="Paranormal">Paranormal</option>
                    <option value="Hechos Reales">Basada en Hechos Reales</option>
                </select>

                <label for="Imagen">Imagen:</label>
                <input type="text" name="Imagen" id="Imagen" placeholder="Ingrese URL IMAGEN">            

                <label>Acceso a crear temporadas:</label>
                <div>
                    <input type="radio" name="CR_TEMP" value="S" required>SI
                    <input type="radio" name="CR_TEMP" value="N">NO
                </div>

                <input type="submit" name="name" value="CREAR SERIE">
            </form>
        </section>

        <section class="RG IMG-4">
            <div class="RG-CT">
                <h1>¿Quieres crear una serie en nuestra web?</h1>
                <p>
                    ¡Que estas esperandolo, creala en un instante!
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
