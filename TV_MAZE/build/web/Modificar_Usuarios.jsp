<%-- 
    Document   : Modificar_Usuarios
    Created on : 23 nov 2023, 19:01:23
    Author     : FZ
--%>

<%@page import="database.Dba"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Usuario</title>
        <!-- CSS -->
        <link rel="stylesheet" href="FORMS_CS.css"/>
    </head>
    <body>
        <%
            //VALIDATE ONLY ADMIN CAN ENTER
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

                //Conexion BD
                Dba db = new Dba(application.getRealPath("") + "/daw.mdb");
                db.conectar();
                //Sentencia SQL
                db.query.executeUpdate("UPDATE Usuarios SET Nombre='"
                        + request.getParameter("Nombre") + "', "
                        + "Apellido='" + request.getParameter("Apellido") + "', "
                        + "Correo='" + request.getParameter("Correo") + "',"
                        + "Password='" + request.getParameter("Password") + "' "
                        + "WHERE Codigo='" + request.getParameter("Codigo") + "'");
                //Desconectar
                db.desconectar();
                out.print("<script>alert('¡REGISTRO ACTUALIZADO!');"
                        + "window.location.href='Manejo_Usuarios.jsp';</script>");
            }
        %>
        <%
            //Conexion con Web SERVICE
            MPQ.SERVER_Service service = new MPQ.SERVER_Service();
            MPQ.SERVER port = service.getSERVERPort();

        %>
        <!-- NAV -->
        <header class="header">
            <img src="IMGS/tvm-header-logo.png" alt="">
            <nav>
                <a href="HOME_ADMIN.jsp">PORTAL</a>
                <a href="Manejo_Usuarios.jsp">MANEJO DE USUARIOS</a>
                <a href="VA_Cerrar_Sesion.jsp">CERRAR SESIÓN</a>
            </nav>
        </header>
        <!-- LOGIN FORM -->
        <section class="left-PG IMG-2">
            <div class="left-CENTER">
                <!-- <h1>TV-MAZE</h1>
                <p>
                    ¡Bienvenido a TV-MAZE esperamos que tengas una excelente experiencia, y disfrutes de cada serie,
                    pelicula y comuniad de la mejor manera!
                </p> -->
                <h1>¡MODIFICA CON PRECAUCION!</h1>

            </div>
        </section>
        <section class="right-PG">
            <form action="Modificar_Usuarios.jsp" method="post">
                <h2 class="TITULO">MODIFICAR USUARIO</h2>
                <label for="Codigo">Codigo:</label>
                <input type="number" name="Codigo" id="Codigo"  value="<%=request.getParameter("Codigo")%>" readonly>

                <label for="Nombre">Nombre:</label>
                <input type="text" name="Nombre" id="Nombre" value="<%=request.getParameter("Nombre")%>" placeholder="Ingrese Nombre de Usuario" pattern="[a-zA-Z]+" title="¡Solo se aceptan letras!" required>

                <label for="Apellido">Apellido:</label>
                <input type="text" name="Apellido" id="Apellido" value="<%=request.getParameter("Apellido")%>" placeholder="Ingrese Apellido de Usuario" pattern="[a-zA-Z]+" title="¡Solo se aceptan letras!" required>

                <label for="Correo">Email:</label>
                <input type="email" id="Correo" name="Correo" value="<%=request.getParameter("Correo")%>" placeholder="Ingrese Email de Usuario" required>

                <label for="Password">Password:</label>
                <input type="password" name="Password" id="Password" value="<%=request.getParameter("Password")%>" placeholder="Ingrese Contraseña de Usuario" minlength="8" required>
                <div class="SE">
                    <button type="submit" name="BTN-MODIFICAR">ACTUALIZAR</button>
                </div>
            </form>
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
                <label>&copy; 2023 TVmaze.com</label>
                <br>
                <div class="copy">
                    <a href="https://www.tvmaze.com/site/copyright">Copyright Policy</a>
                    <a href="https://www.tvmaze.com/site/privacy">Privacy Policy</a>
                    <a href="https://www.tvmaze.com/site/tos">ToS</a>
                </div>
            </div>
        </div>
    </body>
</body>
</html>
